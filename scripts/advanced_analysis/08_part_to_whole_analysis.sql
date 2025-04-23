/*===================================
Part-to-Whole Profit and Ratings Analysis
===================================
Purpose: 
Determine how different categorical dimensions (branch, payment type, customer type) contribute to total profit and average rating.

Reason:
This analysis provides insights into the proportional impact each category has on the whole, helping identify high-performing contributors.

Any other useful info:
- Uses window functions to calculate total profit or average rating across the dataset.
- Calculates the percentage contribution of each category to the overall figure.
- Applies to branches, payment types, and customer types for profit; and branches for ratings.
- Helps uncover whether certain categories dominate or if distributions are relatively even.

--------------------------------------------------------------*/
-- Branch sales to total sales
SELECT
	*,
	SUM(branch_profit) OVER () AS total_profit,
	CONCAT(ROUND((branch_profit/SUM(branch_profit) OVER()), 2) * 100, '%') AS percent_of_profit
FROM
(
	SELECT
		branch,
		SUM(gross_income) AS branch_profit
	FROM sales.supermarketsales
	GROUP BY branch
) t

-- Branch ratings to total ratings
SELECT
	*,
	ROUND(SUM(avg_branch_rating) OVER (), 2) AS total_avg_rating,
	CONCAT(ROUND((avg_branch_rating/SUM(avg_branch_rating) OVER()), 2) * 100, '%') AS percent_of_total_avg_rating
FROM
(
	SELECT
		branch,
		ROUND(AVG(rating), 2) AS avg_branch_rating
	FROM sales.supermarketsales
	GROUP BY branch
) t


--- payment type to total profit
SELECT
	*,
	SUM(branch_profit) OVER () AS total_profit,
	CONCAT(ROUND((branch_profit/SUM(branch_profit) OVER()), 2) * 100, '%') AS percent_of_profit
FROM
(
	SELECT
		payment AS payment_type,
		SUM(gross_income) AS branch_profit
	FROM sales.supermarketsales
	GROUP BY payment
) t

--- customer type to total profit
SELECT
	*,
	SUM(branch_profit) OVER () AS total_profit,
	CONCAT(ROUND((branch_profit/SUM(branch_profit) OVER()), 2) * 100, '%') AS percent_of_profit
FROM
(
	SELECT
		customer_type,
		ROUND(SUM(gross_income), 2) AS branch_profit
	FROM sales.supermarketsales
	GROUP BY customer_type
) t

--- Profit and ratings seem to be evenly distributed across all the dimensions used in this part to whole analysis, perhaps this will change as more data is collected.
