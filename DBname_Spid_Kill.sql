CREATE OR ALTER PROCEDURE db_name_spid_kill 
    @db_name NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @kill NVARCHAR(MAX) = '';
    DECLARE @spid INT;

    DECLARE spid_cursor CURSOR FOR
        SELECT session_id 
        FROM sys.dm_exec_sessions 
        WHERE database_id = DB_ID(@db_name)
          AND session_id <> @@SPID;

    OPEN spid_cursor;
		FETCH NEXT FROM spid_cursor INTO @spid;
		WHILE @@FETCH_STATUS = 0
			BEGIN
			SET @kill += 'KILL ' + CAST(@spid AS NVARCHAR(10)) + '; ';
			FETCH NEXT FROM spid_cursor INTO @spid;
			END

    CLOSE spid_cursor;
    DEALLOCATE spid_cursor;

    IF @kill <> ''
    BEGIN
        EXEC(@kill);
    END
END
GO

EXECUTE db_name_spid_kill @db_name = N'Northwind'