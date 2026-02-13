-- ===================================
-- 
-- ===================================


-- Monthly Revenue Trends

CREATE VIEW monthly_revenue_view AS 
SELECT YEAR(Transaction_Date) AS year, 
MONTH(Transaction_Date) AS month, 
COUNT(*) AS total_transactions, 
SUM(quantity) AS total_items_sold, 
SUM(Total_Spent) AS total_revenue 
FROM fact_sales 
GROUP BY year , month;
-- check view
Select * FROM monthly_revenue_view;

-- TOP Performing Items
CREATE VIEW item_performance_view AS  
SELECT dim_items.item_name, 
    SUM(fact_sales.quantity) AS total_quantity_sold,  
    SUM(fact_sales.total_spent) AS total_revenue,  
    count(fact_sales.transaction_id) AS total_transactions 
FROM fact_sales 
LEFT JOIN dim_items ON fact_sales.item_id = dim_items.item_id 
GROUP BY dim_items.item_name;
-- check view
Select * FROM item_performance_view;


-- Performance based on Locations
CREATE VIEW location_perfomance_view AS 
SELECT location, 
    COUNT(*) AS total_transactions, 
    SUM(Total_Spent) AS total_revenue, 
    avg(total_spent) AS avg_transaction_value 
FROM fact_sales 
GROUP By location;

-- check view
Select * FROM location_perfomance_view;