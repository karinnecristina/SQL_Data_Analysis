# ==========================
#        SUBQUERY
# ==========================

# Subquery de tabela:
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
