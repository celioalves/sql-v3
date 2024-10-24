-- sempre minimizar a quantidade de subqueries
-- no caso do having, podemos usar o n_vendedores no sqlite 
-- mas em alguns bancos de dados temos que fazer como o disposto

SELECT 
        seller_state,
        count(*) as n_vendedores
      

FROM tb_sellers

-- filtror pré agg
WHERE seller_state in ('SP', 'RJ', 'PR') 

GROUP BY seller_state

-- filtro pós agg
HAVING count(*) > 10