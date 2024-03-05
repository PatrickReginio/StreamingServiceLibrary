--///ACCESS CONTROL (DCL)///
--//Database Admin//
--CREATE role.
USE StreamingServiceLibrary;
CREATE ROLE DatabaseAdmin;


--CREATE users for specific roles.
USE master;
CREATE LOGIN adminpatrick WITH PASSWORD = 'adminpatrickpassword';
USE StreamingServiceLibrary;
CREATE USER admin FOR LOGIN adminpatrick;


--GRANT permissions to specific roles.
USE StreamingServiceLibrary
GRANT CREATE PROCEDURE, CREATE TABLE, EXECUTE, SELECT, INSERT, UPDATE, DELETE TO DatabaseAdmin;

EXEC sp_addrolemember 'DatabaseAdmin', 'admin';


--------------------------------------------------------------------------------------------------------------------
--//Content Manager//
--CREATE roles.
USE StreamingServiceLibrary;
CREATE ROLE ContentManager;


--CREATE users for specific roles.
USE master;
CREATE LOGIN contentmanageralex WITH PASSWORD = 'contentmanageralexpassword';
USE StreamingServiceLibrary;
CREATE USER contentmanager#1 FOR LOGIN contentmanageralex;

USE master
CREATE LOGIN contentmanagermegan WITH PASSWORD = 'contentmanagermeganpassword';
USE StreamingServiceLibrary;
CREATE USER contentmanager#2 FOR LOGIN contentmanagermegan;

USE master
CREATE LOGIN contentmanagerjordan WITH PASSWORD = 'contentmanagerjordanpassword';
USE StreamingServiceLibrary;
CREATE USER contentmanager#3 FOR LOGIN contentmanagerjordan;


--GRANT permissions to specific roles.
USE StreamingServiceLibrary;
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON SCHEMA:: content TO ContentManager;

EXEC sp_addrolemember 'ContentManager', 'contentmanager#1';
EXEC sp_addrolemember 'ContentManager', 'contentmanager#2';
EXEC sp_addrolemember 'ContentManager', 'contentmanager#3';


--------------------------------------------------------------------------------------------------------------------
--//Service Manager//
--CREATE roles.
USE StreamingServiceLibrary;
CREATE ROLE ServiceManager;


--CREATE users for specific roles.
USE master;
CREATE LOGIN servicemanageremily WITH PASSWORD = 'servicemanageremilypassword';
USE StreamingServiceLibrary;
CREATE USER servicemanager#1 FOR LOGIN servicemanageremily;

USE master;
CREATE LOGIN servicemanagerderek WITH PASSWORD = 'servicemanagerderekpassword';
USE StreamingServiceLibrary;
CREATE USER servicemanager#2 FOR LOGIN servicemanagerderek;


--GRANT permissions to specific roles.
USE StreamingServiceLibrary;
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON SCHEMA:: service TO ServiceManager;

EXEC sp_addrolemember 'ServiceManager', 'servicemanager#1';
EXEC sp_addrolemember 'ServiceManager', 'servicemanager#2';


--------------------------------------------------------------------------------------------------------------------
--//Members//
--CREATE roles.
USE StreamingServiceLibrary;
CREATE ROLE Members;

--CREATE users for specific roles.
USE master;
CREATE LOGIN membersophia WITH PASSWORD = 'membersophiapassword';
USE StreamingServiceLibrary;
CREATE USER member#1 FOR LOGIN membersophia;

USE master;
CREATE LOGIN memberliam WITH PASSWORD = 'memberliampassword';
USE StreamingServiceLibrary;
CREATE USER member#2 FOR LOGIN memberliam;

USE master;
CREATE LOGIN memberava WITH PASSWORD = 'memberavapassword';
USE StreamingServiceLibrary;
CREATE USER member#3 FOR LOGIN memberava;

USE master;
CREATE LOGIN memberethan WITH PASSWORD = 'memberethanpassword';
USE StreamingServiceLibrary;
CREATE USER member#4 FOR LOGIN memberethan;

USE master;
CREATE LOGIN memberolivia WITH PASSWORD = 'memberoliviapassword';
USE StreamingServiceLibrary;
CREATE USER member#5 FOR LOGIN memberolivia;


--GRANT permissions to specific roles.
USE StreamingServiceLibrary;
GRANT SELECT ON SCHEMA:: content TO Members;
GRANT SELECT ON SCHEMA:: service TO Members;
GRANT SELECT ON SCHEMA:: dbo TO Members

EXEC sp_addrolemember 'Members', 'member#1';
EXEC sp_addrolemember 'Members', 'member#2';
EXEC sp_addrolemember 'Members', 'member#3';
EXEC sp_addrolemember 'Members', 'member#4';
EXEC sp_addrolemember 'Members', 'member#5';