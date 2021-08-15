# ==========================
#         GROUP BY 
# ==========================

# Quantidade de produtos por data:
select  
    date(order_purchase_timestamp) as day,
    count(order_id) as amount
from analysis.orders
group by day;

# ==========================
#         ORDER BY 
# ==========================

# Ordenando a tabela pela quantidade de pedidos por dia (do maior para o menor - desc)
select  
    date(order_purchase_timestamp) as day,
    count(order_id) as amount
from analysis.orders
group by day
order by amount desc;