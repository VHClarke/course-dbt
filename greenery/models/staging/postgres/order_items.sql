{{
  config(
    materialized='view'
  )
}}

WITH order_items AS(
    SELECT * FROM {{ source('postgres', 'order_items') }}
)

SELECT ORDER_ID AS ORDER_GUID
       ,PRODUCT_ID AS PRODUCT_GUID
       ,QUANTITY AS QUANTITY_ORDERED
FROM order_items