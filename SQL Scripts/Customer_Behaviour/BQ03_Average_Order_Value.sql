/*
=========================================================
Business Question 3
Average Order Value (AOV) by Customer
=========================================================

Project : Customer Retention Analysis
Category: Customer Behaviour

Business Requirement:
The finance and marketing teams want to understand the
average amount customers spend per order. This helps
identify customers who place high-value orders and
supports pricing and promotional strategies.

Expected Output:
Display each customer's ID, name, total orders,
total spending, and average order value.

Business Value:
Average Order Value (AOV) is a key performance indicator
that helps businesses evaluate customer purchasing
behavior and optimize sales strategies.

=========================================================
*/
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS Total_Orders,
    SUM(o.total_amount) AS Total_Spent,
    ROUND(AVG(o.total_amount),2) AS Average_Order_Value
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY
    Average_Order_Value DESC;

/*
=========================================================
Business Insight
=========================================================

Customers with a high Average Order Value contribute
more revenue per transaction. These customers may be
interested in premium products and can be targeted with
exclusive offers, product bundles, and personalized
recommendations to increase customer lifetime value.

=========================================================
*/
