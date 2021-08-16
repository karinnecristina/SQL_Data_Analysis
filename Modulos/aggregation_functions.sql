# ==========================
#         COUNT 
# ==========================

# Número de linhas de uma tabela:
select  
    count(*) as number_lines
from analysis.sellers;

# Quantidade das formas de pagamento:
select  
    count(distinct payment_type) as payment
from analysis.payments;

# Número de pedidos por mês:
select
    count(order_id) as order_quantity,
    to_char(order_purchase_timestamp ::date, 'YYYY-MM') as month
from analysis.orders
group by month
order by month;

# Número de pedidos entregue para o Estado de SP por mês:
select
    count(case when order_status!='delivered' then order_id end) as order_quantity_SP,
    to_char(order_purchase_timestamp ::date, 'YYYY-MM') as month
from analysis.orders
group by month
order by month;

# ==========================
#         MAX
# ==========================

# Preço máximo de um item:
select 
    max(price) as maximum_price
from analysis.items;

# Preço máximo de cada uma das categorias de produtos:
select 
    p.product_category_name,
    max(cast(price as float)) as maximum_price
from analysis.products as p
left join analysis.items as i on i.product_id = p.product_id
group by p.product_category_name
order by maximum_price desc;

# ==========================
#         MIN
# ==========================

# Preço máximo de um item:
select 
    min(price) as maximum_price
from analysis.items;

# Preço máximo de cada uma das categorias de produtos:
select 
    p.product_category_name,
    min(cast(price as float)) as maximum_price
from analysis.products as p
left join analysis.items as i on i.product_id = p.product_id
group by p.product_category_name
order by maximum_price;

# ==========================
#         SUM
# ==========================

# Faturamento diário da empresa:
select 
    to_char(order_purchase_timestamp ::date, 'YYYY-MM-DD') as day,
    sum(cast(price as int)) as total_sale
from analysis.items as i 
join analysis.orders as o on o.order_id = i.order_id
group by day;

# Número de clientes do Acre:
select
    sum(case when customer_state='AC' then 1 else 0 end) as order_quantity_AC
from analysis.customers;

# ==========================
#         AVG
# ==========================

# Média dos preços por categoria de produtos:
select 
    p.product_category_name,
    avg(cast(price as float)) as avg_price
from analysis.products as p
left join analysis.items as i on i.product_id = p.product_id
group by p.product_category_name
order by avg_price;