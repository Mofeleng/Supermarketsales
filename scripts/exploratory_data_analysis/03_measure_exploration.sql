/*===================================
Sales Measures Summary
===================================
Purpose:
Aggregate and analyze key performance indicators (KPIs) from the `sales.supermarketsales` dataset.

Reason:
Provides a high-level overview of business performance across the dataset period. 
Key metrics include:
- Average unit price
- Total quantity of products sold
- Total value-added tax (5%)
- Total revenue (including VAT)
- Total cost of goods sold (COGS)
- Total gross income (profit)
- Customer satisfaction via ratings (min, avg, max)

Any other useful info:
These foundational metrics are critical for financial analysis, profitability assessments, and guiding business decisions.
--------------------------------------------------------------*/

--- Our measures are unit_price, quantity, tax_5_percent, total, cogs, gross_income, & rating
----Let's see:
-- The avg unit price
SELECT AVG(unit_price) AS avg_unit_price
FROM sales.supermarketsales;

-- Total quantity sold
SELECT SUM(quantity) AS total_quantity
FROM sales.supermarketsales;

-- Total value added tax
SELECT SUM(tax_5_percent) AS total_vat
FROM sales.supermarketsales;

-- total Revenue(incl. vat)
SELECT SUM(total) AS total_revenue
FROM sales.supermarketsales;

--- Total cost of goods
SELECT SUM(cogs) AS total_cogs
FROM sales.supermarketsales;

-- Total profts
SELECT 
SUM(gross_income) AS total_profit
FROM sales.supermarketsales;

--ratings
SELECT 
	MIN(rating) AS min_ratings,
	AVG(rating) AS avg_ratings,
	MAX(rating) AS max_ratings
FROM sales.supermarketsales;
