-- qual o valor total de receita gerada por clientes de cada estado?
-- Considere a base completa, com apenas pedidos entregues.

-- t1 tb_orders = order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date
-- t2 tb_customers = customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state
-- t3 tb_order_items = order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value



SELECT 
        t2.customer_state,
        round(sum(t3.price) / count(distinct t1.customer_id), 3) as avg_receita_cliente


FROM tb_orders as t1

LEFT JOIN tb_customers as t2
ON t1.customer_id = t2.customer_id

LEFT JOIN tb_order_items as t3
ON t1.order_id = t3.order_id


WHERE t1.order_status = 'delivered'

GROUP BY t2.customer_state

ORDER BY t2.customer_state

