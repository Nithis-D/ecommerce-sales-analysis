
-- E-COMMERCE SALES ANALYSIS
-- Sales & Business Performance
-- ==========================================================================================================

-- Q1. Overall Business Performance

SELECT 
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM ecommerce_sales;

-- Q2. Region Performance
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM ecommerce_sales
GROUP BY Region
ORDER BY total_sales DESC;

-- Q4. Category Performance
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM ecommerce_sales
GROUP BY Category
ORDER BY total_sales DESC;


-- Q6. Monthly Sales Trend
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS order_month,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity
FROM ecommerce_sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY order_month;

-- Q7. Discount vs Profitability
SELECT
    ROUND(Discount * 100, 0) AS discount_percent,
    COUNT(*) AS order_count,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM ecommerce_sales
GROUP BY ROUND(Discount * 100, 0)
ORDER BY discount_percent;

-- Q9. Best Region for Each Category
SELECT *
FROM (
    SELECT
        Category,
        Region,
        ROUND(SUM(Sales), 2) AS total_sales,
        ROUND(SUM(Profit), 2) AS total_profit,
        ROW_NUMBER() OVER (
            PARTITION BY Category
            ORDER BY SUM(Sales) DESC
        ) AS sales_rank
    FROM ecommerce_sales
    GROUP BY Category, Region
) AS ranked_categories
WHERE sales_rank = 1
ORDER BY Category;