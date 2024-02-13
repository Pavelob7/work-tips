DECLARE @pathName NVARCHAR(512) 
SET @pathName = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\SQL SERVER\MY_DB_' + 'SQLSERVER_' + Convert(varchar(8), GETDATE(), 112) + '.bak'
BACKUP DATABASE [MY_DB] TO  DISK = @pathName WITH NOFORMAT, NOINIT,  NAME = N'MY-DB-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

