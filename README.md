# Data Warehouse & Analytics Project  

Welcome to the **Data Warehouse and Analytics Project** repository!  
This project demonstrates an **end-to-end data warehousing and analytics solution** — from building a scalable data warehouse to delivering actionable business insights.  

Designed as a **portfolio project**, it highlights industry best practices in **data engineering**, **data modeling**, and **analytics reporting**.  

---

## Data Architecture  

The project follows the **Medallion Architecture (Bronze → Silver → Gold):**  

![DW Architecture]([images/dw_architecture.png](https://raw.githubusercontent.com/Mahmoud-Hamdy99/SQL-data-warehouse-project/refs/heads/main/docs/Data%20warehouse%20archeticture.drawio.png)](https://raw.githubusercontent.com/Mahmoud-Hamdy99/SQL-data-warehouse-project/refs/heads/main/docs/Data%20warehouse%20archeticture.drawio.png))

🔸 **Bronze Layer**  
Stores raw data from source systems as-is.  
Data is ingested from CSV files into a SQL Server database.  

🔸 **Silver Layer**  
Applies data cleansing, standardization, and normalization to prepare data for analytics.  

🔸 **Gold Layer**  
Contains business-ready data modeled in a **Star Schema (Fact and Dimension tables)** to support efficient reporting and insights.  

---

## Project Overview  

This project includes the following components:  

- **Data Architecture** – Designing a modern data warehouse using the Medallion framework.  
- **ETL Pipelines** – Extracting, transforming, and loading data from multiple source systems into the warehouse.  
- **Data Modeling** – Building optimized Fact and Dimension tables for analytical queries.  
- **Analytics & Reporting** – Creating SQL-based reports and dashboards for business insights.  

---

## Project Requirements  

**Objective**  
Build a modern Data Warehouse using SQL Server to consolidate sales and customer data, enabling analytical reporting and data-driven decision-making.  

📋 **Specifications**  
- **Data Sources:** Import data from two systems — ERP and CRM — provided as CSV files.  
- **Data Quality:** Clean and fix inconsistencies before loading data into the warehouse.  
- **Integration:** Merge both sources into a single, unified analytical model.  
- **Scope:** Focus on the latest dataset only (no historization).  
- **Documentation:** Provide clear data model documentation for both technical and business users.  

---

## Entity Relationship Diagram (ERD)  

The Gold Layer of the Data Warehouse is modeled using a **Star Schema** structure, centered around the `FactSales` table and connected to its related Dimension tables.  

![Data Model](https://raw.githubusercontent.com/Mahmoud-Hamdy99/SQL-data-warehouse-project/refs/heads/main/docs/DATA%20MODEL.drawio.png)

---

## Tech Stack  

| Category | Tools / Technologies |
|-----------|----------------------|
| **Database** | Microsoft SQL Server |
| **Data Source** | CSV Files (ERP & CRM) |
| **Data Modeling** | Star Schema (Fact & Dimension Tables) |
| **Language** | T-SQL |

---

## 📊 Deliverables  

- **Cleaned and validated tables** ready for analysis  
- **Star Schema** including:  
  - `FactSales`  
  - `DimCustomer`  
  - `DimProduct`  
    

### SQL Scripts for:  

- **Data Loading:** `INSERT`, `BULK INSERT`  
- **Data Cleaning:** `TRIM`, `SUBSTRING`, `REPLACE`, `UPPER`, `LOWER`, `NULLIF`, `CASE`  
- **Data Transformation:** joins, conditional logic, data validation  
- **Stored Procedures:** ETL automation and data refresh processes  
- **Views:** reporting and simplified data access  
- **Analytical Queries:** KPIs, aggregations, trend analysis  

---

## 🧠 Key Learnings  

- Building a Data Warehouse entirely in **SQL Server**  
- Implementing **ETL logic** using stored procedures and views  
- Handling **data quality and transformation** with T-SQL functions  
- Designing **Fact and Dimension models** optimized for performance and analytics  

---

## 📈 BI: Analytics & Reporting (Data Analysis)  --->>> ## Coming Soon

### Objective  
Develop SQL-based analytics to deliver detailed insights into:  
- **Customer Behavior**  
- **Product Performance**  
- **Sales Trends**  

These insights empower stakeholders with key business metrics, enabling strategic decision-making.  

---

## Contact  

For more information, feel free to reach out:  

- **Email:** [mahmoud.hamdy2017@feps.edu.eg](mailto:mahmoud.hamdy2017@feps.edu.eg)  
- **LinkedIn:** [https://www.linkedin.com/in/mahmoud-hamdy-123b4b193/](https://www.linkedin.com/in/mahmoud-hamdy-123b4b193/)
