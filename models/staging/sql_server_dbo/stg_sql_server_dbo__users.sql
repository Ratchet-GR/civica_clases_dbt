with source as (
    select * from {{ source('sql_server_dbo', 'users') }}
),
renamed as (
    select
        user_id
        , first_name
        , last_name
        , trim(lower(email)) as email
        , phone_number
        , address_id
        , created_at as created_at_utc
        , updated_at as updated_at_utc
        , coalesce(_fivetran_deleted, false) as is_deleted
        , _fivetran_synced as date_load
        , _loaded_at as _loaded_at_utc
    from source
)
select * from renamed
