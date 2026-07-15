/*
=========================================================
Analysis 1: Monthly Revenue
=========================================================

Business Requirement:
Calculate the total revenue generated each month to
analyze sales performance over time.

=========================================================
*/

SELECT
    YEAR(order_date) AS Order_Year,
    MONTH(order_date) AS Order_Month,
    SUM(total_amount) AS Monthly_Revenue
FROM Orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    Order_Year,
    Order_Month;

/*
Business Insight:
Monthly revenue trends help identify seasonal patterns,
measure business growth, and support sales forecasting.
*/
