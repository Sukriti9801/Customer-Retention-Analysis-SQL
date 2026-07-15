/*
=========================================================
Analysis 1: Active vs Inactive Customers
=========================================================

Business Requirement:
Classify customers as Active or Inactive based on their
most recent purchase.

Criteria:
- Active   : Last purchase within 180 days of the latest
             order date in the dataset.
- Inactive : Last purchase more than 180 days before the
             latest order date.

=========================================================
*/

WITH LastPurchase AS
(
    SELECT
        c.customer_id,
        c.customer_name,
        MAX(o.order_date) AS Last_Purchase_Date
    FROM Customers c
    INNER JOIN Orders o
        ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_id,
        c.customer_name
)

SELECT
    customer_id,
    customer_name,
    Last_Purchase_Date,
    CASE
        WHEN DATEDIFF(
                DAY,
                Last_Purchase_Date,
                (SELECT MAX(order_date) FROM Orders)
             ) <= 180
        THEN 'Active'
        ELSE 'Inactive'
    END AS Customer_Status
FROM LastPurchase
ORDER BY Last_Purchase_Date DESC;

/*
Business Insight:
Inactive customers can be targeted with re-engagement
campaigns, while active customers can be retained through
loyalty programs and personalized offers.
*/
