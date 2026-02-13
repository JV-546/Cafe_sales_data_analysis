CREATE DATABASE if NOT EXISTS cafe_sales;
USE cafe_sales;

CREATE TABLE dim_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    is_active BOOL DEFAULT TRUE
);

CREATE TABLE fact_sales (
    transaction_id VARCHAR(20) NOT NULL PRIMARY KEY, 
    transaction_date DATE,
    item_id INT,
    quantity INT,
    price_per_unit DECIMAL(10,2),
    total_spent DECIMAL(10,2),
    payment_method VARCHAR(50),
    location VARCHAR(50),
    bulk_order BOOL,
    transaction_size VARCHAR(10),
    FOREIGN KEY (item_id) REFERENCES dim_items(item_id) ON DELETE SET NULL
);

CREATE TABLE staging_cafe_sales (
    Transaction_ID VARCHAR(20) , 
    Item VARCHAR(10),
    quantity INT,
    Price_Per_Unit DECIMAL(10,2),
    Total_Spent DECIMAL(10,2),
    Payment_Method VARCHAR(50),
    Location VARCHAR(50),
    Transaction_Date DATE,
    Month INT,
    Week INT,
    Day_Name VARCHAR(10),
    Is_Weekend BOOL,
    Transaction_Size VARCHAR(10),
    Bulk_Order BOOL
    
);
SHOW TABLES;

DESCRIBE dim_items;

DESCRIBE fact_sales;

DESCRIBE staging_cafe_sales;
