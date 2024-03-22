WITH orders AS (

  SELECT * 
  
  FROM {{ ref('stg_orders')}}

),

customer_orders AS (

  SELECT * 
  
  FROM orders

),

payments AS (

  SELECT * 
  
  FROM {{ ref('stg_payments')}}

),

customer_payments AS (

  SELECT 
    orders.ORDER_ID,
    sum(amount) AS total_amount
  
  FROM payments
  LEFT JOIN orders
     ON payments.order_id = orders.order_id
  
  GROUP BY orders.ORDER_ID

),

customers AS (

  SELECT * 
  
  FROM {{ ref('stg_customers')}}

),

final AS (

  SELECT 
    customers.ID,
    customers.first_name
  
  FROM customers
  LEFT JOIN customer_orders
     ON customers.id = customers.id
  LEFT JOIN customer_payments
     ON customers.id = customers.id

)

SELECT *

FROM final
