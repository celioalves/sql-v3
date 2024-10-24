-- Crie uma coluna nova que contenha a informação de volume em m³

SELECT
        product_id,
        product_category_name,
        product_name_lenght,
        product_description_lenght,
        product_photos_qty,
        product_weight_g,
        product_length_cm,
        product_height_cm,
        product_width_cm,
        product_length_cm * product_height_cm * product_width_cm / 1000000 as product_volume_m3

FROM tb_products

