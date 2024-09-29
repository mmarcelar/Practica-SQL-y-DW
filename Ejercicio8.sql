create table `Keepcoding.ivr_masiva` as 
SELECT distinct ivr_id,
    MAX(CASE WHEN  module_name = 'AVERIA_MASIVA' THEN 1 ELSE 0 END) OVER (PARTITION BY CAST(ivr_id as STRING)) as masiva_lg
FROM `Keepcoding.Modules`