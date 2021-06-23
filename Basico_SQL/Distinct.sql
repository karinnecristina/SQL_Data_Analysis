'''
Extraindo o ano em que o cliente realizou o pedido
'''
select distinct 
    date_part('year', order_approved_at::date) as ano 
from analysis.orders;