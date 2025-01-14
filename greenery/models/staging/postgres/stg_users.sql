{{
  config(
    materialized='view'
  )
}}

WITH users AS(
    SELECT * FROM {{ source('postgres', 'users') }}
)

SELECT USER_ID AS USER_GUID
       ,FIRST_NAME AS USER_FIRST_NAME
       ,LAST_NAME AS USER_LAST_NAME
       ,EMAIL AS USER_EMAIL
       ,PHONE_NUMBER AS USER_PHONE_NUMBER
       ,CREATED_AT AS USER_CREATED_AT
       ,UPDATED_AT AS USER_UPDATED_AT
       ,ADDRESS_ID AS ADDRESS_GUID
FROM users