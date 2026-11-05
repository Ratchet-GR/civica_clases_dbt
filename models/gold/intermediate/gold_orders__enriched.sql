with orders as(
    select * from {{ref('slv_sql_server_dbo__orders')}}
),

addresses as(
    select * from {{ref('slv_sql_server_dbo__addresses')}}
),

promos as(
    select * from {{ref('slv_sql_server_dbo__promos')}}
)

select 
    -- Tabla orders
    o.order_id
    , o.user_id
    , o.address_id
    , o.promo_id
    , o.created_at_utc
    , o.stimated_delivery_at_utc
    , o.delivered_at_utc
    , o.tracking_id
    , o.shipping_service
    , o.shipping_cost_usd
    , o.order_cost_usd
    , o.total_order_cost_usd
    , o.order_status
    , o.is_deleted
    , o.date_load
    , o._loaded_at_utc
    -- Tabla addresses
    , ad.address_line
    , ad.zipcode
    , ad.state
    , ad.country
    , ad.date_load
    -- Tabla promos
    , pr.discount_usd
    , pr.promo_status
    , pr.date_load
from orders o
left join addresses ad
    on o.address_id = ad.address_id
left join promos pr
    on o.promo_id = pr.promo_id
