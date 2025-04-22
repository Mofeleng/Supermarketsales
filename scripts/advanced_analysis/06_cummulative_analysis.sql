/*===================================
Cumulative Sales Calculation
===================================
Purpose: 
This query calculates the cumulative profit by month and average moving average of sales

Reason: 
The cumulative sales provide insight into how the total profit has accumulated over time, showing the trend of sales performance.

Any other useful info:
It uses a window function to sum the gross income (profit) for each month, and then accumulates this total profit over the months in a running total.
--------------------------------------------------------------*/
--- Cummulative sales
SELECT
	mnth,
	ROUND(SUM(total_profit) OVER (ORDER BY mnth), 2) AS cummulative_profit
FROM 
	(
		SELECT
		MONTH(date) AS mnth,
		SUM(gross_income) AS total_profit
		FROM sales.supermarketsales
		GROUP BY MONTH(date)
	) t

-- Moving average sales
SELECT
	mnth,
	ROUND(AVG(total_profit) 
	OVER (
			ORDER BY mnth
			ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
		 ), 2) AS mov_avg_profit
FROM 
	(
		SELECT
		MONTH(date) AS mnth,
		SUM(gross_income) AS total_profit
		FROM sales.supermarketsales
		GROUP BY MONTH(date)
	) t
