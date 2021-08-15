# ==========================
#         DATE
# ==========================

# Obtendo a data:
select
    order_id,
    order_approved_at,
    to_char(order_approved_at::date, 'DD-MM-YYYY') as date
from analysis.orders;

# ==========================
#         TIME
# ==========================

# Obtendo a hora:

select
    order_id,
    order_approved_at,
    to_char(order_approved_at::time, 'HH') as time
from analysis.orders;

# ==========================
#         TIMESTAMP
# ==========================

# Obtendo a data e a hora:
select
    order_id,
    order_approved_at,
    to_char(order_approved_at::timestamp, order_approved_at) as timestamp
from analysis.orders;

# ==========================
#         EXTRACT
# ==========================

# Extraindo algumas informações da base de dados:
select
    review_id,
    review_answer_timestamp,
    extract(year from review_answer_timestamp::date) as year,
    extract(month from review_answer_timestamp::date) as month,
    extract(day from review_answer_timestamp::date) as day,
    extract(isodow from review_answer_timestamp::date) as dayofweek,
    extract(week from review_answer_timestamp::date) as week,
    extract(hour from review_answer_timestamp::time) as hour
from analysis.reviews
limit 200;

# Número de pedidos por dia de semana:

select 
    count(distinct review_id) as number_orders,
    extract(isodow from review_answer_timestamp::date) as dayofweek,
    case 
        when extract(isodow from review_answer_timestamp::date) = 1 then 'Domingo'
        when extract(isodow from review_answer_timestamp::date) = 2 then 'Segunda-Feira'
        when extract(isodow from review_answer_timestamp::date) = 3 then 'Terça-Feira'
        when extract(isodow from review_answer_timestamp::date) = 4 then 'Quarta-Feira'
        when extract(isodow from review_answer_timestamp::date) = 5 then 'Qunita-Feira'
        when extract(isodow from review_answer_timestamp::date) = 6 then 'Sexta-Feira'
        when extract(isodow from review_answer_timestamp::date) = 7 then 'Sábado'
    end as dayofweek_text
from analysis.reviews
group by dayofweek,dayofweek_text
order by number_orders desc;