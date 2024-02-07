SELECT
    *,
    ROUND(O.operational_margin - c.ads_cost,2) AS ads_margin 
from {{ref ('int_campaigns')}} c
LEFT JOIN FROM {{ref("int_orders_operational")}} o
USING(date_date)