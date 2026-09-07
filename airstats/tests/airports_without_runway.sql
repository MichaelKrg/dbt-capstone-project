{{ config(severity = 'warn') }}
WITH silver_airports AS (
    SELECT airport_ident, airport_type FROM {{ ref('silver_airports') }}
),
silver_runways AS (
    SELECT runway_id, airport_ident FROM {{ ref('silver_runways') }}
)

SELECT ap.airport_ident, ap.airport_type
FROM silver_airports ap
WHERE NOT EXISTS (SELECT 1 from silver_runways rw where ap.airport_ident = rw.airport_ident)
and airport_type not in ('closed', 'heliport', 'seaplane_base', 'balloonport', 'small_airport')