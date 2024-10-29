-- qual a receita de cada categoria de produto?
-- e o total de vendas?
-- em unidades e em pedidos?
-- considerando apenas as vendas de 2017 e pedidos entregues

SELECT  
        t2.product_category_name,
        sum(t1.price) as receita,
        count(*) as total_itens_vend,
        count(distinct t1.order_id) as qtde_pedidos,
        round( count(*) / cast ( count(distinct t1.order_id) as float), 2) as avg_item_por_pedido

FROM tb_order_items as t1

LEFT JOIN tb_products as t2
ON t1.product_id = t2.product_id

LEFT JOIN tb_orders as t3
ON t1.order_id = t3.order_id

WHERE t3.order_status = 'delivered'
AND cast(strftime('%Y', t3.order_approved_at) as int) = 2017

GROUP BY t2.product_category_name
ORDER BY count(*) / cast ( count(distinct t1.order_id) as float) desc