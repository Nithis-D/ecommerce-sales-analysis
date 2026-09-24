
-- E-COMMERCE SALES ANALYSIS
-- Product Analysis
-- =======================================================================================================


-- Q3. Product Performance
SELECT
    Product,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM ecommerce_sales
GROUP BY Product
ORDER BY total_sales DESC;


-- Q8. Top-Selling Product in Each Region
SELECT *
FROM (
    SELECT
        Region,
        Product,
        ROUND(SUM(Sales), 2) AS total_sales,
        ROUND(SUM(Profit), 2) AS total_profit,
        ROW_NUMBER() OVER (
            PARTITION BY Region
            ORDER BY SUM(Sales) DESC
        ) AS sales_rank
    FROM ecommerce_sales
    GROUP BY Region, Product
) AS ranked_products
WHERE sales_rank = 1;
