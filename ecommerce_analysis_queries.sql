use Ecommerce_Sales_DB

SELECT COUNT(*) AS total_rows FROM ecommerce_sales;
SELECT TOP 10 * FROM ecommerce_sales;


-- Q1. What are total sales, profit, and total orders?

CREATE VIEW vw_q01_overall_kpis AS

SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM ecommerce_sales;


-- Q2. What is year-wise sales performance?

CREATE VIEW vw_q02_yearly_sales AS

SELECT order_year, SUM(sales) AS total_sales
FROM ecommerce_sales
GROUP BY order_year;


-- Q3. Which quarter generates the highest sales?

CREATE VIEW vw_q03_quarter_sales AS

SELECT order_quarter, SUM(sales) AS total_sales
FROM ecommerce_sales
GROUP BY order_quarter;


-- Q4. What are top 10 products by sales?

CREATE VIEW vw_q04_top_products_sales AS

SELECT TOP 10 product_name, SUM(sales) AS total_sales
FROM ecommerce_sales
GROUP BY product_name
ORDER BY total_sales DESC;

-- Q5. What are top 10 products by profit?

CREATE VIEW vw_q05_top_products_profit AS

SELECT TOP 10 product_name, SUM(profit) AS total_profit
FROM ecommerce_sales
GROUP BY product_name
ORDER BY total_profit DESC;


-- Q6. Which products are loss-making?

CREATE VIEW vw_q06_loss_products AS

SELECT product_name, SUM(profit) AS total_loss
FROM ecommerce_sales
GROUP BY product_name
HAVING SUM(profit) < 0;


-- Q7. Category-wise sales and profit

CREATE VIEW vw_q07_category_performance AS

SELECT category, SUM(sales) AS sales, SUM(profit) AS profit
FROM ecommerce_sales
GROUP BY category;


-- Q8. Profit margin by category

CREATE VIEW vw_q08_category_margin AS

SELECT category,
ROUND(SUM(profit) * 100.0 / SUM(sales), 2) AS profit_margin
FROM ecommerce_sales
GROUP BY category;



-- Q9. Discount impact on profit

CREATE VIEW vw_q09_discount_profit AS

SELECT discount_flag, SUM(profit) AS total_profit
FROM ecommerce_sales
GROUP BY discount_flag;


-- Q10. High discount orders resulting in loss

CREATE VIEW vw_q10_high_discount_loss AS

SELECT order_id, product_name, discount, profit
FROM ecommerce_sales
WHERE discount >= 0.4 AND profit < 0;



-- Q11. Region-wise sales and profit

CREATE VIEW vw_q11_region_performance AS

SELECT region, SUM(sales) AS sales, SUM(profit) AS profit
FROM ecommerce_sales
GROUP BY region;


-- Q12. Most profitable region

CREATE VIEW vw_q12_best_region AS

SELECT TOP 1 region, SUM(profit) AS total_profit
FROM ecommerce_sales
GROUP BY region
ORDER BY total_profit DESC;



-- Q13. Top 10 customers by revenue

CREATE VIEW vw_q13_top_customers AS

SELECT TOP 10 customer_name, SUM(sales) AS revenue
FROM ecommerce_sales
GROUP BY customer_name
ORDER BY revenue DESC;



-- Q14. Segment-wise profitability

CREATE VIEW vw_q14_segment_profit AS

SELECT segment, SUM(profit) AS total_profit
FROM ecommerce_sales
GROUP BY segment;



-- Q15. Average shipping days by ship mode

CREATE VIEW vw_q15_shipping_days AS

SELECT ship_mode, AVG(ship_days) AS avg_ship_days
FROM ecommerce_sales
GROUP BY ship_mode;



-- Q16. Shipping delay impact on profit

CREATE VIEW vw_q16_shipping_profit AS

SELECT ship_days, SUM(profit) AS total_profit
FROM ecommerce_sales
GROUP BY ship_days;


-- Q17. Percentage of loss-making orders

CREATE VIEW vw_q17_loss_percentage AS

