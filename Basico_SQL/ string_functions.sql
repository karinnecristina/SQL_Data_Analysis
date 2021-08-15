
# ==========================
#         CONCAT 
# ==========================

# Juntando strings:
select 
    'Ana' as first_name,
    'Paula' as last_name,
    concat('Ana',' ','Paula') as full_name;

select 
    order_id,
    concat('Forma de pagamento: ',payment_type,' - ','Valor da compra: ',payment_value) as INFOS
from analysis.payments
limit 200;

# ==========================
#         STARTS_WITH 
# ==========================

# Retornar o nome dos produtos que começa com 'ca' (apenas dos valores = true):
select 
    product_id,
    product_category_name
from analysis.products
where starts_with(product_category_name,'ca') is true;

# ==========================
#         LOWER
# ==========================

# Convertendo as strings em minúsculas:
select *,
    lower(geolocation_state) as geolocation_state_lower
from analysis.geolocation
limit 10;

# ==========================
#         UPPER
# ==========================

# Convertendo as strings em maiúsculas:
select *,
    upper(geolocation_city) as geolocation_city_lower
from analysis.geolocation
limit 10;

# ==========================
#         SPLIT
# ==========================

# Dividindo as strings através de um delimitador:

select 
    split_part(payment_type,'_',1) as payment_type
from analysis.payments;

# ==========================
#         TRIM
# ==========================

# Removendo caracteres do início ou do final de uma string:

select 
    trim('CPF: 123.456.789-00','CPF:');

# ==========================
#         REPLACE
# ==========================

# Substituindo strings:
select *,
    replace(product_category_name_english,'_','-')
from analysis.products_category;

# ==========================
#         CHAR_LENGTH
# ==========================

# Retornando o comprimento da string:
select 
    review_comment_message,
    char_length(review_comment_message)
from analysis.reviews;


