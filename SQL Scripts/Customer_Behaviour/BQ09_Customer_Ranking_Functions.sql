/*
=========================================================
Business Question 9
Customer Ranking Using Window Functions
=========================================================

Project : Customer Retention Analysis
Category: Customer Behaviour

SQL Concepts Used:
- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- OVER()
- ORDER BY

Business Requirement:
The management team wants to compare different customer
ranking methods based on total spending. Understanding
these ranking functions helps analysts choose the most
appropriate method for business reports, leaderboards,
and customer segmentation.

Expected Output:
Display each customer's ID, name, total spending,
RANK(), DENSE_RANK(), and ROW_NUMBER().

Business Value:
This analysis demonstrates how different SQL ranking
functions handle customers with equal spending, helping
analysts select the right ranking technique for various
business scenarios.

=========================================================
*/

SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.total_amount) AS Total_Spent,

    RANK() OVER
    (
        ORDER BY SUM(o.total_amount) DESC
    ) AS Customer_Rank,

    DENSE_RANK() OVER
    (
        ORDER BY SUM(o.total_amount) DESC
    ) AS Dense_Rank,

    ROW_NUMBER() OVER
    (
        ORDER BY SUM(o.total_amount) DESC
    ) AS Row_Number

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

Each ranking function serves a different business purpose.

- RANK() is useful for competitive rankings where ties
  result in skipped positions.

- DENSE_RANK() is ideal for business reports that require
  consecutive rankings without gaps.

- ROW_NUMBER() is useful when every record must have a
  unique position, such as selecting the top N records
  or removing duplicate entries.

=========================================================
*/

