# Selecionando todos os produtos com os 
# preços entre R$ 10,00 e R$ 50,00:
select 
    price
from analysis.items
where price between 10 and 50;

# Selecionando todas as cidades que comecem com a letra 'b':
select 
    seller_city
from analysis.sellers
where seller_city like 'b%';

# Selecionando todos os registros da tabela customers
# onde o Estado é igual a MG (Minas Gerais) ou PR (Paraná):
select 
    *
from analysis.customers
where customer_state in ('MG','PR');

# Selecionando todos os registros da tabela reviews
# onde os comentários são nulos:
select 
    *
from analysis.reviews
where review_comment_message is null;

# Selecionado os registros onde a nota foi igual a 1
# e o comentário não é nulo:
select 
    t1.review_id, t1.review_score, t1.review_comment_message
from analysis.reviews as t1 
where t1.review_score = 1 and t1.review_comment_message is not null;

# Selecionando todos os registros onde o pedido
# está cancelado ou indisponível:
select 
    *
from analysis.orders
where order_status in ('canceled','unavailable');