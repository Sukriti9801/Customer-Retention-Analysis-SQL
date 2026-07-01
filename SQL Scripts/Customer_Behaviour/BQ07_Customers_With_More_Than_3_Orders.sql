/*
=========================================================
Business Question 7
Customers With More Than 3 Orders
=========================================================

Project : Customer Retention Analysis
Category: Customer Behaviour

Business Requirement:
The marketing team wants to identify customers who have
placed more than three orders. These customers are highly
engaged with the business and are potential candidates
for loyalty rewards and premium membership programs.

Expected Output:
Display customer ID, customer name, and total number of
orders for customers who have placed more than three
orders.

Business Value:
Frequent purchasers are more likely to become long-term
customers. Identifying them helps improve retention and
customer relationship management.

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
HAVING
    COUNT(o.order_id) > 3
ORDER BY
    Total_Orders DESC;

/*
=========================================================
Business Insight
=========================================================

Customers with more than three orders demonstrate strong
engagement with the business. These customers are ideal
candidates for loyalty programs, exclusive promotions,
and personalized communication to strengthen long-term
relationships.

=========================================================
*/
