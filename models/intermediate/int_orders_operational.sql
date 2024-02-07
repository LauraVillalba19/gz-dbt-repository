SELECT
   o.orders_id
  ,o.date_date
  ,ROUND(SUM(o.margin + s.shipping_fee - (s.logcost + s.ship_cost)),2) AS operational_margin
  ,ROUND(AVG(o.revenue ),1) AS average_basket
  ,SUM(o.quantity) AS quantity
  ,SUM(o.revenue) AS revenue
  ,SUM(o.purchase_cost) AS purchase_cost
  ,SUM(o.margin) AS margin
  ,SUM(s.shipping_fee) AS shipping_fee
  ,SUM(s.logcost) AS logcost
  ,SUM(s.ship_cost) AS ship_cost
FROM {{ref("int_orders_margin")}} o
LEFT JOIN {{ref("stg_raw__ship")}} s 
  USING(orders_id)
  GROUP BY orders_id, date_date
ORDER BY orders_id desc