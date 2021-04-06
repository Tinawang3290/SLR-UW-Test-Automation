-- CTE(Common table expression)
WITH f AS((SELECT 
  la.application_uuid_value AS Application_UUID_VALUE,
  lp.email AS email,
  IFNULL(la.identity_uuid_value,lp.identity_uuid_value) AS Identity_UUID,
  la.application_short_id AS Application_Short_ID,
  IFNULL(la.state,lp.state) AS State,
  CONCAT(lp.first_name,' ',lp.last_name) AS Borrower_Name
  FROM `figure-production.reporting.lkup_profile` lp
  LEFT JOIN `figure-production.reporting.lkup_application` la ON la.identity_uuid_value = lp.identity_uuid_value)
  UNION ALL
  (SELECT 
  lfa.fhlb_app.uuid.value AS Application_UUID_VALUE,
  lp.email,
  IFNULL(lfa.fhlb_app.identity_uuid.value,lp.identity_uuid_value) AS Identity_UUID,
  lfa.fhlb_app.loan_number AS Application_Short_ID,
  IFNULL(lfa.fhlb_app.property.state,lp.state) AS State,
  CONCAT(lp.first_name,' ',lp.last_name) AS Borrower_Name
FROM `figure-production.reporting.lkup_profile` lp 
LEFT JOIN `figure-production.reporting.lkup_fhlb_application` lfa ON lfa.fhlb_app.identity_uuid.value = lp.identity_uuid_value)
UNION ALL
(SELECT 
  slr.identity_uuid_value AS Application_UUID_VALUE,
  lp.email,
  IFNULL(slr.identity_uuid_value,lp.identity_uuid_value) AS Identity_UUID,
  slr.short_loan_id AS Application_Short_ID,
  IFNULL(slr.state,lp.state) AS State,
  CONCAT(lp.first_name,' ',lp.last_name) AS Borrower_Name
FROM `figure-production.reporting.lkup_profile` lp 
LEFT JOIN `figure-production.reporting.lkup_slr_application` slr ON slr.identity_uuid_value = lp.identity_uuid_value)
UNION ALL
(SELECT 
  mla.identity_uuid_value AS Application_UUID_VALUE,
  lp.email,
  IFNULL(mla.identity_uuid_value,lp.identity_uuid_value) AS Identity_UUID,
  mla.loan_number AS Application_Short_ID,
  IFNULL(mla.property_state,lp.state) AS State,
  CONCAT(lp.first_name,' ',lp.last_name) AS Borrower_Name
FROM `figure-production.reporting.lkup_profile` lp 
LEFT JOIN `figure-production.reporting.lkup_mortgage_application` mla ON mla.identity_uuid_value = lp.identity_uuid_value)
),

