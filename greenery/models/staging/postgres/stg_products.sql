

{{
  config(
    materialized='view'
  )
}}

WITH products AS(
    SELECT * FROM {{ source('postgres', 'products') }}
)

SELECT PRODUCT_ID AS PRODUCT_GUID
       ,NAME AS PRODUCT_NAME
       ,PRICE AS PRODUCT_PRICE
       ,INVENTORY AS PRODUCT_INVENTORY
FROM products