/*
=========================================================
Analysis 5: Monthly Average Order Value
=========================================================

Business Requirement:
Calculate the average order value for each month to
analyze customer spending trends.

=========================================================
*/

SELECT
    YEAR(order_date) AS Order_Year,
    MONTH(order_date) AS Order_Month,
    ROUND(AVG(total_amount), 2) AS Average_Order_Value
FROM Orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    Order_Year,
    Order_Month;

/*
Business Insight:
Monitoring monthly average order value helps evaluate
customer spending behavior and the effectiveness of
pricing or promotional strategies.
*/
