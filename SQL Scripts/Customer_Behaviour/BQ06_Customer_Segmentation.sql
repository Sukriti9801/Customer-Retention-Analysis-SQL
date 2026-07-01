/*
=========================================================
Business Question 6
Customer Segmentation Based on Total Spending
=========================================================

Project : Customer Retention Analysis
Category: Customer Behaviour

Business Requirement:
The marketing team wants to categorize customers based on
their total spending. This segmentation helps the business
design personalized marketing campaigns, loyalty programs,
and promotional offers for different customer groups.

Segmentation Rules:
- Platinum : Total Spending >= 15000
- Gold      : Total Spending >= 10000
- Silver    : Total Spending >= 5000
- Bronze    : Total Spending < 5000

Expected Output:
Display customer ID, customer name, total spending, and
customer segment.

Business Value:
Customer segmentation enables targeted marketing
strategies, improves customer retention, and increases
customer lifetime value.

=========================================================
*/

SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.total_amount) AS Total_Spent,

    CASE
        WHEN SUM(o.total_amount) >= 15000 THEN 'Platinum'
        WHEN SUM(o.total_amount) >= 10000 THEN 'Gold'
        WHEN SUM(o.total_amount) >= 5000 THEN 'Silver'
        ELSE 'Bronze'
    END AS Customer_Segment

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

Customer segmentation allows businesses to personalize
their marketing efforts. Platinum and Gold customers can
be rewarded through VIP memberships, exclusive discounts,
and early access to new products. Silver and Bronze
customers can be encouraged to increase their spending
through targeted promotions and loyalty campaigns.

=========================================================
*/
