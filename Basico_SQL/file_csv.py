# =============================================================================
# Bibliotecas
# =============================================================================
import os
import pandas as pd

# =============================================================================
# Pastas e subpastas do projeto
# =============================================================================
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA_DIR = os.path.join(BASE_DIR, 'data')

# =============================================================================
# Leitura dos arquivos
# =============================================================================
def read_file(file):
    '''Lendo os arquivos com a extensão .csv'''
    df = pd.read_csv(os.path.join(DATA_DIR, file))
    return df

df_customers = read_file('olist_customers.csv')
df_geolocation = read_file('olist_geolocation.csv')
df_items = read_file('olist_order_items.csv')
df_payments = read_file('olist_order_payments.csv')
df_reviews = read_file('olist_order_reviews.csv')
df_orders = read_file('olist_orders.csv')
df_products = read_file('olist_products.csv')
df_sellers = read_file('olist_sellers.csv')
df_products_category = read_file('product_category_name_translation.csv')