/*
=========================================================
Business Question 4
Repeat Purchase Rate
=========================================================

Project : Customer Retention Analysis
Category: Customer Behaviour

Business Requirement:
The marketing team wants to measure customer loyalty by
calculating the Repeat Purchase Rate. This KPI shows the
percentage of customers who have placed more than one
order.

Expected Output:
Display the Repeat Purchase Rate as a percentage.

Business Value:
A higher Repeat Purchase Rate indicates stronger customer
loyalty and successful customer retention strategies.
A lower rate suggests that more customers are making only
one purchase and may require re-engagement campaigns.

=========================================================
*/

WITH CustomerOrders AS
(
    SELECT
        customer_id,
        COUNT(order_id) AS Total_Orders
    FROM Orders
    GROUP BY customer_id
)

SELECT
ROUND(
(
COUNT(CASE
        WHEN Total_Orders > 1 THEN 1
     END) * 100.0
/
COUNT(*)
),2) AS Repeat_Purchase_Rate;

/*
=========================================================
Business Insight
=========================================================

The Repeat Purchase Rate measures customer loyalty by
identifying the percentage of customers who return to
make additional purchases. A higher rate indicates strong
customer satisfaction and retention, while a lower rate
may highlight the need for loyalty programs, personalized
marketing campaigns, or improved customer experience.

=========================================================
*/
