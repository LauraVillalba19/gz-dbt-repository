with sales_margin AS(
SELECT 
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS purchase_cost,
    s.revenue - ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS margin,
    
FROM {{ref("stg_raw__sales")}} s
LEFT JOIN {{ref("stg_raw__product")}} p 
    USING (products_id)
)

    SELECT 
        *,
        {{ margin_percent('revenue','purchase_cost')}} AS margin_percent
    FROM sales_margin



