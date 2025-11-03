# 💀 SQL Server Kill Active Sessions by Database – `db_name_spid_kill`

![SQL Server](https://img.shields.io/badge/SQL%20Server-KILL%20Sessions-red?logo=microsoftsqlserver)
![Language](https://img.shields.io/badge/Language-TSQL-purple)
![Category](https://img.shields.io/badge/Category-Database%20Admin-yellow)
![License](https://img.shields.io/badge/License-MIT-green)
![Author](https://img.shields.io/badge/Author-Mahdi%20Lorvand-orange)

A powerful and safe T-SQL stored procedure that **automatically kills all active SPIDs** connected to a specific database — except your current session.  
Perfect for **maintenance, restore operations, or exclusive access** requirements.

---

## 🌐 Languages
- 🇮🇷 [فارسی](#-نسخه-فارسی)
- 🇬🇧 [English](#-english-version)
- 🇸🇦 [العربية](#-الإصدار-العربي)

---

## 🇮🇷 نسخه فارسی

### 🧠 معرفی  
پروسیجر `db_name_spid_kill` برای بستن تمامی Sessionهای فعال روی یک دیتابیس خاص طراحی شده است (به‌جز سشن فعلی).  
ابزار بسیار مفید برای زمان‌هایی مثل:
- ری‌استور یا بکاپ دیتابیس  
- انجام تغییرات ساختاری  
- رفع خطای "Database is in use"  

---

### 🚀 ویژگی‌ها  
✅ شناسایی خودکار Sessionهای فعال  
✅ بستن تمام کانکشن‌ها به‌جز سشن فعلی  
✅ جلوگیری از خطای دسترسی همزمان  
✅ مناسب برای DBAها و DevOps تیم‌ها  

---

### 🧾 نحوه استفاده  
```sql
USE master;
EXEC db_name_spid_kill @db_name = N'Northwind';
📌 بعد از اجرا، تمام SPIDهای متصل به دیتابیس Northwind به‌صورت خودکار Kill می‌شوند.

⚙️ نکات فنی
از sys.dm_exec_sessions برای تشخیص SPIDهای مرتبط با دیتابیس استفاده شده.

از Dynamic SQL برای اجرای دستور KILL به‌صورت ایمن بهره می‌برد.

Session جاری (@@SPID) در فرآیند حذف نمی‌شود.

💡 نمونه خروجی لاگ
sql
Copy code
KILL 53; KILL 54; KILL 57;
(در پس‌زمینه توسط EXEC اجرا می‌شود)

🧑‍💻 نویسنده
مهدی لوروند (Mahdi Lorvand)
💼 Helpdesk & VoIP Expert | SQL Learner | IT Enthusiast
📧 mehdilorvand92@gmail.com
🔗 LinkedIn

🇬🇧 English Version
🧠 Overview
The procedure db_name_spid_kill kills all active user sessions (SPIDs) connected to a given database, except your current one.
Useful for:

Database restore operations

Structural updates

Preventing "Database in use" errors

🚀 Features
✅ Automatically finds and kills all sessions of a target DB
✅ Excludes the current SPID from termination
✅ Prevents connection conflicts during maintenance
✅ Safe for production when used carefully

🧾 Usage Example
sql
Copy code
USE master;
EXEC db_name_spid_kill @db_name = N'Northwind';
The script will internally generate and execute a list of KILL commands:

sql
Copy code
KILL 53; KILL 54; KILL 57;
⚙️ Technical Notes
Uses the DMV sys.dm_exec_sessions to identify active connections.

Builds a dynamic SQL string with multiple KILL statements.

Executes all kills in a single batch via EXEC(@kill).

🧑‍💻 Author
Mahdi Lorvand
💼 Helpdesk & VoIP Expert | SQL Learner | IT Enthusiast
📧 mehdilorvand92@gmail.com
🔗 LinkedIn

🇸🇦 الإصدار العربي
🧠 المقدّمة
الإجراء المخزّن db_name_spid_kill يقوم بإغلاق جميع الجلسات (SPIDs) النشطة في قاعدة بيانات محددة — ما عدا الجلسة الحالية.
مفيد أثناء:

استعادة النسخ الاحتياطية

عمليات الصيانة

تفادي خطأ "Database in use"

🚀 المميزات
✅ يغلق جميع الجلسات المتصلة بقاعدة البيانات المحددة
✅ يستثني الجلسة الحالية
✅ يمنع التعارض أثناء أعمال الصيانة
✅ يعتمد على استعلام ديناميكي آمن

🧾 طريقة الاستخدام
sql
Copy code
USE master;
EXEC db_name_spid_kill @db_name = N'Northwind';
⚙️ ملاحظات فنية
يعتمد على sys.dm_exec_sessions لاكتشاف الـ SPIDs.

ينشئ أوامر KILL ديناميكيًا ويشغّلها دفعة واحدة.

لا يؤثر على جلسة المستخدم الحالية.

🧑‍💻 المؤلف
مهدي لورفند (Mahdi Lorvand)
💼 خبير دعم فني وVoIP | متعلّم SQL | مهتم بتقنية المعلومات
📧 mehdilorvand92@gmail.com
🔗 LinkedIn

🪪 License
MIT License — Free to use, modify, and share with attribution.

⭐️ Support
If this script helped you, please give it a ⭐️ on GitHub or share it with your DBA team!

yaml
Copy code
