-- models/marts/monthly_revenue_by_country.sql

with data as (
    select * from {{ ref('stg_test_data') }}
)

select
    country,
    date_trunc('month', purchase_date) as month,
    sum(purchase_amount) as total_revenue
from data
where purchase_status = 'PENDING'
group by country, month
order by country, month
