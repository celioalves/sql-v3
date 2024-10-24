-- quantos produtos na categoria beleza_saude tem menos de 1 litro --
-- 1680 --
 
SELECT count(*) as qtde_linhas

FROM tb_products

WHERE product_category_name = 'beleza_saude'
and product_height_cm * product_length_cm * product_width_cm / 1000 < 1