ff AS (SELECT 
  ts.application_uuid,
  IFNULL(ss.task_uuid,ts.task_uuid) AS TASK_UUID,
  ts.task_type AS Task_Type,
CASE 
  WHEN  ts.task_type = 'PROPERTY_OWNERSHIP_FRAUD_REVIEW' OR ( ts.task_type ='FRAUD_REVIEW' AND ts.Message LIKE '%IDENTITY_FRAUD%') OR (ts.task_type ='4' AND ts.Message LIKE '%IDENTITY_FRAUD%') THEN 'PROPERTY_OWNERSHIP_FRAUD_REVIEW'
  WHEN  ts.task_type = 'CREDIT_FRAUD_REVIEW' OR (ts.task_type ='FRAUD_REVIEW' AND ts.Message LIKE '%CREDIT_FRAUD%') THEN 'EXPERIAN_FRAUD_SHIELD_REVIEW'
  ELSE ts.task_type
  END AS Covt_Task_Type,
ss.subtask_type_desc,
CASE 
  WHEN ss.subtask_type_desc IN ('Call applicant -- ID Upload','Call applicant 3 -- ID Upload', 'Call applicant 2 -- ID Upload', 'Call applicant 1 -- ID Upload', 'Call applicant 4 -- ID Upload') THEN 'Call applicant -- ID Upload'
  WHEN ss.subtask_type_desc IN ('Call applicant -- Notary','Call applicant 3 -- Notary', 'Call applicant 2 -- Notary', 'Call applicant 1 -- Notary', 'Call applicant 4 -- Notary') THEN 'Call applicant -- Notary'
  WHEN ss.subtask_type_desc IN ('Call applicant -- Bank Account','Call applicant 3 -- Bank Account', 'Call applicant 2 -- Bank Account', 'Call applicant 1 -- Bank Account', 'Call applicant 4 -- Bank Account') THEN 'Call applicant -- Bank Account'
  WHEN ss.subtask_type_desc IN ('Call applicant -- Sign promissory Note','Call applicant 3 -- Sign promissory Note', 'Call applicant 2 -- Sign promissory Note', 'Call applicant 1 -- Sign promissory Note', 'Call applicant 4 -- Sign promissory Note') THEN 'Call applicant -- Sign promissory Note'
  WHEN ss.subtask_type_desc IN ('Call applicant -- Additional Signer','Call applicant 3 -- Additional Signer', 'Call applicant 2 -- Additional Signer', 'Call applicant 1 -- Additional Signer', 'Call applicant 4 -- Additional Signer') THEN 'Call applicant -- Additional Signer'
  WHEN ss.subtask_type_desc IN ('Review Property Ownership','Review Fraud Alert', 'Review Fraud Ownership','Review Bank Account Ownership') THEN 'Review Fraud Alert'
  WHEN ss.subtask_type_desc IN ('Call applicant -- 1st attempt', 'Call Borrower') THEN 'Call applicant -- 1st attempt'
  WHEN ss.subtask_type_desc IN ('Call applicant -- 2nd attempt', 'Call borrower for the 2nd time')THEN 'Call applicant -- 2nd attempt'
  WHEN ss.subtask_type_desc IN ('Upload and Review Identity Document', 'Review Jumio Failure') THEN 'Upload and Review Identity Document'
  WHEN ss.subtask_type_desc LIKE '%Email' THEN 'System'
  ELSE ss.subtask_type_desc
  END AS Subtask_Type,
CASE WHEN ss.subtask_type_desc = 'Compliance Fraud Review' 
THEN cs.message
ELSE ts.message
END AS Message,
IFNULL(ss.subtask_outcome_data_comments,ts.comments) AS Comments,
   ts.last_status as Task_Status,
ss.last_outcome,
CASE 
  WHEN ss.last_outcome = 'CANCEL_TASK' OR (ss.last_outcome IS NULL AND ts.last_status IN ('CANCELLED', '1','2',NULL) )  THEN 'SYSTEM_CANCEL_TASK'
  WHEN ss.last_outcome IN ('FIXED','NO_DISCREPANCY', 'CONFIRMED_APPLICATION','FRAUD_NOT_FOUND') THEN 'CLEARED'
  WHEN ss.last_outcome = 'CANCEL' THEN 'MANUAL_CANCEL'
  WHEN ss.last_outcome = 'COMPLETE_TASK' OR (ss.last_outcome IS NULL AND ts.last_status = 'COMPLETE')  THEN 'SYSTEM_COMPLETE_TASK'
  WHEN ss.last_outcome IN ('FRAUD_SUSPECTED','POTENTIAL_FRAUD','DISCREPANCY') THEN 'POTENTIAL_FRAUD'
  WHEN ss.last_outcome IN ('CONFIRM_FRAUD','FRAUD_FOUND') THEN 'CONFIRM_FRAUD'
  ELSE ss.last_outcome
END AS Subtask_Outcome,
  ss.assigned_to,
  ss.completed_by,
  CASE WHEN  ss.subtask_type_desc = 'Compliance Fraud Review' THEN ss.created_date
  ELSE ss.assigned_date
  END AS assigned_date,
  ss.created_date,
  CASE WHEN  ss.subtask_type_desc = 'Compliance Fraud Review' THEN ss.created_date
  ELSE ss.completed_date
  END AS completed_date,
  ss.subtask_proficiencies AS Original_subtask_proficiencies,
  ss.subtask_proficiencies AS Subtask_proficiencies
FROM  `figure-production.reporting.agg_current_task_status` ts
LEFT JOIN `figure-production.reporting.agg_current_subtask_status` ss ON ss.task_uuid = ts.task_uuid
LEFT JOIN (SELECT distinct(ts.application_uuid), ts.task_type, ts.message, ts.status, ts.comments, ts.assigned_to, ts.completed_by, ss.subtask_type_desc, ss.subtask_outcome_data_comments, ss.subtask_proficiencies FROM reporting.agg_current_subtask_status ss
JOIN reporting.agg_current_task_status ts ON ts.task_uuid = ss.task_uuid
WHERE (ts.status = 'FAILED' OR ts.status = 'CANCELLED' ) AND ss.subtask_proficiencies = '[SUPERVISOR]') cs ON cs.application_uuid = ts.application_uuid
),


