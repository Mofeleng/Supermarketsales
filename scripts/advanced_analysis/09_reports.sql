/*===================================
Sales Summary Views for Branches A, B, and C
===================================
Purpose: 
Create views for sales data summaries across all branches and individual branches (A, B, and C).

Reason:
These views provide an easy way to access the summarized sales data, including profit, quantity, and other relevant metrics, specifically for each branch as well as for all branches together.

Any other useful info:
- The `sales_summary` view aggregates data for all branches.
- Branch-specific views (`branch_a_sales_summary`, `branch_b_sales_summary`, `branch_c_sales_summary`) filter the data for individual branches.
- Useful for reporting, comparison, and branch-specific analysis without needing to filter repeatedly.

--------------------------------------------------------------*/


CREATE VIEW sales_summary AS (
	SELECT
		invoice_id,
		branch,
		customer_type,
		product_line,
		unit_price,
		quantity,
		tax_5_percent,
		total,
		cogs,
		gross_income,
		date,
		rating
	FROM sales.supermarketsales
);
GO
CREATE VIEW branch_a_sales_summary AS (
	SELECT
		invoice_id,
		branch,
		customer_type,
		product_line,
		unit_price,
		quantity,
		tax_5_percent,
		total,
		cogs,
		gross_income,
		date,
		rating
	FROM sales.supermarketsales
	WHERE branch = 'A'
);
GO
CREATE VIEW branch_b_sales_summary AS (
	SELECT
		invoice_id,
		branch,
		customer_type,
		product_line,
		unit_price,
		quantity,
		tax_5_percent,
		total,
		cogs,
		gross_income,
		date,
		rating
	FROM sales.supermarketsales
	WHERE branch = 'B'
);
GO
CREATE VIEW branch_c_sales_summary AS (
	SELECT
		invoice_id,
		branch,
		customer_type,
		product_line,
		unit_price,
		quantity,
		tax_5_percent,
		total,
		cogs,
		gross_income,
		date,
		rating
	FROM sales.supermarketsales
	WHERE branch = 'C'
);
