SELECT
       DISTINCT case WHEN product_category_name is null then 'outros'
                     
                     ELSE product_category_name
                     END as categoria_fillna

FROM tb_products

ORDER BY product_category_name