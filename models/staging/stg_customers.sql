WITH source AS (

  {#-
  Normally we would select from the table here, but we are using seeds to load
  our data in this project
  #}
  SELECT * 
  
  FROM {{ ref('raw_customers')}}

),

renamed AS (

  SELECT id AS id
  
  FROM source

)

SELECT *

FROM renamed
