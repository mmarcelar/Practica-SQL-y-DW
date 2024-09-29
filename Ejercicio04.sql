create table `Keepcoding.ivr_vdn_aggregation` as 
SELECT ivr_id as calls_ivr_id,
 CASE WHEN vdn_label like "ATC%" THEN 'FRONT'
 WHEN vdn_label like "TECH%" THEN 'TECH'
 WHEN vdn_label like "ABSORPTION%" THEN 'ABSORPTION'
            ELSE 'RESTO'
       END AS vdn_aggregation
  
FROM `Keepcoding.Calls`