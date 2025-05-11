# DBT Project – Monthly Revenue Analysis

This dbt project performs basic transformation and aggregation on a CSV dataset to generate clean insights into monthly revenue trends.

## Project Overview

This project includes:

- **Staging model**: Cleans and validates the raw data.
- **Monthly revenue by client**: Aggregates monthly revenue per client.
- **Monthly revenue by country**: Aggregates monthly revenue per country.

## Tools Used

- [dbt-core](https://github.com/dbt-labs/dbt-core)
- DuckDB (as the database)
- CSV file as source data

## Data Cleaning (Staging)

The `stg_test_data.sql` model:
- Casts data types
- Normalizes names and countries
- Filters out rows with null `client_id` or `purchase_date`

## Final Models

- `monthly_revenue_by_client.sql`: Groups and sums revenue by client and month
- `monthly_revenue_by_country.sql`: Groups and sums revenue by country and month

Both filter on `purchase_status = 'PENDING'`.

## Why DuckDB?

DuckDB was chosen because:
- It's lightweight and runs locally
- No complex setup or credentials needed
- Easy integration with dbt and CSVs

## How to Run

1. Install dependencies:
   ```bash
   pip install dbt-core duckdb

2. Run the models:
   ```bash
   dbt run


3. Inspect results in your DuckDB session or using:
   ```bash
   dbt debug
