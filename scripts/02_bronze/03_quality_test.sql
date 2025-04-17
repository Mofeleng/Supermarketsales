/*===================================
Data Quality Checks & Cleaning – Supermarket Sales
===================================
Purpose:
Perform initial data quality checks and basic cleaning on the `bronze.supermarketsales` table to ensure data integrity before further processing.

Reason:
To validate that key fields such as `invoice_id`, `city`, `customer_type`, `gender`, and `product_line` are properly standardized and contain no anomalies like white spaces, nulls, or duplicates.

Any other useful info:
- Checked for and confirmed absence of leading/trailing white spaces and duplicates in `invoice_id`.
- Verified standardization for categorical fields (`city`, `customer_type`, `gender`, `product_line`), with no issues found.
- Cardinality checks on `customer_type` and `product_line` returned expected distinct values.
- Date field (`date`) required formatting cleanup: raw dates had to be stripped of slashes and converted using `CONVERT(DATE, ..., 101)`.
- No records had invalid or null formatted dates after cleaning.
- Overall, the dataset was clean except for the date formatting, which has been resolved.
--------------------------------------------------------------*/

/*==========================================
Cleaning IDs
============================================*/
--- Checking for white spaces in the ids
SELECT *
FROM bronze.supermarketsales
WHERE invoice_id != TRIM(invoice_id);

--- No whitespaces
--- Checking for null or duplicate values
SELECT 
invoice_id,
COUNT(*) AS duplicates
FROM bronze.supermarketsales
GROUP BY invoice_id
HAVING COUNT(*) > 1 OR invoice_id IS NULL;

-- No duplicates or null values

--- Data normalization and standardization
--- City
SELECT city
FROM bronze.supermarketsales
WHERE city != TRIM(city);
--- Customer type
SELECT customer_type
FROM bronze.supermarketsales
WHERE customer_type != TRIM(customer_type);
--- Gender
SELECT gender
FROM bronze.supermarketsales
WHERE gender != TRIM(gender);
--- Productline
SELECT product_line
FROM bronze.supermarketsales
WHERE product_line != TRIM(product_line);

--Check cardinality
SELECT DISTINCT customer_type
FROM bronze.supermarketsales;

SELECT DISTINCT product_line
FROM bronze.supermarketsales;

-- No cardinality and standardization issues
SELECT
	CAST(format_date AS INT) AS format_date
FROM (
	SELECT 
		date,
		REPLACE(date, '/', '') AS format_date
	FROM bronze.supermarketsales
) t
WHERE CAST(format_date AS INT) <= 0 OR CAST(format_date AS INT) IS NULL;

-- No < 0 or null format dates
SELECT
	LEN(format_date) AS lenght
FROM (
	SELECT 
		date,
		REPLACE(date, '/', '') AS format_date
	FROM bronze.supermarketsales
) t
WHERE LEN(format_date) < 6;
-- no dates have a length less than 6

SELECT
date,
CONVERT(DATE, date, 101) AS formatted_date
FROM bronze.supermarketsales;
