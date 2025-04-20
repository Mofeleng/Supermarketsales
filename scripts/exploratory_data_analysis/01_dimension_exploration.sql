/*===================================
Dimensions exploration
===================================
Purpose:
Gain a high-level understanding of the structure and unique values within key categorical fields in the `sales.supermarketsales` table.

Reason:
To identify dimensions such as branches, cities, customer types, product lines, and payment methods, which can be used for grouping, aggregation, and insightful visualizations.

Any other useful info:
- Found 3 unique branches and 3 cities; each branch appears to operate in a different city, making "city" more meaningful for geographic segmentation.
- Gender, customer type, and payment method fields contain expected categories, useful for demographic and behavioral analysis.
- Product lines (6 distinct) are a strong candidate for inventory and sales trend analysis by location or customer segment.
--------------------------------------------------------------*/
SELECT DISTINCT branch
FROM sales.supermarketsales;
-- We have 3 branches, we could consider grouping aggregates by branches

SELECT DISTINCT city 
FROM sales.supermarketsales;
--- There are also 3 different cities. It seems like each branch is in a different city

SELECT city, branch
FROM sales.supermarketsales
WHERE branch = 'A';
-- Its starting to seem like the branch column is a bit redundant, we could just separate the data by cities, which is useful for geographic visualisations. Maybe we need them for numbering

SELECT DISTINCT gender
FROM sales.supermarketsales;
-- male & female

SELECT DISTINCT product_line
FROM sales.supermarketsales;
--- 6 product lines, we could try to see which product lines are popular in each city/branch, this could be useful info for inventory management

SELECT DISTINCT payment
FROM sales.supermarketsales;
-- 3 different payment methods.

SELECT DISTINCT customer_type
FROM sales.supermarketsales;
--- Member & normal customers
