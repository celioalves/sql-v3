-- O marketing quer enviar e-mail para os vendedores que estão a mais de 90 dias sem vender
-- nós temos uma proposta que é a seguinte, enviar e-mail para os vendedores que estão sem vender a mais do que o prazo médio
-- a data base usada é 2018-07-01

with tb_marcacao_seller as (

SELECT  t2.seller_id,

        max(t1.order_approved_at) as dt_lst_venda,

        '2018-07-01' as data_atual,
        
        /* Isso é o que o marketing quer */
        julianday('2018-07-01') - julianday(max(order_approved_at)) as dif_lst_venda,

        case when julianday('2018-07-01') - julianday(max(order_approved_at)) > 90
            then 1 else 0
            end as flag_venda_90dias,

        /* Essa é a nossa proposta. Vendedores com uma venda só serão nulos. */
        t3.tempo_medio_venda,
        case WHEN julianday('2018-07-01') - julianday(max(order_approved_at)) > t3.tempo_medio_venda
            then 1 else 0
            end as flag_tempo_medio



FROM  tb_orders as t1

LEFT JOIN tb_order_items as t2
ON t1.order_id = t2.order_id

LEFT JOIN tb_avg_compra_seller as t3
ON t2.seller_id = t3.seller_id


WHERE date(order_approved_at) < '2018-07-01'
AND t1.order_status = 'delivered'

GROUP BY t2.seller_id

)

SELECT  
        sum(flag_venda_90dias) as qtde_90_dias,
        sum(flag_tempo_medio) as qtde_avg_temp

FROM tb_marcacao_seller