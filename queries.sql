select * from sales_data limit 10;
SELECT SUM(sales) FROM sales_data;
SELECT COUNT(DISTINCT ordernumber) AS total_orders FROM sales_data;
SELECT productline, SUM(sales) AS revenue
FROM sales_data
GROUP BY productline
ORDER BY revenue DESC;
SELECT customername, SUM(sales) AS revenue
FROM sales_data
GROUP BY customername
ORDER BY revenue DESC
LIMIT 5;
SELECT dealsize, AVG(sales) AS avg_sales
FROM sales_data
GROUP BY dealsize;
SELECT year_id, month_id, SUM(sales) AS revenue
FROM sales_data
GROUP BY year_id, month_id
ORDER BY year_id, month_id;