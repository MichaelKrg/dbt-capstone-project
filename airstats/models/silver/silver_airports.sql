WITH src_airports AS (
    SELECT * FROM {{ ref('src_airports') }}
)
SELECT * from src_airports