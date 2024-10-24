-- coalesce substitui o que é nulo pelo valor colocado, podem ser passados vários valores e ele vai adicionar o primeiro não nulo.

SELECT
        DISTINCT coalesce(product_category_name, 'outros') as categoria_fillna

FROM tb_products

ORDER BY product_category_name 