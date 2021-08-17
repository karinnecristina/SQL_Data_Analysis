# ==========================
#        INNER JOIN
# ==========================

# Unindo as tabelas de ordem e produtos:
select
    i.order_id,
    i.product_id,
    i.price,
    p.product_category_name
from analysis.items as i
inner join analysis.products as p on p.product_id = i.product_id; 

# ==========================
#        LEFT JOIN
# ==========================

# Unindo as tabelas de ordem e pagamentos:
select
    o.order_id,
    o.order_status,
    o.order_approved_at,
    o.order_estimated_delivery_date,
    p.order_id,
    p.payment_type,
    p.payment_value
from analysis.orders as o
left join analysis.payments as p on p.order_id = o.order_id;


# Unindo as tabelas de ordem e pagamentos filtrando os valores nulos:
select
    o.order_id,
    o.order_status,
    o.order_approved_at,
    o.order_estimated_delivery_date,
    p.order_id,
    p.payment_type,
    p.payment_value
from analysis.orders as o
left join analysis.payments as p on p.order_id = o.order_id
where p.order_id is null;

# ==========================
#        RIGHT JOIN
# ==========================

# Unindo as tabelas de items e sellers:
select
    i.seller_id,
    i.price,
    s.seller_id,
    s.seller_city,
    s.seller_state
from analysis.items as i
right join analysis.sellers as s on s.seller_id = i.seller_id;

# Unindo as tabelas de items e sellers filtrando os valores nulos:
select
    i.seller_id,
    i.price,
    s.seller_id,
    s.seller_city,
    s.seller_state
from analysis.items as i
right join analysis.sellers as s on s.seller_id = i.seller_id
where i.seller_id is null;

# ==========================
#        FULL JOIN
# ==========================

# Unindo as tabelas de ordem, produto e reviews
# Selecionando apenas os registros que tem review
# e ordenando da review_score mais baixo para o mais alto:
select 
    i.order_id,
    i.product_id,
    pr.product_id,
    pr.product_category_name,
    p.order_id,
    p.payment_type,
    p.payment_value,
    r.order_id,
    r.review_score,
    r.review_comment_message
from analysis.payments as p
full join analysis.reviews as r on r.order_id = p.order_id
full join analysis.items as i on i.order_id = r.order_id
full join analysis.products as pr on pr.product_id = i.product_id
where r.review_comment_message is not null
order by r.review_score
limit 1000;