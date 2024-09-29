create table `Keepcoding.ivr_summary` as
select detail.calls_ivr_id as ivr_id,
  calls_phone_number as phone_number,
  calls_ivr_result as ivr_result,
  ag.vdn_aggregation,
  calls_start_date as start_date,
  calls_end_date as end_date,
  calls_total_duration as total_duration,
  calls_customer_segment as customer_segment,
  calls_ivr_language as ivr_language,
  calls_steps_module as steps_module,
  calls_module_aggregation as module_aggregation,
  document_type,
  document_identification, 
  customer_phone, 
  billing_account_id, 
  masiva_lg, 
  info_by_phone_lg, 
  info_by_dni_lg, 
  llamada_repetida as repeated_phone_24H,
  causa_rellamada as cause_recall_phone_24H
from `Keepcoding.ivr_detail` as detail
INNER JOIN `Keepcoding.ivr_document` as document on detail.calls_ivr_id = document.ivr_id 
INNER JOIN `Keepcoding.ivr_phone`as phone on document.ivr_id = phone.ivr_id
INNER JOIN `Keepcoding.ivr_billing`as billing on billing.ivr_id = phone.ivr_id
INNER JOIN `Keepcoding.ivr_masiva`as masiva on billing.ivr_id = masiva.ivr_id
INNER JOIN `Keepcoding.ivr_by_phone` as bp on masiva.ivr_id = bp.ivr_id
INNER JOIN `Keepcoding.ivr_by_dni` as bdni on bdni.ivr_id = bp.ivr_id
INNER JOIN `Keepcoding.ivr_24hs` as v on bdni.ivr_id = v.ivr_id
INNER JOIN `Keepcoding.ivr_vdn_aggregation` as ag on ag.calls_ivr_id = v.ivr_id

