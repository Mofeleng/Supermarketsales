/*===================================
Create Raw Supermarket Sales Table
===================================
Purpose:
Create the `bronze.supermarketsales` table to store raw transactional data related to supermarket sales.

Reason:
This table acts as the staging area for raw data ingestion before any transformations or business logic are applied. It supports the ETL process by preserving the original data format.

Any other useful info:
- Drops the table if it already exists to ensure clean re-creation.
- The `bronze` schema typically holds unprocessed or minimally processed data.
- Data types like `FLOAT` and `NVARCHAR` are used to match source data flexibility.
--------------------------------------------------------------*/
IF OBJECT_ID ('bronze.supermarketsales', 'U') IS NOT NULL
	DROP TABLE bronze.supermarketsales;

CREATE TABLE bronze.supermarketsales (
	invoice_id NVARCHAR(50),
	branch NVARCHAR(50),
	city NVARCHAR(50),
	customer_type NVARCHAR(50),
	gender NVARCHAR(50),
	product_line NVARCHAR(50),
	unit_price FLOAT,
	quantity INT,
	tax FLOAT,
	total FLOAT,
	date NVARCHAR(50),
	time TIME,
	payment NVARCHAR(50),
	cogs FLOAT,
	gross_margin_percentage FLOAT,
	gross_income FLOAT,
	rating FLOAT
);
