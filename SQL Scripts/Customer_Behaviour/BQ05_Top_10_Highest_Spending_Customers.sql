/*
=========================================================
Business Question 5
Top 10 Highest Spending Customers
=========================================================

Project : Customer Retention Analysis
Category: Customer Behaviour

Business Requirement:
The management team wants to identify the company's top
10 highest spending customers. These customers generate
a significant portion of the company's revenue and should
be prioritized for loyalty programs, premium services,
and personalized marketing campaigns.

Expected Output:
Display the top 10 customers based on total spending,
along with their customer ID, customer name, total
orders, and total amount spent.

Business Value:
Identifying high-value customers enables the business to
focus retention efforts on customers who contribute the
most revenue.

=========================================================
*/

SELECT TOP 10
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS Total_Orders,
    SUM(o.total_amount) AS Total_Spent
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY
    Total_Spent DESC;

/*
=========================================================
Business Insight
=========================================================

A small group of customers often contributes a large
portion of the company's revenue. These high-value
customers should be retained through exclusive rewards,
VIP membership programs, early product access, and
personalized communication.

=========================================================
*/


