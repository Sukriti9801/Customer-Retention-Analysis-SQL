/*
=========================================================
Analysis 6: Monthly Sales Growth
=========================================================

Business Requirement:
Compare monthly revenue to identify sales growth trends.

=========================================================
*/
WITH MonthlyRevenue AS
(
    SELECT
        YEAR(order_date) AS Order_Year,
        MONTH(order_date) AS Order_Month,
        SUM(total_amount) AS Monthly_Revenue
    FROM Orders
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
),
RevenueComparison AS
(
    SELECT
        Order_Year,
        Order_Month,
        Monthly_Revenue,
        LAG(Monthly_Revenue) OVER
        (
            ORDER BY Order_Year, Order_Month
        ) AS Previous_Month_Revenue
    FROM MonthlyRevenue
)

SELECT
    Order_Year,
    Order_Month,
    Monthly_Revenue,
    Previous_Month_Revenue,
    Monthly_Revenue - Previous_Month_Revenue AS Revenue_Growth
FROM RevenueComparison
ORDER BY
    Order_Year,
    Order_Month;

/*
Business Insight:
Comparing monthly revenue helps identify growth trends,
seasonality, and periods requiring strategic attention.
*/
