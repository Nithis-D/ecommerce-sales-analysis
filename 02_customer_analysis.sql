
-- E-COMMERCE SALES ANALYSIS
-- Customer Analysis
-- ==========================================================================================================

-- Q5. Top 10 Customers by Sales
SELECT
    Customer_ID,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity
FROM ecommerce_sales
GROUP BY Customer_ID
ORDER BY total_sales DESC
LIMIT 10;


-- Q10. Customer Order Frequency
SELECT
    Customer_ID,
    COUNT(*) AS order_count,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY Customer_ID
ORDER BY order_count DESC, total_sales DESC
LIMIT 10;
