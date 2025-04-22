/*===================================
Sales Date Range Analysis
===================================
Purpose:
Determine the time span covered by the `sales.supermarketsales` dataset by identifying the earliest and latest transaction dates.

Reason:
- Understanding the data coverage period is crucial for time-based analyses such as trend tracking, seasonality, and sales forecasting.
- Validates that the dataset spans approximately 3 months (January 1, 2019 to March 30, 2019), even though `DATEDIFF(MONTH, ...)` returns 2 due to how month differences are calculated.

Any other useful info:
- `DATEDIFF(MONTH, ...)` returns 2 because it counts full month boundaries crossed, not the total month span.
--------------------------------------------------------------*/
SELECT 
	MAX(date) AS most_current,
	MIN(date) AS latest
FROM sales.supermarketsales;
--- Seels like the data is for 3 months from the 1st of Jan 2019 till the 30th of March

SELECT DATEDIFF(MONTH, MIN(date), MAX(date)) FROM sales.supermarketsales;
-- Returned 2
