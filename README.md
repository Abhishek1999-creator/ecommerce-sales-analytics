# ecommerce-sales-analytics
End-to-end E-Commerce Sales Analytics using Python, SQL, and Power BI
E-Commerce Sales Performance Analysis
📌 Project Overview
This project analyzes e-commerce sales data to uncover actionable business insights related to revenue, profitability, customer behavior, and product performance. It is built as an end-to-end Data Analytics portfolio project, demonstrating practical skills in Python (data cleaning), SQL (manager-level analysis), and Power BI (dashboarding & storytelling).
The project simulates a real-world business scenario where raw transactional data is transformed into meaningful insights to support data-driven decision-making.

🎯 Business Problem Statement
E-commerce companies generate large volumes of transactional data, but without proper analysis, valuable insights remain hidden. This project aims to: - Identify key revenue and profit drivers - Understand customer purchasing behavior - Evaluate product and category-level performance - Track sales trends over time - Support strategic business decisions using data
🛠 Tools & Technologies Used
•	Python: Pandas, NumPy (Data Cleaning & Preprocessing)
•	SQL: Joins, Subqueries, Aggregations, CTEs, Window Functions
•	Power BI: Interactive Dashboards & KPI Visualization
•	GitHub: Version Control & Project Documentation

📂 Dataset Description
•	Raw e-commerce transactional dataset
•	Includes:
o	Order details
o	Customer information
o	Product categories and sub-categories
o	Sales, discount, and profit values
o	Order and shipping dates

After cleaning, the dataset was exported as a clean CSV file and used for SQL analysis and dashboard creation.

🧹 Data Cleaning (Python)
Data cleaning was performed using Python to ensure high-quality, analysis-ready data.
Key Cleaning Steps:
•	Removed duplicate records
•	Handled missing and null values
•	Standardized date formats
•	Corrected data types (numeric, date, categorical)
•	Removed irrelevant columns
•	Created derived columns for analytical use
📁 Output File: data/ecommerce_sales_cleaned.csv

🗄 SQL Analysis (Manager-Level Queries)
A comprehensive set of 25+ SQL queries was written to answer real business questions commonly asked by managers and stakeholders.
SQL Concepts Used:
•	INNER JOIN, LEFT JOIN
•	GROUP BY & HAVING
•	Subqueries
•	Common Table Expressions (CTEs)
•	Window Functions (RANK, DENSE_RANK, ROW_NUMBER, RUNNING TOTAL)
Sample Business Questions Answered:
•	What are the monthly and yearly sales trends?
•	Which customers generate the highest lifetime value?
•	Which products and categories are the most profitable?
•	Which regions have high sales but low profitability?
•	What is the revenue contribution of the top 10 customers?
📁 SQL File: sql/ecommerce_analysis_queries.sql

📌 Key SQL Skills Demonstrated
•	Translating business questions into SQL logic
•	Customer lifetime value and ranking analysis
•	Advanced analytics using window functions
•	Performance-focused queries using CTEs
•	Business-oriented data aggregation

📊 Power BI Dashboard
An interactive Power BI dashboard was built using the cleaned dataset to visualize key performance indicators and trends.
Dashboard Highlights:
•	Total Sales, Profit, Orders, and Customers
•	Sales & profit trends over time
•	Category and sub-category performance
•	Regional sales analysis
•	Top customers and products
📄 Dashboard Export: dashboards/powerbi_dashboard.pdf

🖼 Dashboard Screenshots
Key snapshots from the Power BI dashboards are shown below to provide a quick overview of insights.

📌 Executive Summary – Overall Performance
![Executive Summary](images/dashboard_overview.png)

📌 Sales Trend Analysis
![Sales Trend Analysis](images/sales_trend_analysis.png)

📌 Category & Product Performance
![Category Performance](images/category_performance.png)

📌 Customer Analysis
![Customer Analysis](images/customer_analysis.png)

📌 Regional Analysis
![Regional Analysis](images/regional_analysis.png)

> 📢 *The full interactive experience is available in the Power BI file. These screenshots highlight the most important analytical insights.*

📈 Key Business Insights
•	A small percentage of customers contribute a large share of total revenue
•	Some product categories generate high sales but lower profit margins
•	Strong seasonal trends significantly impact sales performance
•	Certain regions underperform in profitability despite high sales
•	Discount levels have a direct impact on overall profit margins
________________________________________
✅ Business Recommendations
•	Focus on retaining high-value customers through loyalty programs
•	Optimize discount strategies to protect profit margins
•	Re-evaluate pricing for low-margin, high-volume products
•	Design region-specific marketing strategies for underperforming areas
________________________________________
📁 Project Structure
Ecommerce-Sales-Analytics
│
├── data
│   ├── raw_data.csv
│   └── ecommerce_sales_cleaned.csv
│
├── notebooks
│   └── data_cleaning.ipynb
│
├── sql
│   └── ecommerce_analysis_queries.sql
│
├── dashboards
│   └── powerbi_dashboard.pdf
│
├── images
│   ├── dashboard_overview.png
│   ├── category_performance.png
│   └── regional_customer_analysis.png
│
├── README.md
________________________________________
## 🚀 Project Outcome
This project demonstrates a complete data analytics workflow: Raw data → Data cleaning → SQL-driven insights → Interactive business dashboards.
It reflects real-world analytics tasks and is suitable for:
- Data Analyst interviews
- Fresher / Entry-level analytics roles
- Portfolio and resume projects

________________________________________
📬 Contact
Author: Abhishek Biswas
Role: Aspiring Data Analyst
Feel free to connect or provide feedback on this project.




