/*===================================
Monthly Profit Performance Classification
===================================
Purpose: 
Classify each month's total profit as "Above", "Below", or "Break-even" compared to the overall average monthly profit.

Reason: 
This analysis helps identify which months are outperforming, underperforming, or performing at the average level in terms of profitability.

Any other useful info:
- Uses nested subqueries to first calculate monthly total profit.
- Computes the overall average profit across all months using a window function.
- Applies conditional logic to compare each month's profit with the average and assign a performance label.
--------------------------------------------------------------*/
SELECT
	*,
	CASE WHEN total_profit > avg_profit THEN 'Above'
		 WHEN total_profit = avg_profit THEN 'Break-even'
		 ELSE 'Below'
	END AS outcome
FROM 
	(
	SELECT
		mnth,
		ROUND(total_profit, 2) AS total_profit,
		ROUND(AVG(total_profit) OVER (), 2) AS avg_profit
	FROM 
		(
			SELECT
			MONTH(date) AS mnth,
			SUM(gross_income) AS total_profit
			FROM sales.supermarketsales
			GROUP BY MONTH(date)
		) t
	) AS subq
