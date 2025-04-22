/*=====================================================
Monthly Sales Performance & Customer Sentiment Analysis
=====================================================
Objective:
Evaluate monthly trends in profit, transactions, and customer satisfaction to identify performance patterns.

Breakdown:
1. Monthly Profit:
   • Profit increases with the number of transactions.
   • Suggests volume of sales is a key profit driver.

2. Monthly Transactions:
   • Fluctuate across the 3-month period, but align with profit trends.

3. Monthly Ratings:
   • No clear correlation with profit or transaction volume.
   • The lowest-profit month had the highest average rating.
   • Indicates that high customer satisfaction doesn’t always mean high sales.

4. Product Line Ratings by Month:
   • No consistent trends across product lines.
   • Customer preferences and satisfaction appear to fluctuate without clear cause.
   • Suggests that rating behavior may be subjective or influenced by short-term factors.

Conclusion:
Short-term data reveals that:
   • Profit is primarily driven by sales volume.
   • Ratings do not show strong patterns or predict profitability within this timeframe.
   • A longer time series may be needed to extract stable customer sentiment trends.

Next Steps:
   • Explore seasonality with larger datasets.
   • Analyze correlations between product categories and repeat customers.
   • Optional: conduct customer-level satisfaction vs. spending analysis if available.
------------------------------------------------------------*/
-- Profit by month
SELECT
	t.mnth,
	ROUND(SUM(t.gross_income), 2) AS total_profit
FROM 
 (
	SELECT 
	MONTH(date) AS mnth,
	gross_income
FROM sales.supermarketsales
) t
GROUP BY t.mnth
ORDER BY t.mnth ASC

-- Number of transactions per month
SELECT 
	t.mnth,
	COUNT(t.invoice_id) AS transactions
FROM 
 (
	SELECT 
	MONTH(date) AS mnth,
	invoice_id
FROM sales.supermarketsales
) t
GROUP BY t.mnth
ORDER BY t.mnth ASC

--- there seems to be correlation, the more transactions the more profit. Is there also a correlation in ratings?
--- Avg ratings per month
SELECT 
	t.mnth,
	ROUND(AVG(t.rating), 2) AS avg_ratings
FROM 
 (
	SELECT 
	MONTH(date) AS mnth,
	rating
FROM sales.supermarketsales
) t
GROUP BY t.mnth
ORDER BY t.mnth ASC
--- on a month to month basis, ratings have no bearing on profit, the month with the least amount of profit and transactions has the highest ratings, perhaps the products sold affects rating more than transactions.
--- Product line ratings per month
SELECT 
	t.mnth,
	ROUND(AVG(t.rating), 2) AS ratings,
	t.product_line,
	COUNT(t.product_line) AS total_product_line_sold
FROM 
 (
	SELECT 
	MONTH(date) AS mnth,
	rating,
	product_line
FROM sales.supermarketsales
) t
GROUP BY t.mnth, t.product_line
ORDER BY t.mnth ASC, ROUND(AVG(t.rating), 2) DESC
-- There appears to be no specific trends among ratings in the short term, it seems like customer tastes and expectations just flactuate, we would need more data to see if a trend truly exists
-- Not doing cogs analysis mainly because all other metrics consistently show that company makes profit and has a constant profit margin for all transactions, and product lines
