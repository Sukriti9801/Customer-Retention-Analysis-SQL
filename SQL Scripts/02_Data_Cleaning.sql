/*
=========================================================
                    DATA CLEANING
=========================================================

Project : Customer Retention Analysis
Database: Customer_Retention_Analysis

Objective:
Validate and clean the dataset before performing
customer behavior and retention analysis.

Tasks Performed:
1. Check for duplicate records.
2. Check for missing (NULL) values.
3. Verify data types.
4. Identify invalid numeric values.
5. Validate relationships between tables.

=========================================================
*/

/*
=========================================================
Data Cleaning Step 1
Check for Duplicate Customer Records
=========================================================

Business Objective:
Ensure that each customer has a unique Customer ID.

Expected Result:
No duplicate records should exist.

*/

SELECT
    customer_id,
    COUNT(*) AS Duplicate_Count
FROM Customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

/*
=========================================================
Data Cleaning Step 2
Check for Missing Customer Information
=========================================================

Business Objective:
Identify customers with incomplete information.

Expected Result:
No NULL values should exist.

*/

SELECT *
FROM Customers
WHERE customer_name IS NULL
   OR city IS NULL;

/*
=========================================================
Data Cleaning Step 3
Verify Column Data Types
=========================================================

Business Objective:
Ensure all columns have appropriate data types before
performing analysis.

Expected Result:
Numeric columns should have numeric data types.
Date columns should have DATE or DATETIME data types.

*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Orders';

/*
=========================================================
Data Cleaning Step 4
Validate Numeric Columns
=========================================================

Business Objective:
Ensure all numeric columns contain valid numeric values
before performing sales, revenue, and customer analysis.

Expected Result:
No invalid numeric values should be returned.

=========================================================
*/

/*
---------------------------------------------------------
Check 4.1 - Validate Total Amount
---------------------------------------------------------

Business Objective:
Ensure total_amount contains only valid numeric values.

Expected Result:
No invalid records should be returned.
*/

SELECT *
FROM Orders
WHERE TRY_CAST(total_amount AS DECIMAL(10,2)) IS NULL
      AND total_amount IS NOT NULL;

/*
---------------------------------------------------------
Check 4.2 - Validate Product Price
---------------------------------------------------------

Business Objective:
Ensure product prices are stored as valid numeric values.

Expected Result:
No invalid records should be returned.
*/

SELECT *
FROM Products
WHERE TRY_CAST(price AS DECIMAL(10,2)) IS NULL
      AND price IS NOT NULL;

/*
---------------------------------------------------------
Check 4.3 - Validate Quantity
---------------------------------------------------------

Business Objective:
Ensure order quantities contain only valid numeric values.

Expected Result:
No invalid records should be returned.
*/

SELECT *
FROM Order_Items
WHERE TRY_CAST(quantity AS INT) IS NULL
      AND quantity IS NOT NULL;

/*
---------------------------------------------------------
Check 4.4 - Validate Discount
---------------------------------------------------------

Business Objective:
Ensure discount values contain only valid numeric values.

Expected Result:
No invalid records should be returned.
*/

SELECT *
FROM Order_Items
WHERE TRY_CAST(discount AS INT) IS NULL
      AND discount IS NOT NULL;

/*
=========================================================
Data Cleaning Step 5
Validate Date Columns
=========================================================

Business Objective:
Ensure order dates are complete and logically correct
before performing time-based analysis.

Expected Result:
No missing or future-dated orders should be returned.

=========================================================
*/

/*
---------------------------------------------------------
Check 5.1 - Missing Order Dates
---------------------------------------------------------
*/

SELECT *
FROM Orders
WHERE order_date IS NULL;

/*
---------------------------------------------------------
Check 5.2 - Future Order Dates
---------------------------------------------------------
*/

SELECT *
FROM Orders
WHERE order_date > CAST(GETDATE() AS DATE);

/*
=========================================================
Data Cleaning Step 6
Validate Business Rules
=========================================================

Business Objective:
Ensure the dataset follows business rules and does not
contain unrealistic or invalid business values.

Expected Result:
No invalid business records should be returned.

=========================================================
*/

/*
---------------------------------------------------------
Check 6.1 - Validate Product Price
---------------------------------------------------------

Business Objective:
Ensure every product has a valid selling price.

Expected Result:
No products should have a price less than or equal to zero.
*/

SELECT *
FROM Products
WHERE price <= 0;

/*
---------------------------------------------------------
Check 6.2 - Validate Quantity
---------------------------------------------------------

Business Objective:
Ensure every order item has a valid quantity.

Expected Result:
No order item should have a quantity less than or equal to zero.
*/

SELECT *
FROM Order_Items
WHERE quantity <= 0;

/*
---------------------------------------------------------
Check 6.3 - Validate Discount
---------------------------------------------------------

Business Objective:
Ensure discount percentages are within a valid range.

Expected Result:
Discount should be between 0 and 100.
*/

SELECT *
FROM Order_Items
WHERE discount < 0
   OR discount > 100;

/*
---------------------------------------------------------
Check 6.4 - Validate Total Amount
---------------------------------------------------------

Business Objective:
Ensure every order has a positive total amount.

Expected Result:
No orders should have a total amount less than or equal to zero.
*/

SELECT *
FROM Orders
WHERE total_amount <= 0;

/*
=========================================================
Data Cleaning Step 7
Validate Referential Integrity
=========================================================

Business Objective:
Ensure relationships between tables are valid and that
every record references an existing parent record.

Expected Result:
No orphan records should be returned.

=========================================================
*/

/*
---------------------------------------------------------
Check 7.1 - Orders to Customers
---------------------------------------------------------

Business Objective:
Ensure every order is associated with a valid customer.

Expected Result:
No orphan orders should be returned.
*/

SELECT
    o.order_id,
    o.customer_id
FROM Orders o
LEFT JOIN Customers c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

/*
---------------------------------------------------------
Check 7.2 - Order Items to Orders
---------------------------------------------------------

Business Objective:
Ensure every order item belongs to a valid order.

Expected Result:
No orphan order items should be returned.
*/

SELECT
    oi.order_item_id,
    oi.order_id
FROM Order_Items oi
LEFT JOIN Orders o
    ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

/*
---------------------------------------------------------
Check 7.3 - Order Items to Products
---------------------------------------------------------

Business Objective:
Ensure every order item references a valid product.

Expected Result:
No orphan product records should be returned.
*/

SELECT
    oi.order_item_id,
    oi.product_id
FROM Order_Items oi
LEFT JOIN Products p
    ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

