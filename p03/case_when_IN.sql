SELECT
       DISTINCT case WHEN product_category_name is null then 'outros'
                     
                     WHEN product_category_name = 'alimentos'
                            or product_category_name = 'alimentos_bebidas' then 'alimentos'
                     
                     WHEN product_category_name IN ('artes', 'artes_e_artesanato') then 'artes'

                     ELSE product_category_name
              END as categoria_fillna

FROM tb_products

ORDER BY product_category_name 