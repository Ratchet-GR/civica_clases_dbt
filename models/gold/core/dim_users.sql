with users as(
    select * from {{ref('slv_sql_server_dbo__users')}}
)

select
      user_id
    , first_name
    , address_id
    , last_name
    , email
    , phone_number
    , created_at_utc
    , updated_at_utc
    , date_load
    , _loaded_at_utc
from users
