# ==========================
#         ABS
# ==========================

# Valor absoluto de um número:
select 
    1,
    -12,
    abs(1),
    abs(-12);

# ==========================
#         RAND
# ==========================

# Gerando um número aleatório (entre 0 e 1):
select 
    random() as number;

# Gerando um número aleatório (entre 0 e 10):
select 
    10*random() as number;

# Pegando uma amostra de 10 clientes da base de dados:
select *
from analysis.customers
order by random() limit 10;

# ==========================
#         SQRT
# ==========================

# Raiz quadrada:
select 
    sqrt(168);

# ==========================
#         POW
# ==========================

# Potência:
select 
    pow(7,-3);

# ==========================
#         LOG
# ==========================

# Logaritmo de um número (base, número):
select 
    log(10,0.1);

# ==========================
#         ROUND
# ==========================

# Arredondando valores:
select 
    round(0.4745445,1);

select 
    round(avg(cast(price as int)),2) as avg_price
from analysis.items;

# ==========================
#         MOD
# ==========================

# Módulo de um número:
select 
    mod(10,4); 

# Visualizando os scores que são pares e ímpares:
select *,
    case when mod(review_score, 2) = 0 then 'par'
    else 'impar'
    end as conditions
from analysis.reviews
limit 150;

# ==========================
#         SIN
# ==========================

# Seno de um valor em radiano:
select 
    sin(0),
    sin(3.14167/6);