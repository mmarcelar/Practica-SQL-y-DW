create table `Keepcoding.ivr_phone` as 
SELECT ivr_id, customer_phone
  FROM (
    SELECT ivr_id, customer_phone,
    ROW_NUMBER() OVER(PARTITION BY CAST(ivr_id as STRING) ORDER BY customer_phone) AS rn
    FROM `Keepcoding.Steps` 
  )
 WHERE rn = 1