fff AS (
SELECT 
  Completed_by AS CSA_Name,
  SUM(tasks_cancelled) AS Tasks_Cancelled,
  SUM(tasks_completed) AS Tasks_Completed,
  COUNT(subtask_type) * avg(task_score) AS Score_Obtained
  FROM(
  SELECT 
  completed_by,
  CASE WHEN subtask_outcome = 'MANUAL_CANCEL' THEN 1 ELSE 0 END AS Tasks_Cancelled,
  CASE WHEN subtask_outcome != 'MANUAL_CANCEL' THEN 1 ELSE 0 END AS Tasks_Completed,
  subtask_type,
  CASE 
  WHEN Subtask_Type = 'Call applicant -- ID Upload' THEN  6
  WHEN Subtask_Type = 'Call applicant -- Notary' THEN 6
  WHEN Subtask_Type = 'Call applicant -- Bank Account' THEN 6
  WHEN Subtask_Type = 'Call applicant -- Sign promissory Note' THEN 6
  WHEN Subtask_Type = 'Call applicant -- Additional Signer' THEN 6
  WHEN Subtask_Type = 'Review Fraud Alert' THEN 6
  WHEN Subtask_Type = 'Upload Property Legal Description' THEN 5
  WHEN Subtask_Type = 'Verify Deed Names/Addresses' THEN 6
  WHEN Subtask_Type = 'Call applicant -- 1st attempt' THEN 6
  WHEN Subtask_Type = 'Call applicant -- 2nd attempt' THEN 6
  WHEN Subtask_Type = 'Generate Pre-Populated Deed'  THEN 4
  WHEN Subtask_Type = 'Upload Notarized Deed' THEN 5
  WHEN Subtask_Type = 'Contact Applicant' THEN 6
  WHEN Subtask_Type = 'Order Appraisal' THEN 5
  WHEN Subtask_Type = 'Upload Appraisal' THEN 2
  WHEN Subtask_Type = 'Upload Recorded Deed' THEN 2
  WHEN Subtask_Type = 'Call applicant - Plaid Account Link' THEN 6
  WHEN Subtask_Type = 'Call applicant -- Income Verification' THEN 6
  WHEN Subtask_Type = 'Review OFAC Alert' THEN 8
  WHEN Subtask_Type = 'FUND' THEN 1
  WHEN Subtask_Type =  'RESCISSION' THEN 0
  WHEN Subtask_Type = 'Upload and Review Identity Document' THEN 6
  WHEN Subtask_Type = 'First Lien Insurance Review' THEN 8
  WHEN Subtask_Type = 'Compliance Fraud Review' THEN 9
  WHEN Subtask_Type = 'Create Risk On SUI' THEN 8
  WHEN Subtask_Type = 'SUI Risk Review' THEN 6
  WHEN Subtask_Type = 'Review Trust Requirements' THEN 6
  WHEN Subtask_Type = 'Multiple Properties Found' THEN 6
  WHEN Subtask_Type = 'Call Applicant - Update Trust Doc' THEN 6
  WHEN Subtask_Type = 'Order Home Inspection' THEN 5
  WHEN Subtask_Type = 'Review Income/Asset Documentation' THEN 5
  WHEN Subtask_Type = 'Confirm Initial Purchase Offer' THEN 5
  WHEN Subtask_Type = 'Document Upload' THEN 5
ELSE 0
END AS Task_score
FROM ff
RIGHT JOIN f ON  f.application_uuid_value = ff.application_uuid 
WHERE TASK_UUID IS NOT NULL and completed_by not in ('In progress', 'System', 'Fraud Processor', 'CSC Processor','SYSTEM_CANCEL_TASK', '', 'SYSTEM_COMPLETE_TASK') AND subtask_proficiencies NOT IN ( '[SYSTEM]','[]', '[COMPLIANCE]') AND completed_date BETWEEN '2019-07-01 00:00:00 UTC' AND '2020-10-01 00:00:00 UTC')
GROUP BY completed_by
),

CSP_task AS (
SELECT 
  DISTINCT(f.email) AS CSA_Email,
  fff.Tasks_Cancelled,
  fff.Tasks_Completed, 
  ROUND(Score_Obtained,0) AS Score_Obtained 
FROM f
JOIN fff ON fff.CSA_Name = f.identity_uuid
ORDER BY email),

 interaction AS (
  SELECT 
    conv_id,
    e.responder_id, 
    COUNT(e.text) as replies 
FROM rpt_staging.stg_chat_data
CROSS JOIN UNNEST(events) as e
WHERE e.type = 'msg_out' AND created_at BETWEEN '2019-07-01 00:00:00 UTC' AND '2020-10-01 00:00:00 UTC'
GROUP BY conv_id, e.responder_id ),

