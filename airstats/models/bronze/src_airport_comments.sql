{{
    config(
        materialized = 'ephemeral',
   )
}}
WITH raw_comments AS (
    SELECT * from {{ source('airstats', 'comments') }}
)
SELECT
    id AS comment_id,
    airport_ident,
    date AS comment_timestamp,
    member_nickname,
    subject AS comment_subject,
    body as comment_body
FROM raw_comments