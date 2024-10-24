-- bebes acima de uma foto ou perfumaria acima de 4 fotos --

SELECT product_id, 
       product_category_name, 
       product_photos_qty

FROM tb_products as t1

WHERE (t1.product_category_name = 'bebes'
      and t1.product_photos_qty > 1)
OR (t1.product_category_name = 'perfumaria'
      and t1.product_photos_qty > 5)

