-- faça uma query que apresente o tamanho médio, mínimo e máximo do NOME de um objeto por categoria

SELECT 
    product_category_name,
    avg(product_name_lenght) as tam_nome_avg,
    max(product_name_lenght) as tam_nome_max,
    min(product_name_lenght) as tam_nome_min

FROM tb_products

WHERE product_category_name is NOT null

GROUP BY product_category_name