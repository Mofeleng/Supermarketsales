/*===================================
Transform and Load Cleaned Sales Data
===================================
Purpose:
Insert cleaned and transformed records from the `bronze.supermarketsales` table into the `sales.supermarketsales` table.

Reason:
To move data from the raw (bronze) layer to the curated (sales) layer after applying necessary transformations such as date formatting and column renaming.

Any other useful info:
- `date` is converted from `NVARCHAR` to proper `DATE` format using style 101 (MM/DD/YYYY).
- `tax` column is renamed to `tax_5_percent` for clarity in the context of business logic.
- This step finalizes the ETL process by populating the analysis-ready `sales` schema.
--------------------------------------------------------------*/
INSERT INTO sales.supermarketsales (
	invoice_id,
	branch,
	city,
	customer_type,
	gender,
	product_line,
	unit_price,
	quantity,
	tax_5_percent,
	total,
	date,
	time,
	payment,
	cogs,
	gross_margin_percentage,
	gross_income,
	rating
)

SELECT 
	invoice_id,
	branch,
	city,
	customer_type,
	gender,
	product_line,
	ROUND(unit_price, 2) AS unit_price,
	quantity,
	ROUND(tax, 2) AS tax_5_percent,
	ROUND(total, 2) AS total,
	CONVERT(DATE, date, 101) AS date,
	time,
	payment,
	ROUND(cogs, 2) AS cogs,
	ROUND(gross_margin_percentage, 2) AS gross_margin_percentage,
	ROUND(gross_income, 2) AS gross_income,
	rating
FROM bronze.supermarketsales;
