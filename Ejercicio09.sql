create table `Keepcoding.ivr_by_phone` as 
SELECT  distinct ivr_id,
    MAX(CASE WHEN  step_name = 'CUSTOMERINFOBYPHONE.TX' and step_result = 'OK'  THEN 1 ELSE 0 END) OVER (PARTITION BY CAST(ivr_id as STRING)) as info_by_phone_lg
FROM `Keepcoding.Steps`
