{{
  config(
    materialized='view'
  )
}}

WITH events AS(
    SELECT * FROM {{ source('postgres', 'events') }}
)

SELECT EVENT_ID AS EVENT_GUID
       ,SESSION_ID AS SESSION_GUID
       ,USER_ID AS USER_GUID
       ,PAGE_URL
       ,CREATED_AT
       ,EVENT_TYPE
       ,ORDER_ID AS ORDER_GUID
       ,PRODUCT_ID AS PRODUCT_GUID
FROM events