{{
    config(
        materialized = 'incremental',
        unique_key='comment_id',
        incremental_strategy='append',
        on_schema_change='fail'
   )
}}
WITH src_airport_comments AS (
    SELECT * FROM {{ ref('src_airport_comments') }}
)
SELECT
    comment_id,
    airport_ident,
    comment_timestamp,
    nvl(NULLIF(member_nickname, ''), '__UNKNOWN__') AS member_nickname,
    comment_subject,
    comment_body,
    current_timestamp() AS loaded_at
from src_airport_comments
WHERE comment_body is not null AND comment_body <> ''

{%- if is_incremental() %}
    AND comment_id > (SELECT max(comment_id) from {{ this }})
{%- endif -%}