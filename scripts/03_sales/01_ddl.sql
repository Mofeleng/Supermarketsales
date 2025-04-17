/*===================================
Create Clean Supermarket Sales Table
===================================
Purpose:
Drop and create the `sales.supermarketsales` table to store cleaned and standardized sales data ready for analysis and reporting.

Reason:
To separate raw data from curated data within the ETL pipeline. This clean version of the dataset is structured for business intelligence and analytical use cases.

Any other useful info:
- Resides in the `sales` schema, which holds processed and analysis-ready data.
- The `date` column is explicitly cast to `DATE` (unlike the raw `NVARCHAR` in `bronze`) for improved querying and time-based analysis.
- Matches cleaned data structure output after quality checks and transformation.
--------------------------------------------------------------*/
IF OBJECT_ID ('sales.supermarketsales', 'U') IS NOT NULL
	DROP TABLE sales.supermarketsales;

CREATE TABLE sales.supermarketsales (
	invoice_id NVARCHAR(50),
	branch NVARCHAR(50),
	city NVARCHAR(50),
	customer_type NVARCHAR(50),
	gender NVARCHAR(50),
	product_line NVARCHAR(50),
	unit_price FLOAT,
	quantity INT,
	tax_5_percent FLOAT,
	total FLOAT,
	date DATE,
	time TIME,
	payment NVARCHAR(50),
	cogs FLOAT,
	gross_margin_percentage FLOAT,
	gross_income FLOAT,
	rating FLOAT
);