rating AS (
  SELECT conv_id, final_responder AS responder_id, rating 
  FROM rpt_staging.stg_chat_data
  WHERE rating IS NOT NULL AND created_at BETWEEN '2019-07-01 00:00:00 UTC' AND '2020-10-01 00:00:00 UTC'),

initial_responses AS (
  SELECT
    conv_id,
    initial_responder,
    rl.latency[offset(0)] AS initial_response
  FROM rpt_staging.stg_chat_data
  CROSS JOIN UNNEST(response_latency) AS rl
  WHERE rl.responder_id = initial_responder
    AND rl.latency[offset(0)] < 1200
    AND created_at BETWEEN '2019-07-01 00:00:00 UTC' AND '2020-10-01 00:00:00 UTC'
ORDER BY conv_id),

response_latency AS (
  SELECT
    conv_id,
    rl.responder_id, 
    COUNT(latency) as cnt_latency,
    SUM(latency) as sum_latency
  FROM rpt_staging.stg_chat_data
  CROSS JOIN UNNEST(response_latency) as rl
  CROSS JOIN UNNEST(rl.latency) as latency
  WHERE latency < 1200 AND created_at BETWEEN '2019-07-01 00:00:00 UTC' AND '2020-10-01 00:00:00 UTC'
  GROUP BY conv_id, rl.responder_id
  ORDER BY conv_id),

email AS (
  SELECT DISTINCT
    map.id as responder_id,
    map.id_map as email
  FROM rpt_staging.stg_chat_data
  CROSS JOIN UNNEST(id_mappings) as map
  WHERE created_at BETWEEN '2019-07-01 00:00:00 UTC' AND '2020-10-01 00:00:00 UTC'),

Intercom_chat AS (
SELECT 
  email.email as CSAs,
  SUM(interaction.replies) AS Total_Replies,
  COUNT(head.conv_id) AS Total_Conversations,
  ROUND(AVG(rating.rating),3) AS Avg_Rating, 
  ROUND(AVG(initial_responses.initial_response),3) AS Initial_Response_Time, 
  ROUND(SUM(response_latency.sum_latency)/SUM(response_latency.cnt_latency),3) AS Average_Response_Time 
FROM rpt_staging.stg_chat_data AS head
  LEFT JOIN rating ON head.conv_id = rating.conv_id
  JOIN interaction ON interaction.conv_id = head.conv_id
  JOIN email ON interaction.responder_id = email.responder_id
  JOIN initial_responses ON initial_responses.conv_id = head.conv_id
  LEFT JOIN response_latency ON response_latency.conv_id = head.conv_id AND response_latency.responder_id = email.responder_id
GROUP BY CSAs
),
 
D AS( 
SELECT
  kafka_timestamp_ts as Created_Date,
  application_uuid.value as Application_UUID,
  contact_first_name as First_Name,
  CONCAT( contact_first_name, " ", contact_last_name) as Name,
  contact_email,
  contact_phone,
  phone_allowed,
  email_allowed,
  mail_allowed,
  sms_allowed,
  home_phone_restricted,
  cell_phone_restricted, 
  office_phone_restricted, 
  email_restricted, 
  mail_restricted, 
  sms_restricted, 
  audit_fields.created_by AS Created_By_CSA, 
  CASE WHEN audit_fields.updated_by IS NULL THEN 'Not Updated'
  ELSE audit_fields.updated_by END AS Updated_By_CSA
FROM `figure-production.staging_evolved.csp_data_proto_external_csp_do_not_contact_r1` R1
WHERE kafka_timestamp_ts BETWEEN '2019-07-01 00:00:00 UTC' AND '2020-10-01 00:00:00 UTC'
),

DNC AS(
SELECT 
  Created_By_CSA as CSAs,
  Email,
  sum(DNC_Num) As DNC_Num
  FROM(
  SELECT
  Created_By_CSA,
  Email,
  COUNT(1) AS DNC_Num
  FROM D
  JOIN `figure-production.reporting.lkup_profile` lp ON lp.identity_uuid_value = d.Created_By_CSA
  GROUP BY Created_By_CSA, email
  UNION ALL
  SELECT
  Updated_By_CSA,
  Email,
  COUNT(1) AS DNC_Num
FROM D
JOIN `figure-production.reporting.lkup_profile` lp ON lp.identity_uuid_value = d.Updated_By_CSA
GROUP BY Updated_By_CSA, email)
GROUP BY Created_By_CSA, email
),

