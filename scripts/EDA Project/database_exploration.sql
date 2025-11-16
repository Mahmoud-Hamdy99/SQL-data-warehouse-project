/*
===============================================================================
Database Exploration
===============================================================================
Purpose:
    - To explore the structure of the database, including the list of tables and their schemas.
    - To inspect the columns and metadata for specific tables.

Table Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS
===============================================================================
*/


USE DataWarehouse

-- Retrieve a list of all tables in the database

SELECT * FROM INFORMATION_SCHEMA.TABLES

-- Retrieve a list of all tables in the database (Gold Layer)

SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'GOLD'



-- Retrieve all columns for a specific table (dimentions)
 
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'GOLD' AND TABLE_NAME ='dim_customers'


SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'GOLD' AND TABLE_NAME ='dim_products'

SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'GOLD' AND TABLE_NAME ='fact_sales'
