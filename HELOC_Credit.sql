
--Credit Hard Knockout
WITH Credit AS (
SELECT 
  ROW_NUMBER() OVER (PARTITION BY lca.application_uuid_value ORDER BY application_start_date DESC) AS r,
  application_start_date,
  lca.application_uuid_value,
  la.app_amount,
  la.status AS App_Status,
  la.uw_decision_decision AS UW_Decision,
  la.adverse_action_declineReasons AS Decline_Reasons,
  MTA2126,
  ALL9220,
  MTF8169,
  CASE 
  WHEN (CAST(uw_packet_credit_score AS FLOAT64) <= 620 AND CAST(uw_packet_credit_score AS FLOAT64) > 850) OR CAST(uw_packet_credit_score AS FLOAT64) IN (9000,9001,9002,9003) AND la.uw_decision_decision != 'DECLINE' AND la.status NOT IN ('DECLINED', 'CANCELLED') THEN 'FICO_Knockout_Failure'
  WHEN MTA2126 > 0 AND la.uw_decision_decision != 'DECLINE' AND la.status NOT IN ('DECLINED', 'CANCELLED') THEN 'Delinquent_30mdy_6mo_Knockout_Failure' 
  WHEN COL3211 > 0 AND la.uw_decision_decision != 'DECLINE' AND la.status NOT IN ('DECLINED', 'CANCELLED') THEN 'Non_Medical_Collections_Knockout_Failure'
  WHEN ALM6270 >= 60 AND la.uw_decision_decision != 'DECLINE' AND la.status NOT IN ('DECLINED', 'CANCELLED') THEN 'Worst_Trade_Status_12mo_non_medical_Knockout_Failure'
  WHEN IQT9425 - ( IQM9415 + IQA9415 ) >= 6 AND la.uw_decision_decision != 'DECLINE' AND la.status NOT IN ('DECLINED', 'CANCELLED') THEN 'Inquiries_Num_6mo_Knockout_Failure'
  WHEN IQF9415 > 2 AND la.uw_decision_decision != 'DECLINE' AND la.status NOT IN ('DECLINED', 'CANCELLED') THEN 'Finance_Inquiries_Num_No_Exceed_2_Knockout_Failure'
  WHEN ALL9220 <= 24 AND la.uw_decision_decision != 'DECLINE' AND la.status NOT IN ('DECLINED', 'CANCELLED') THEN 'No_Bankruptcy_24mo_Knockout_Failure'
  WHEN MTF8169 <= 60 AND la.uw_decision_decision != 'DECLINE' AND la.status NOT IN ('DECLINED', 'CANCELLED') THEN 'No_Foreclosure_60mo_Knockout_Failure'
  WHEN CAST(subcode AS FLOAT64) IN (16,23,26,28,31,33) AND la.uw_decision_decision != 'DECLINE' AND la.status NOT IN ('DECLINED', 'CANCELLED') THEN 'FACTA_Knockout_Failure' 
  WHEN (d.description LIKE '%subcode 5%' OR d.description LIKE '%subcode 25%' OR d.description LIKE '%subcode 13%' OR d.description LIKE '%subcode 14%' OR d.description LIKE '%subcode 27%') AND la.uw_decision_decision != 'DECLINE' AND la.status NOT IN ('DECLINED', 'CANCELLED') THEN 'Experian_Fraud_Shield_Knockouts_Failure'
--   WHEN ((CAST(uw_packet_credit_score AS FLOAT64) <= 620 AND CAST(uw_packet_credit_score AS FLOAT64) > 850) OR CAST(uw_packet_credit_score AS FLOAT64) IN (9000,9001,9002,9003)) IS FALSE AND (MTA2126 > 0) IS FALSE AND (COL3211 > 0) IS FALSE AND (ALM6270 >= 60) IS FALSE AND (IQT9425 - ( IQM9415 + IQA9415 ) >= 6) IS FALSE
--   AND (IQF9415 > 2) IS FALSE AND (ALL9220 <= 24) IS FALSE AND (MTF8169 <= 60) IS FALSE AND (CAST(subcode AS FLOAT64) IN (16,23,26,28,31,33)) IS FALSE AND (d.description LIKE '%subcode 5%' OR d.description LIKE '%subcode 25%' OR d.description LIKE '%subcode 13%' OR d.description LIKE '%subcode 14%' OR d.description LIKE '%subcode 27%') IS FALSE
--   AND la.uw_decision_decision = 'DECLINE' AND la.status = 'DECLINED' THEN 'Apps shall have not been declined, while were declined'
  ELSE 'PASS'
  END AS Credit_Hard_Knockout_Failure
FROM  reporting.lkup_credit_attr lca 
JOIN rpt_staging.stg_uw_decision sud ON sud.application_uuid_value = lca.application_uuid_value
JOIN staging_evolved.fraud f ON f.application_uuid.value = lca.application_uuid_value
JOIN reporting.lkup_application la ON la.application_uuid_value = lca.application_uuid_value
LEFT JOIN UNNEST(decisions) AS d
LEFT JOIN ( SELECT * FROM rpt_staging.stg_credit_soft_elig_factors WHERE lower(type) LIKE '%facta%') s ON s.application_uuid_value = lca.application_uuid_value
WHERE product_type ='HELOC'
)

SELECT     
  *
FROM Credit
WHERE Credit_Hard_Knockout_Failure != 'PASS' AND R = 1
ORDER BY application_start_date DESC


-- SELECT DISTINCT(uw_decision_decision) AS UW_Decision FROM reporting.lkup_application



