DECLARE @pathName NVARCHAR(512) 
SET @pathName = '\\192.168.56.101\winsmb\SQL SERVER\SQL SERVER' + '_PYRAMID_' + Convert(varchar(8), GETDATE(), 112) + '.bak' 
BACKUP DATABASE [Pyramid] TO  DISK = @pathName WITH NOFORMAT, NOINIT,  NAME = N'Pyramid-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
