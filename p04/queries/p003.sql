-- qual o peso médio dos produtos vendidos por sellers de cada estado?
-- considere apenas o ano de 2017 e pedidos entregues.

-- tb_customers = customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state
-- tb_sellers = seller_id, seller_zip_code_prefix, seller_city, seller_state
-- tb_order_items = order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value
-- tb_orders = order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date
-- tb_products = product_id, product_category_name, product_name_lenght, product_description_lenght, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm


SELECT 
        t4.seller_state,
        round(avg(t3.product_weight_g / 1000), 4) as avg_peso_produto_kg

FROM tb_orders as t1

LEFT JOIN tb_order_items as t2
ON t1.order_id = t2.order_id

LEFT JOIN tb_products as t3
ON t2.product_id = t3.product_id

LEFT JOIN tb_sellers as t4
ON t2.seller_id = t4.seller_id


WHERE t1.order_status = 'delivered' 
AND strftime('%Y', t1.order_approved_at) = '2017'

GROUP BY t4.seller_state