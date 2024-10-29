-- objetivo
-- Qual o produto mais caro que o seller já vendeu?
-- considere apenas produtos entregues


WITH tb_seller_product as (
        SELECT  seller_id,
                product_id,
                count(*) as qtde_produto,
                sum(price) as receita_produto
        
        FROM tb_orders as t1

        LEFT JOIN tb_order_items as t2
        on t1.order_id = t2.order_id

        WHERE order_status = 'delivered'

        GROUP BY seller_id,
                 product_id
        
        ORDER BY seller_id
),

tb_seller_sort as (SELECT *,
       row_number() over (partition by seller_id 
                          order by qtde_produto desc, receita_produto desc) as order_qtde
FROM tb_seller_product
)

SELECT seller_id,
       product_id,
       qtde_produto

FROM tb_seller_sort

WHERE order_qtde = 1
