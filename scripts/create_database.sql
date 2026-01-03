/*
=============================================================
CREATION OF DATABSE SCHEMA
=============================================================

This Script Create a database with the name "Datawarehouse". If the Databse
exists, it drops it and recreate it. The script also create along with the
Database three Schemas named Bronze, Solver and Gold


WARNING! Peoceed with caution ensure you have a proper backup plan before
you run this script. If you run this script, it will wipe out the existing
Database incuding the Schemas and the contents
*/

USE master;
GO

-- Create and recreate Datawarehouse Database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Datawarehouse')
BEGIN
	ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE Datawarehouse;
END;

CREATE DATABASE Datawarehouse;

USE Datawarehouse;
GO
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
