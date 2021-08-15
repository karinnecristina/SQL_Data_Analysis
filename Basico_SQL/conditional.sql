# ==========================
#        CASE WHEN 
# ==========================

# Selecionado os produtos da categoria papelaria:
select
    product_category_name,
    case 
        when product_category_name='papelaria' then 'Ok'
        else 'Não encontrado'
    end as verificacao
from analysis.products_category;

# Selecionado os Estados da região sudeste:
select distinct 
    customer_state,
    case 
        when customer_state in ('SP','RJ','MG','ES') then 'Sudeste'
        when customer_state in ('PR','SC','RS') then 'Sul'
        else 'Demais regiões'
    end as customer_region
from analysis.customers;

# ==========================
#        COALESCE
# ==========================

# Substituindo os valores nulos com coalesce:
select 
    review_id,
    review_comment_message,
    review_score,
    coalesce(review_comment_title, 'Sem comentario') as comment_title
from analysis.reviews 
limit 100;
