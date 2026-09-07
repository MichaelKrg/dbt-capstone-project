WITH scd_silver_airports AS (
    SELECT * from {{ ref('scd_silver_airports') }}
)
SELECT * from scd_silver_airports
WHERE airport_ident = '01CN'