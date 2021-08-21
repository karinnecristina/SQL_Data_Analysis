# ==========================
#        FIRST_VALUE
# ==========================

# Retorna o primeiro valor da janela:
select 
    customer_id,
    to_char(order_approved_at::date, 'YYYY-MM') as order_approved_at,
    first_value(order_approved_at) over(partition by customer_id order by order_approved_at) as first_purchase
from analysis.orders
where order_status = 'delivered'
order by order_approved_at;

# ==========================
#        LAST_VALUE
# ==========================

# Retorna o último valor da janela:
select 
    customer_id,
    to_char(order_approved_at::date, 'YYYY-MM') as order_approved_at,
    last_value(order_approved_at) over(partition by customer_id order by order_approved_at 
              rows between unbounded preceding and unbounded following) as last_purchase
from analysis.orders
where order_status = 'delivered'
order by order_approved_at;

# ==========================
#           LEAD
# ==========================

# Retorna o registro subsequente (a próxima linha):
select 
    customer_id,
    to_char(order_approved_at::date, 'YYYY-MM') as order_approved_at,
    lead(order_approved_at) over(partition by customer_id order by order_approved_at) as subsequent_record
from analysis.orders
where order_status = 'delivered'
order by order_approved_at;

# ==========================
#           LAG
# ==========================

# Retorna o registro anterior:
select 
    customer_id,
    to_char(order_approved_at::date, 'YYYY-MM') as order_approved_at,
    lag(order_approved_at) over(partition by customer_id order by order_approved_at) as previous_date
from analysis.orders
where order_status = 'delivered'
order by order_approved_at;

# ==========================
#           RANK
# ==========================

# Retorna o ranqueamento das janelas:
select 
    order_id,
    payment_type,
    rank() over(partition by order_id order by payment_type) as rank
from analysis.payments
where payment_type = 'boleto'
order by order_id;

# ==========================
#        ROW_NUMBER
# ==========================

# Retorna o número da linha do resultado:
select 
    product_category_name,
    rank() over(order by product_category_name) as rank,
    row_number() over(order by product_category_name) as rank_line
from analysis.products;
