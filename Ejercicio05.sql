create table `Keepcoding.ivr_document` as 
SELECT ivr_id, document_type, document_identification
  FROM (
    SELECT ivr_id, document_type, document_identification,
    ROW_NUMBER() OVER(PARTITION BY CAST(ivr_id as STRING) ORDER BY document_type) AS rn
    FROM `Keepcoding.Steps` 
  )
 WHERE rn = 1