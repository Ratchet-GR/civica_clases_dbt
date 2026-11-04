with source as (
    select * from {{ ref('stg_sql_server_dbo__orders') }}
),
renamed as (
    select
        order_id
        , user_id
        , address_id
        , promo_id
        , created_at as created_at_utc
        , estimated_delivery_at as stimated_delivery_at_utc
        , delivered_at as delivered_at_utc
        , tracking_id
        , shipping_service
        , shipping_cost as shipping_cost_usd
        , order_cost as order_cost_usd
        , order_total as total_order_cost_usd
        , status as order_status
        , coalesce(_fivetran_deleted, false) as is_deleted
        , _fivetran_synced as date_load
        , _loaded_at as _loaded_at_utc
    from source
    where not is_deleted
    qualify row_number() over (partition by address_id order by date_load desc) = 1
)
select * from renamed