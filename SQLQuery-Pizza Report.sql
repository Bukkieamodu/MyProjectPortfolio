select * from pizza_sales

select sum(total_price) AS Total_Revenue from pizza_sales

select sum(total_price) / COUNT(DISTINCT order_id) AS Avg_order_Value from pizza_sales

select sum(quantity) AS Total_Pizza_Sold from pizza_sales

select COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales

select sum(quantity) / COUNT(DISTINCT order_id) AS Avg_Pizza_per_order from pizza_sales

select CAST(CAST(sum(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizza_per_order from pizza_sales
select DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) AS Total_orders 
from pizza_sales 
GROUP BY DATENAME(DW, order_date) 

select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) AS Total_orders 
from pizza_sales 
GROUP BY DATENAME(MONTH, order_date) ORDER BY (Total_orders) Desc

select pizza_category, CAST(sum(total_price) AS DECIMAL(10,2)) AS Total_sales, CAST(sum(total_price) * 100  / (select sum(total_price) from pizza_sales) AS DECIMAL(10,2)) AS Percent_Sales
from pizza_sales 
GROUP BY pizza_category

select pizza_category, CAST(sum(total_price) AS DECIMAL(10,2)) AS Total_sales, CAST(sum(total_price) * 100  / (select sum(total_price) from pizza_sales WHERE MONTH(order_date) = 1) AS DECIMAL(10,2)) AS Percent_Sales
from pizza_sales 
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

select pizza_size, CAST(sum(total_price) AS DECIMAL(10,2)) AS Total_sales, CAST(sum(total_price) * 100  / (select sum(total_price) from pizza_sales) AS DECIMAL(10,2)) AS Percent_Sales_per_Pizza_size
from pizza_sales 
GROUP BY pizza_size
ORDER BY Percent_Sales_per_Pizza_size DESC

select pizza_size, CAST(sum(total_price) AS DECIMAL(10,2)) AS Total_sales, CAST(sum(total_price) * 100  / (select sum(total_price) from pizza_sales WHERE DATEPART(QUARTER, order_date)=1) AS DECIMAL(10,2)) AS Percent_Sales_per_Pizza_size
from pizza_sales 
WHERE DATEPART(QUARTER, order_date)=1
GROUP BY pizza_size
ORDER BY Percent_Sales_per_Pizza_size DESC

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

select TOP 5 pizza_name, sum(total_price) AS Total_Sales from pizza_sales
Group By pizza_name
Order by Total_Sales Asc

select TOP 5 pizza_name, sum(quantity) AS Total_Qunatity from pizza_sales
Group By pizza_name
Order by Total_Qunatity Desc

select TOP 5 pizza_name, sum(quantity) AS Total_Quantity from pizza_sales
Group By pizza_name
Order by Total_Quantity Asc

select TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales
Group By pizza_name
Order by Total_Orders Desc

select TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales
Group By pizza_name
Order by Total_Orders Asc
