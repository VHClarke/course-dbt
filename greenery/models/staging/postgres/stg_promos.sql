{{
  config(
    materialized='view'
  )
}}

WITH promos AS(
    SELECT * FROM {{ source('postgres', 'promos') }}
)

SELECT PROMO_ID
       ,DISCOUNT AS PROMO_DISCOUNT
       ,STATUS AS PROMO_STATUS
FROM promos