/*
=========================================================
Business Question 2
Total Spending by Each Customer
=========================================================

Project : Customer Retention Analysis
Category: Customer Behaviour

Business Requirement:
The sales team wants to identify customers who contribute
the highest revenue to the business. Understanding customer
spending helps prioritize high-value customers for loyalty
programs, personalized offers, and premium services.

Expected Output:
Display each customer's ID, name, and total amount spent,
sorted from the highest spender to the lowest.

Business Value:
This analysis helps identify high-value customers and
supports customer segmentation based on spending behavior.

=========================================================
*/

SELECT
    c.customer_id,
    c.customer_name,
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

Customers with the highest total spending contribute
significantly to the company's revenue. These customers
can be rewarded through VIP programs, exclusive discounts,
and personalized recommendations to improve retention and
increase customer lifetime value.

=========================================================
*/
