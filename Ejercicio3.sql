create table `Keepcoding.ivr_detail` as 
SELECT
   C.ivr_id as calls_ivr_id,
 phone_number as calls_phone_number,
  C.ivr_result as calls_ivr_result,
C.vdn_label as calls_vdn_label,
  start_date as calls_start_date, 
  format_timestamp("%Y%m%d", start_date) as calls_start_date_id,
  end_date as calls_end_date, 
  format_timestamp("%Y%m%d", end_date) as calls_end_date_id,
  C.total_duration as calls_total_duration,
  C.customer_segment as  calls_customer_segment,
  C.ivr_language as calls_ivr_language,
  C.steps_module as calls_steps_module,
  C.module_aggregation as calls_module_aggregation,
  M.module_sequece,
  M.module_name,
  M.module_duration,
  M.module_result,
  step_sequence,
  step_name,
  step_result,
  step_description_error,
  document_type as step_document_type,
  document_identification as step_document_identification,
  customer_phone as step_customer_phone,
  billing_account_id as step_billing_account


FROM `Keepcoding.Calls` as C , `Keepcoding.Modules` as M, `Keepcoding.Steps`as S
WHERE C.ivr_id = M.ivr_id
  AND M.ivr_id = S.ivr_id