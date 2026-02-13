
USE cafe_sales;
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE "/home/jv546/data_projects/cafe_analytics_project/data/processed/final_cafe_sales.csv"
INTO TABLE staging_cafe_sales 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 ROWS
(
    Transaction_ID, 
    Item,
    quantity,
    Price_Per_Unit,
    Total_Spent,
    Payment_Method,
    Location,
    Transaction_Date ,
    Month,
    Week,
    Day_Name,
    Is_Weekend,
    Transaction_Size,
    Bulk_Order
);

Select count(*) FROM staging_cafe_sales;

Select * FROM staging_cafe_sales 
LIMIT 10;

INSERT INTO dim_items(item_name) 
SELECT DISTINCT TRIM(Item) 
FROM staging_cafe_sales 
WHERE Item IS NOT NULL;

Select * FROM dim_items;

INSERT INTO fact_sales (
    transaction_id,  
    transaction_date, 
    item_id, 
    quantity, 
    price_per_unit, 
    total_spent, 
    payment_method, 
    location 
) SELECT 
    s.Transaction_ID, 
    s.Transaction_Date, 
    d.item_id, 
    s.Quantity, 
    s.Price_Per_Unit, 
    s.Total_Spent, 
    s.Payment_Method, 
    s.Location 
 FROM staging_cafe_sales s 
 LEFT JOIN dim_items d 
    ON trim(s.Item) = d.item_name; 

Select count(*) FROM fact_sales;
Select count(*) FROM fact_sales WHERE item_id IS NULL;