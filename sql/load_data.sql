
USE cafe_sales;

LOAD DATA LOCAL INFILE "/home/jv546/data_projects/cafe_analytics_project/data/processed/final_cafe_sales.csv"
INTO TABLE staging_cafe_sales 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

Select count(*) FROM staging_cafe_sales;

Select * FROM staging_cafe_sales
LIMIT 10;