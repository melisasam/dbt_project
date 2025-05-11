-- models/staging/stg_test_data.sql

with source as (

    select
        id,
        cast(client_id as integer) as client_id,
        trim(lower(first_name)) as first_name,
        trim(lower(last_name)) as last_name,
        street_address,
        street_city,
        street_country as country,
        upper(purchase_status) as purchase_status,
        cast(purchase_amount as float) as purchase_amount,
        cast(purchase_date as date) as purchase_date
    from {{ ref('test_data') }}
    where purchase_date is not null
      and client_id is not null

)

select * from source
