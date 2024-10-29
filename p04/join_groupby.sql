-- qual a receita de cada categoria de produto?
-- e o total de vendas?
-- em unidades e em pedidos?

SELECT  
        t2.product_category_name,
        sum(t1.price) as receita,
        count(*) as total_itens_vend,
        count(distinct t1.order_id) as qtde_pedidos

FROM tb_order_items as t1

LEFT JOIN tb_products as t2
on t1.product_id = t2.product_id

GROUP BY t2.product_category_name

ORDER BY sum(t1.price) desc