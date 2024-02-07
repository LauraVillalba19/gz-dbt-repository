SELECT
    *,
    ROUND(c.ads_cost - O.operational_margin,2) AS ads_margin,
from {{ref ("int_campaigns_day")}} AS c
RIGHT JOIN {{ref("int_orders_operational")}} AS o
USING(date_date)
ORDER BY date_date