/*===================================
Supermarket Sales Database Setup
===================================
Purpose:
Initialize a clean instance of the `supermarketsales` database by removing any existing version, creating a new one, and establishing required schemas.

Reason:
To ensure a fresh environment for data ingestion and transformation, which is particularly useful for development, testing, or reprocessing workflows.

Any other useful info:
- Uses `SINGLE_USER` mode with rollback to avoid locking issues when dropping the database.
- Creates two schemas:
  - `bronze`: typically used for raw or staging data.
  - `sales`: typically used for transformed or business-level data.
--------------------------------------------------------------*/

USE master;

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'supermarketsales')
	BEGIN
	ALTER DATABASE supermarketsales SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE supermarketsales;
END;
GO

CREATE DATABASE supermarketsales;
GO

CREATE SCHEMA bronze;
GO

CREATE SCHEMA sales;
