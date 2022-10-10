{{
  config(
    materialized='view'
  )
}}

WITH addresses AS(
    SELECT * FROM {{ source('postgres', 'addresses') }}
)

SELECT ADDRESS_ID AS ADDRESS_GUID
       ,ADDRESS AS STREET_ADDRESS
       ,ZIPCODE
       ,STATE
       ,COUNTRY
FROM addresses