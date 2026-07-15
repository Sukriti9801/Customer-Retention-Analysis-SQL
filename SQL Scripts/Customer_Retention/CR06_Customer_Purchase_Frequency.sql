/*
=========================================================
Analysis 6: Customer Purchase Frequency
=========================================================

Business Requirement:
Calculate the average purchase value and purchase frequency
for each customer.

=========================================================
*/

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS Total_Orders,
    SUM(o.total_amount) AS Total_Spent,
    AVG(o.total_amount) AS Average_Order_Value
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY
    Total_Orders DESC;

/*
Business Insight:
Customers with high purchase frequency and higher average
order values are ideal candidates for premium loyalty
programs and personalized marketing.
*/