SELECT 
ROUND(
COUNT(CASE WHEN profit < 0 THEN 1 END) * 100.0 / COUNT(*), 2
) AS loss_percentage
FROM ecommerce_sales;


-- Q18. Average order value

CREATE VIEW vw_q18_avg_order_value AS

SELECT 
ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM ecommerce_sales;



-- Q19. Monthly sales trend

CREATE VIEW vw_q19_monthly_sales AS

SELECT order_month, SUM(sales) AS total_sales
FROM ecommerce_sales
GROUP BY order_month;


-- Q20. Zero discount orders count

CREATE VIEW vw_q20_zero_discount_orders AS

SELECT COUNT(*) AS zero_discount_orders
FROM ecommerce_sales
WHERE discount = 0;



-- Q21. Rank products by sales within each category

CREATE VIEW vw_q21_rank_products_by_category AS

SELECT category, product_name,
SUM(sales) AS total_sales,
RANK() OVER (PARTITION BY category ORDER BY SUM(sales) DESC) AS sales_rank
FROM ecommerce_sales
GROUP BY category, product_name;



-- Q22. Top 3 products by profit in each region

CREATE VIEW vw_q22_top3_products_region AS

SELECT *
FROM (
    SELECT region, product_name,
           SUM(profit) AS total_profit,
           ROW_NUMBER() OVER (PARTITION BY region ORDER BY SUM(profit) DESC) AS rn
    FROM ecommerce_sales
    GROUP BY region, product_name
) t
WHERE rn <= 3;



-- Q23. Running total of sales year-wise

CREATE VIEW vw_q23_running_sales AS

SELECT order_year,
SUM(sales) AS yearly_sales,
SUM(SUM(sales)) OVER (ORDER BY order_year) AS running_sales
FROM ecommerce_sales
GROUP BY order_year;


-- Q24. Compare current order profit with previous order profit

CREATE VIEW vw_q24_profit_lag AS

SELECT order_id, order_date, profit,
LAG(profit) OVER (ORDER BY order_date) AS previous_order_profit
FROM ecommerce_sales;



-- Q25. Average profit per category vs overall average profit

CREATE VIEW vw_q25_category_vs_avg AS

SELECT category,
AVG(profit) AS category_avg_profit,
AVG(AVG(profit)) OVER () AS overall_avg_profit
FROM ecommerce_sales
GROUP BY category;



-- Q26. Identify top-performing category each year

CREATE VIEW vw_q26_top_category_per_year AS

SELECT *
FROM (
    SELECT order_year, category,
           SUM(profit) AS total_profit,
           DENSE_RANK() OVER (PARTITION BY order_year ORDER BY SUM(profit) DESC) AS rnk
    FROM ecommerce_sales
    GROUP BY order_year, category
) t
WHERE rnk = 1;




-- Q27. Percentage contribution of each category to total sales

CREATE VIEW vw_q27_category_sales_pct AS

SELECT category,
SUM(sales) AS category_sales,
ROUND(
SUM(sales) * 100.0 / SUM(SUM(sales)) OVER (), 2
) AS sales_percentage
FROM ecommerce_sales
GROUP BY category;



-- Q28. Identify products with declining profit trend

CREATE VIEW vw_q28_declining_profit AS

SELECT product_name, order_year, SUM(profit) AS yearly_profit,
LAG(SUM(profit)) OVER (PARTITION BY product_name ORDER BY order_year) AS prev_year_profit
FROM ecommerce_sales
GROUP BY product_name, order_year;



-- Q29. Rank customers by revenue within each segment

CREATE VIEW vw_q29_customer_rank_segment AS

SELECT segment, customer_name,
SUM(sales) AS revenue,
RANK() OVER (PARTITION BY segment ORDER BY SUM(sales) DESC) AS segment_rank
FROM ecommerce_sales
GROUP BY segment, customer_name;



-- Q30. Identify top 5% highest-value orders

CREATE VIEW vw_q30_top_5_percent_orders AS

SELECT *
FROM (
    SELECT order_id, sales,
           NTILE(20) OVER (ORDER BY sales DESC) AS bucket
    FROM ecommerce_sales
) t
WHERE bucket = 1;

























