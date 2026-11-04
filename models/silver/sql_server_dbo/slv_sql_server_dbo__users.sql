with source as (
    select * from {{ ref('stg_sql_server_dbo__users') }}
),
renamed as (
    select
        user_id
        , first_name
        , last_name
        , email
        , phone_number
        , address_id
        , created_at as created_at_utc
        , updated_at as updated_at_utc
        , coalesce(_fivetran_deleted, false) as is_deleted
        , _fivetran_synced as date_load
        , _loaded_at as _loaded_at_utc
    from source
    where not is_deleted
    qualify row_number() over (partition by address_id order by date_load desc) = 1
)
select * from renamed