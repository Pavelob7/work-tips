@echo off
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined mydate set mydate=%%x
set mydate=%mydate:~0,4%-%mydate:~4,2%-%mydate:~6,2%

sqlcmd -S SIT006\SQLEXPRESS -U sa -P 69176917 -i schedule.sql

"C:\Program Files\7-Zip\7z" a -tzip "\\192.168.56.101\winsmb\SQL SERVER\SMB_backup_%mydate%.zip" "\\192.168.56.101\winsmb\SQL SERVER\SQL SERVER_PYRAMID_*.bak"
del "\\192.168.56.101\winsmb\SQL SERVER\SQL SERVER_PYRAMID_*.bak"
