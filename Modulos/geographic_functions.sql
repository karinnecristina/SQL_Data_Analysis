# ==========================
#         POINT
# ==========================

# Ponto no espaço:
select 
    geolocation_lng,
    geolocation_lat,
    point(geolocation_lng,geolocation_lat) as point_space
from analysis.geolocation
limit 100; 
