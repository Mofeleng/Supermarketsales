/*=====================================================
Sales Profit & Customer Satisfaction Breakdown
=====================================================
Purpose:
Explore gross income (profit) and customer rating patterns by various business dimensions.

Reason:
Helps identify high-performing branches, customer demographics, and product lines that drive profitability. 
Also checks if customer satisfaction (ratings) align with profit performance.

Measures & Dimensions Used:
- Gross income (total profit)
  • by branch
  • by gender
  • by customer type
  • by product line
- Customer ratings by branch

Interesting Insight:
Initial analysis shows a direct correlation between branch profitability and average customer rating,
suggesting that customer satisfaction may be a driver (or result) of financial performance.

Next step:
Consider deeper “part-to-whole” analysis to verify if more transactions (i.e., higher sales volume) explain the trend.
------------------------------------------------------------*/
-- We'll look at total sales(gross income) by branch, gender,and product line
-- Gross income by branch
SELECT
	branch,
	SUM(gross_income) AS total_profit
FROM sales.supermarketsales
GROUP BY branch
ORDER BY SUM(gross_income) DESC

-- by gender
SELECT
	gender,
	ROUND(SUM(gross_income), 2) AS total_profit
FROM sales.supermarketsales
GROUP BY gender
ORDER BY SUM(gross_income) DESC

-- by customer type
SELECT
	customer_type,
	ROUND(SUM(gross_income), 2) AS total_profit
FROM sales.supermarketsales
GROUP BY customer_type
ORDER BY SUM(gross_income) DESC

---By product line by branch
SELECT
	product_line,
	SUM(gross_income) AS total_profit
FROM sales.supermarketsales
GROUP BY product_line
ORDER BY SUM(gross_income) DESC;

-- Rating by branch
SELECT 
	branch,
	ROUND(AVG(rating), 2) AS avg_rating
FROM sales.supermarketsales
GROUP BY branch
ORDER BY ROUND(AVG(rating),2) DESC
/*iteresting note: it seems that ratings and profit are directley proportional, the results of the above query map the results of the ranked profits by branch
	Perhaps its a number thing where the branches that perform well have the most transaction, I will remember to explore that in part to whole analysis
*/
