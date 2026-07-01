/*
=========================================================
Business Question 10
Top Spending Customer by City
=========================================================

Project : Customer Retention Analysis
Category: Customer Behaviour

Business Requirement:
Identify the highest-spending customer in each city based
on their total purchase amount.

Expected Output:
Display the city, customer ID, customer name, and total
amount spent by the highest-spending customer in each city.

Business Value:
Identifying the top customer in each city helps the
business design region-specific loyalty programs,
marketing campaigns, and customer engagement strategies.

=========================================================
*/

WITH CustomerSpending AS
(
    SELECT
        c.city,
        c.customer_id,
        c.customer_name,
        SUM(o.total_amount) AS Total_Spent,

        ROW_NUMBER() OVER
        (
            PARTITION BY c.city
            ORDER BY SUM(o.total_amount) DESC
        ) AS Customer_Rank

    FROM Customers c
    INNER JOIN Orders o
        ON c.customer_id = o.customer_id

    GROUP BY
        c.city,
        c.customer_id,
        c.customer_name
)

SELECT
    city,
    customer_id,
    customer_name,
    Total_Spent
FROM CustomerSpending
WHERE Customer_Rank = 1
ORDER BY city;

/*
=========================================================
Business Insight
=========================================================

This analysis identifies the highest-value customer in
each city based on total spending. These customers can
be targeted with city-specific loyalty programs,
exclusive offers, and personalized marketing campaigns.
The insights also help regional managers understand
customer value across different locations.

=========================================================
*/
