create table `Keepcoding.ivr_billing` as 
SELECT ivr_id, billing_account_id
  FROM (
    SELECT ivr_id, billing_account_id,
    ROW_NUMBER() OVER(PARTITION BY CAST(ivr_id as STRING) ORDER BY billing_account_id) AS rn
    FROM `Keepcoding.Steps` 
  )
 WHERE rn = 1