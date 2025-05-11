-- models/core/monthly_revenue_by_client.sql

with data as (
    select * from {{ ref('stg_test_data') }}
)

select
    client_id,
    date_trunc('month', purchase_date) as month,
    sum(purchase_amount) as total_revenue
from data
where purchase_status = 'PENDING'
group by client_id, month
order by client_id, month
