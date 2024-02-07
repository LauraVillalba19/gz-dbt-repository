with 

source as (

    select * 
    
    from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        pdt_id AS products_id,
        revenue,
        quantity

    from source

)

select 
    date_date,
    orders_id, 
    products_id,
    CONCAT(orders_id, '_', products_id) AS sales_id,
    revenue,
    quantity
from renamed
