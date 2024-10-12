-- Customer yang telah menyelesaikan transaksi
SELECT cu.customer_name, pr.product_name, od.quantity, pa.amount_paid, pa.payment_status
FROM orders AS o
INNER JOIN customers AS cu USING(customer_id)
INNER JOIN payments AS pa USING(order_id)
INNER JOIN order_details AS od USING(order_id)
INNER JOIN products AS pr USING(product_id)
WHERE pa.payment_status = 'Lunas';

-- Income bulan oktober yang statusnya 'Selesai'
SELECT 'Rp' || SUM(total_amount)::text AS pendapatan_okt
FROM orders
WHERE order_date BETWEEN '2024-10-01' AND '2024-10-15' AND order_status = 'Selesai';

-- View total penjualan per produk
CREATE VIEW product_sales AS
SELECT pr.product_name, SUM(od.quantity) AS total_qty_sold, SUM(od.quantity * od.price_per_unit) AS total_sales
FROM order_details AS od 
JOIN products AS pr USING(product_id)
GROUP BY pr.product_name;
