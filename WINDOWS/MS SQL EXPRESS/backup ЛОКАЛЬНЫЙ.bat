@echo off
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined mydate set mydate=%%x
set mydate=%mydate:~0,4%-%mydate:~4,2%-%mydate:~6,2%

sqlcmd -S SIT006\SQLEXPRESS -U sa -P 69176917 -i schedule.sql

"C:\Program Files\7-Zip\7z" a -tzip "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\SQL SERVER\db_backup_%mydate%.zip" "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\SQL SERVER\NAME_*.bak"
"C:\Program Files\7-Zip\7z" a -tzip "C:\virtyalka\ot_windows\db_backup_%mydate%.zip" "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\SQL SERVER\NAME_*.bak"

del "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\SQL SERVER\NAME_*.bak"
