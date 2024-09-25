SELECT ivr_id as calls_ivr_id,
 CASE WHEN vdn_label like "ATC%" THEN 'FRONT'
 WHEN vdn_label like "TECH%" THEN 'TECH'
 WHEN vdn_label like "ABSORPTION%" THEN 'ABSORPTION'
            ELSE 'RESTO'
       END AS vdn_aggregation
  
FROM `practica-sql-436519.Keepcoding.Calls`