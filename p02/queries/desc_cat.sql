-- faça uma query que apresente o tamanho médio, mínimo e máximo da descrição de um objeto por categoria

SELECT
    product_category_name,
    avg(product_description_lenght) as tam_desc_medio,
    max(product_description_lenght) as tam_desc_max,
    min(product_description_lenght) as tam_desc_min


FROM tb_products

WHERE product_category_name IS NOT null

GROUP BY product_category_name
    