-- ============================================
-- SQL SALES DATA ANALYSIS PROJECT
-- Author: Sufia Rahman
-- ============================================

-- ============================================
-- BASIC QUERIES
-- ============================================

-- View sample data
SELECT * 
FROM sales_data 
LIMIT 10;

-- Total Revenue
SELECT SUM(sales) AS total_revenue
FROM sales_data;

-- Total Orders
SELECT COUNT(DISTINCT ordernumber) AS total_orders
FROM sales_data;

-- Sales by Product Line
SELECT productline, SUM(sales) AS revenue
FROM sales_data
GROUP BY productline
ORDER BY revenue DESC;

-- Top 5 Customers
SELECT customername, SUM(sales) AS revenue
FROM sales_data
GROUP BY customername
ORDER BY revenue DESC
LIMIT 5;


-- ============================================
-- ADVANCED ANALYSIS
-- ============================================

-- Customer Segmentation using CASE
SELECT 
    customername,
    SUM(sales) AS total_revenue,
    CASE 
        WHEN SUM(sales) > 100000 THEN 'High Value'
        WHEN SUM(sales) BETWEEN 50000 AND 100000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM sales_data
GROUP BY customername
ORDER BY total_revenue DESC;


-- Customers with Above Average Revenue (Subquery)
SELECT customername, SUM(sales) AS revenue
FROM sales_data
GROUP BY customername
HAVING SUM(sales) > (
    SELECT AVG(sales) FROM sales_data
);


-- Top 3 Product Lines
SELECT productline, SUM(sales) AS revenue
FROM sales_data
GROUP BY productline
ORDER BY revenue DESC
LIMIT 3;