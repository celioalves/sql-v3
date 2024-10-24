-- Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria. 
-- Considere apenas os objetos que tenham a descrição maior que 10 0.

SELECT 
      product_category_name,
      avg(product_name_lenght) as avg_len_name,
      max(product_name_lenght) as max_len_name,
      min(product_name_lenght) as min_len_name

FROM tb_products

WHERE product_description_lenght >= 100

GROUP BY product_category_name

