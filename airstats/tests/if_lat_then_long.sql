{# verify that we have always both latitude and longitude, never only one #}
WITH silver_airports AS (
    SELECT * from {{ ref('silver_airports') }}
)
SELECT * from silver_airports
WHERE (airport_lat is null) <> (airport_long is null)