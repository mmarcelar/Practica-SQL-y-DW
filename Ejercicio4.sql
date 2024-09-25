SELECT calls_ivr_id,
 CASE WHEN calls_vdn_label like "ATC%" THEN 'FRONT'
 WHEN calls_vdn_label like "TECH%" THEN 'TECH'
 WHEN calls_vdn_label like "ABSORPTION%" THEN 'ABSORPTION'
            ELSE 'RESTO'
       END AS vdn_aggregation
  
FROM `practica-sql-436519.Keepcoding.ivr_detail`