C AS(
SELECT 
created_date_utc AS Created_Date,
csp_data_proto_external_csp_complaint_r1_uuid_value AS Complaint_UUID,
c.application_uuid_value AS Application_UUID,
concat(contact_first_name, ' ',contact_last_name) AS Contact_Name,
CASE  
     WHEN product = 'Home Lease Back' THEN 'Home Lease Back'
     WHEN product IN ('--', " ") THEN 'Not Specified'
     ELSE  'Home Equity Line'
     END AS Product_Type,
     contact_phone AS Contact_Phone,
     contact_email AS Contact_Email,
     contact_state AS Contact_State,
     complaint_tier AS Complaint_Tier,     
 Created_By_Csr_Uuid_Value AS Creator,
 CASE WHEN approved_By_Csr_Uuid_Value IS NULL THEN 'Not Approved'
 ELSE approved_By_Csr_Uuid_Value END AS Approver,
     complaint_summary AS Complaint_Summary,
     root_cause_analysis AS Root_Cause_Analysis,
     resolution_description AS Resolution_Description,
     category AS Category,
     channel AS Channel,
     status AS Status,   
CASE is_approved  
     WHEN FALSE THEN 'No'
     WHEN TRUE THEN 'Yes'
     END AS Approved
FROM `figure-production.reporting.lkup_csp_complaint` c
WHERE created_date_utc BETWEEN '2019-07-01 00:00:00 UTC' AND '2020-10-01 00:00:00 UTC'),

Complaint AS(
SELECT 
  creator as CSAs,
  Email,
  sum(Complaint_Num) As Complaint_Num
  FROM(
  SELECT
  creator,
  Email,
  COUNT(1) AS Complaint_Num
  FROM C
  JOIN `figure-production.reporting.lkup_profile` lp ON lp.identity_uuid_value = c.creator
  GROUP BY creator, email
  UNION ALL
  SELECT
  Approver,
  Email,
  COUNT(1) AS Complaint_Num
FROM C
JOIN `figure-production.reporting.lkup_profile` lp ON lp.identity_uuid_value = c.approver
GROUP BY approver, email)
GROUP BY creator, email),

Notary AS (SELECT 
  participant_identity_uuid_value AS CSAs,
  Email,
  COUNT(room_uuid_value) AS Notary_Call_Num,
  ROUND(AVG(TIMESTAMP_DIFF(call_ended_dt, call_started_dt, minute)),3) AS Notary_Call_Duration,
  ROUND(AVG(TIMESTAMP_DIFF(participant_disconnected_dt, participant_connected_dt, minute)),3) AS Notary_Call_Handle_Time,
  ROUND(AVG(TIMESTAMP_DIFF(participant_connected_dt, call_started_dt, minute)),3) AS Notary_Call_Speed_To_Answer
FROM `figure-production.reporting.lkup_enotary_call_stats` le
LEFT JOIN `figure-production.reporting.lkup_profile` lp ON lp.identity_uuid_value = le.participant_identity_uuid_value
WHERE EMAIL LIKE '%figure.com%' AND call_started_dt BETWEEN '2019-07-01 00:00:00 UTC' AND '2020-10-01 00:00:00 UTC'
GROUP BY participant_identity_uuid_value, EMAIL)

SELECT 
  ct.CSA_Email,
  SUM(ct.Tasks_Cancelled) AS Tasks_Cancelled_Num,
  SUM(ct.Tasks_Completed) AS Tasks_Completed_Num,
  SUM(ct.Score_obtained) AS Total_Score_Obtained,
  SUM(ic.Total_Replies) AS Total_Replies, 
  SUM(ic.Total_Conversations) AS Total_Conversations,
  AVG(ic.Avg_Rating) AS Avg_Rating, 
  AVG(ic.Initial_Response_Time) AS Average_Initial_Response_Time, 
  AVG(ic.Average_Response_Time) AS Average_Response_Time,
  SUM(dnc.DNC_Num) AS DNC_Num,
  SUM(co.Complaint_Num) AS Complaint_Num,
  SUM(n.Notary_Call_Num) AS Notary_Call_Num,
  AVG(Notary_Call_Duration) AS Avg_Notary_Call_Duration,
  AVG(Notary_Call_Handle_Time) AS Notary_Call_Handle_Time,
  AVG(Notary_Call_Speed_To_Answer) AS Avg_Notary_Call_Speed_To_Answer
FROM csp_task ct
LEFT JOIN Intercom_chat ic ON ic.CSAs = ct.CSA_email
LEFT JOIN DNC ON dnc.email = ct.CSA_email 
LEFT JOIN Complaint co ON co.email = ct.CSA_email
LEFT JOIN Notary n ON n.email = ct.CSA_email
GROUP BY CSA_Email
