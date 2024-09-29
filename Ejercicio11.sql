create table `Keepcoding.ivr_24hs` as 
SELECT ivr_id, phone_number,
  CASE WHEN DATETIME_DIFF(LEAD(start_date) OVER(PARTITION BY phone_number ORDER BY start_date), start_date, DAY) = 1 THEN 1 ELSE 0 END AS causa_rellamada,
  CASE WHEN DATETIME_DIFF(start_date, LAG(start_date) OVER(PARTITION BY phone_number ORDER BY start_date), DAY) = 1 THEN 1 ELSE 0 END AS llamada_repetida

FROM `Keepcoding.Calls`