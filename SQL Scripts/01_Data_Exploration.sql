/*
=========================================================
                DATA EXPLORATION
=========================================================

Project: Customer Retention Analysis
Database: Customer_Retention_Analysis

Objective:
Explore the dataset to understand its size, structure,
and data quality before performing business analysis.

=========================================================
*/

/*
---------------------------------------------------------
Exploration Query 1 : Total Number of Customers
---------------------------------------------------------
Purpose:
Determine the total number of customers available in the
Customers table.
---------------------------------------------------------
*/

SELECT COUNT(*) AS Total_Customers
FROM Customers;

/*
---------------------------------------------------------
Exploration Query 2 : Total Number of Orders
---------------------------------------------------------
Purpose:
Determine the total number of orders placed.
---------------------------------------------------------
*/

SELECT COUNT(*) AS Total_Orders
FROM Orders;

/*
---------------------------------------------------------
Exploration Query 3 : Total Number of Products
---------------------------------------------------------
Purpose:
Determine how many products are available.
---------------------------------------------------------
*/

SELECT COUNT(*) AS Total_Products
FROM Products;

/*
---------------------------------------------------------
Exploration Query 4 : Total Number of Order Items
---------------------------------------------------------
Purpose:
Determine the total number of products sold across all
orders.
---------------------------------------------------------
*/

SELECT COUNT(*) AS Total_Order_Items
FROM Order_Items;

/*
---------------------------------------------------------
Exploration Query 5 : Duplicate Customer IDs
---------------------------------------------------------
Purpose:
Check whether duplicate customer records exist.

Expected Result:
No duplicate customer IDs.
---------------------------------------------------------
*/

SELECT
    customer_id,
    COUNT(*) AS Duplicate_Count
FROM Customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

/*
---------------------------------------------------------
Exploration Query 6 : Missing Customer Information
---------------------------------------------------------
Purpose:
Identify customers with missing names or cities.

Expected Result:
No NULL values.
---------------------------------------------------------
*/

SELECT *
FROM Customers
WHERE customer_name IS NULL
   OR city IS NULL;
