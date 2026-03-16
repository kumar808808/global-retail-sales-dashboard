Total revnue
SELECT SUM(payment_value) FROM  payments

Total orders
SELECT COUNT(distinct order_id) FROM orders_clean

Which product categories generate the most revenue?
SELECT p.product_category_name,
SUM(oi.price) AS total_revenue 
FROM order_items oi 
JOIN products p ON 
oi.product_id = p.product_id GROUP BY 
p.product_category_name 
ORDER BY total_revenue DESC limit 5

Which states generate the most orders?
SELECT customers.customer_state,
COUNT(order_id) AS order_count 
FROM orders 
INNER JOIN customers 
ON orders.customer_id=customers.customer_id 
GROUP BY customers.customer_state
 ORDER BY  order_count desc limit 10 

Average order value
SELECT SUM(payment_value) / COUNT(DISTINCT order_id) AS avg_order_value FROM payments

Monthly sales trend
SELECT DATE_TRUNC('month',CAST(order_purchase_timestamp AS TIMESTAMP)) AS month,
COUNT(order_id) AS total_orders 
FROM orders 
GROUP BY month 
ORDER BY month

JOINING CLEANING DATA SET FOR SAVING COPY
SELECT o.order_id,
CAST(o.order_purchase_timestamp AS TIMESTAMP) AS purchase_date,
c.customer_state,
p.product_category_name,
oi.price,pay.payment_value
 FROM orders 
o JOIN customers c ON o.customer_id = c.customer_id 
JOIN order_items oi ON 
o.order_id = oi.order_id 
JOIN products p 
ON oi.product_id = p.product_id 
JOIN payments pay 
ON o.order_id = pay.order_id



















