# ==========================
#        SUBQUERY
# ==========================

# Subquery como tabela:
select 
    avg(product_qtd) as product_avg
from(
    select
        i.product_id,
        i.price,
        p.product_id,
        p.product_category_name,
        count(p.product_id) as product_qtd
    from analysis.items as i
    left join analysis.products as p on p.product_id = i.product_id
    group by i.product_id, i.price, p.product_id,p.product_category_name) as function;



# Subquery como tabela com join:
select 
    c.customer_id,
    count(distinct c.customer_id) as customer_quantity
from analysis.customers as c
join (
    select distinct
        o.customer_id,
        o.order_status,
        to_char(o.order_approved_at::date, 'YYYY-MM') as order_approved_at
    from analysis.orders as o
    where o.order_approved_at between '2018-08' and '2018-09') as t on t.customer_id = c.customer_id
where t.order_status = 'delivered'
group by c.customer_id
order by customer_quantity;