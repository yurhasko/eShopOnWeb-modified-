USE [master]
GO
EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE',
     N'Software\Microsoft\MSSQLServer\MSSQLServer',
     N'LoginMode', REG_DWORD, 2
GO
 
USE [master]
 
CREATE LOGIN cuser
WITH PASSWORD = '1',
DEFAULT_DATABASE = [Microsoft.eShopOnWeb.CatalogDb],
CHECK_EXPIRATION = OFF,
CHECK_POLICY = OFF;
 
use [Microsoft.eShopOnWeb.CatalogDb]
create user cuser from login cuser;
use [Microsoft.eShopOnWeb.CatalogDb]
exec sp_addrolemember 'db_owner', cuser;
 
USE [master]
 
CREATE LOGIN iuser
WITH PASSWORD = '1',
DEFAULT_DATABASE = [Microsoft.eShopOnWeb.Identity],
CHECK_EXPIRATION = OFF,
CHECK_POLICY = OFF;
 
use [Microsoft.eShopOnWeb.Identity]
create user iuser from login iuser;
use [Microsoft.eShopOnWeb.Identity]
exec sp_addrolemember 'db_owner', iuser;

exit
