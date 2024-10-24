-- quantos produtos temos na categoria artes?
-- 55

SELECT 
       count(distinct product_id) as qtde_itens,
       count(product_id) as qtde_produtos,
       count(distinct product_id) as qtde_produtos_distintos,
       count(distinct product_category_name) as qtde_categorias_distintas

FROM tb_products

WHERE product_category_name = 'artes'

