/*
=========================================================
Business Question 1
Total Orders Placed by Each Customer
=========================================================

Project : Customer Retention Analysis
Category: Customer Behaviour

Business Requirement:
The marketing team wants to identify customers based on
their purchasing frequency. Customers who place multiple
orders are more likely to be loyal and can be targeted
through loyalty programs and personalized campaigns.

Expected Output:
Display each customer's ID, name, and total number of
orders placed, sorted from the highest to the lowest.

Business Value:
This analysis helps identify loyal customers, one-time
buyers, and customers who may require re-engagement
strategies.

=========================================================
*/

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS Total_Orders
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY
    Total_Orders DESC;

/*
=========================================================
Business Insight
=========================================================

Customers with a higher number of orders demonstrate
strong engagement with the business and represent loyal
customers. Customers with only one order may be targeted
through promotional offers, email campaigns, or loyalty
programs to encourage repeat purchases.

=========================================================
*/
