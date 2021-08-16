# =============================================================================
# Bibliotecas
# =============================================================================
import os
import sqlalchemy
from dotenv import load_dotenv
from file_csv import *

# =============================================================================
# Parâmetros para conectar ao banco de dados
# =============================================================================
load_dotenv()
connection = os.getenv('connection')

# =============================================================================
# Estabelecendo conexão com o banco
# =============================================================================
engine = sqlalchemy.create_engine(connection)

# =============================================================================
# Salvando os arquivos no banco 
# =============================================================================   
def database(df,engine,name,schema,if_exists, index):
    '''Salvando os arquivos no banco'''
    df.to_sql(con=engine,
              name=name,
              schema=schema,
              if_exists=if_exists,
              index=index)

database(df_customers,engine,'customers','analysis','replace',False)
database(df_geolocation,engine,'geolocation','analysis','replace',False)
database(df_items,engine,'items','analysis','replace',False)
database(df_payments,engine,'payments','analysis','replace',False)
database(df_reviews,engine,'reviews','analysis','replace',False)
database(df_orders,engine,'orders','analysis','replace',False)
database(df_products,engine,'products','analysis','replace',False)
database(df_sellers,engine,'sellers','analysis','replace',False)
database(df_products_category,engine,'products_category','analysis','replace',False)