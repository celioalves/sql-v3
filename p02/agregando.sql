-- seleção da categoria do produto e executando cada função nela, na tabela tb_products
-- onde o valor não seja nulo, agrupando por categoria

SELECT 
       product_category_name, 
       count(*) as qtde_produtos,
       max(product_weight_g) as peso_max,
       min(product_weight_g) as peso_min,
       avg(product_weight_g) as avg_peso

FROM tb_products

-- O where sempre vem antes do group by (no processamento também)
WHERE product_category_name is not null

GROUP BY product_category_name