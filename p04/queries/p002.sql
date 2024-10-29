-- qual o valor total de receita gerada por sellers de cada estado? Apenas pedidos entregues

-- tb_customers = customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state
-- tb_sellers = seller_id, seller_zip_code_prefix, seller_city, seller_state
-- tb_order_items = order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value
-- tb_orders = order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date

SELECT 
        t3.seller_state,
        sum(t2.price) as receita_total,
        count(distinct t2.seller_id) as qtde_sellers,
        round(sum(t2.price) / count(distinct t2.seller_id), 3) as avg_receita_seller

FROM tb_orders as t1

LEFT JOIN tb_order_items as t2
ON t1.order_id = t2.order_id

LEFT JOIN tb_sellers as t3
ON t2.seller_id = t3.seller_id

WHERE t1.order_status = 'delivered'

GROUP by t3.seller_state

