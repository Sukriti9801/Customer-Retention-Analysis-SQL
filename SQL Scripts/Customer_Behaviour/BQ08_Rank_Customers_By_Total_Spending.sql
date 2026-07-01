/*
=========================================================
Business Question 8
Rank Customers by Total Spending
=========================================================

Project : Customer Retention Analysis
Category: Customer Behaviour

Business Requirement:
The management team wants to rank customers based on
their total spending. This ranking helps identify the
highest-value customers and supports VIP programs,
customer rewards, and personalized marketing.

Expected Output:
Display customer ID, customer name, total spending,
and customer rank.

Business Value:
Customer ranking enables businesses to recognize their
most valuable customers and prioritize retention efforts.

=========================================================
*/

SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.total_amount) AS Total_Spent,

    RANK() OVER
    (
        ORDER BY SUM(o.total_amount) DESC
    ) AS Customer_Rank

FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id

GROUP BY
    c.customer_id,
    c.customer_name

ORDER BY
    Customer_Rank;

/*
=========================================================
Business Insight
=========================================================

Ranking customers by total spending helps identify the
highest-value customers who contribute the most revenue.
These customers can be prioritized for VIP memberships,
exclusive offers, personalized marketing campaigns, and
customer retention initiatives.

=========================================================
*/
