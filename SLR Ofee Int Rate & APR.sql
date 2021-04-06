WITH f0 AS (
SELECT
  kafka_timestamp_ts,
  application_uuid.value AS Application_UUID_Value,
  amount_to_borrow.amount AS Amt_To_Borrow,
  selected_offer.int_rate.value AS Selected_Int_Rate,
  selected_offer.term AS Selected_Term,
  selected_offer.rate_type AS Selected_Rate_Type,
  o.margin.value AS Margin,
  o.libor.value AS Libor,
  o.rate_type AS Rate_Type,
  CAST(o.term AS FLOAT64) AS Term,
  ROUND(CAST(o.int_rate.value AS FLOAT64),5) AS Autopay_Int_Rate,
  CASE 
  WHEN Rate_Type = 'FIXED' THEN ROUND(CAST(o.int_rate.value AS FLOAT64),5)
  WHEN Rate_Type = 'FLOATING' THEN ROUND((SAFE_CAST(o.margin.value AS FLOAT64) + COALESCE(CAST(o.libor.value AS FLOAT64),0) - 0.0025),5) 
  END AS T_Autopay_Rate, 
  ROUND(CAST(o.non_autopay_int_rate.value AS FLOAT64),5) AS Non_Autopay_Rate,
  CASE 
  WHEN Rate_Type = 'FIXED' THEN ROUND(CAST(o.non_autopay_int_rate.value AS FLOAT64),5)
  WHEN Rate_Type = 'FLOATING' THEN ROUND((SAFE_CAST(o.margin.value AS FLOAT64) + COALESCE(CAST(o.libor.value AS FLOAT64),0)),5) 
  END AS T_Non_Autopay_Rate,
  o.origination_fee.value AS Origination_Fee,
  CAST(o.origination_fee_percentage.value AS FLOAT64) AS Origination_Fee_Percentage,
  ROUND(CAST(o.non_autopay_apr_rate.value AS FLOAT64),5) AS Non_Autopay_APR_Rate,
  n.Ori_Autopay_Int_Rate,
  ROUND(CAST(o.apr_rate.value AS FLOAT64),5) AS APR_Rate,
  round(CAST(o.rate_cap.value AS Float64),5) AS Rate_Cap_Value,
  ROUND((SAFE_CAST(o.margin.value AS FLOAT64) + COALESCE(CAST(o.libor.value AS FLOAT64),0) + CAST(o.origination_fee_percentage.value AS FLOAT64)),5) AS T_Ofee_Usury_Cap_Percentage,
  o.orig_fee_type AS Orig_Fee_Type,
  o.origination_fees.amount AS Origination_Fees,
  d.code AS Decline_Code,
  d.reason AS Decline_Reason,
FROM (SELECT * FROM(SELECT *,ROW_NUMBER() OVER (PARTITION BY application_uuid.value ORDER BY kafka_timestamp_ts DESC) AS r FROM staging_evolved.uw_data_proto_external_decision_slr_r1)WHERE r =1) s
LEFT JOIN UNNEST(offers) AS O
LEFT JOIN UNNEST(Decline_reasons) AS d
LEFT JOIN (

  SELECT  
    application_uuid.value AS Application_UUID_Value, 
    o.Term AS Term,
    CASE WHEN CAST(o.origination_fee_percentage.value AS FLOAT64) = 0 AND o.rate_type ='FIXED' THEN ROUND(CAST(o.int_rate.value AS FLOAT64),5) END AS Ori_Autopay_Int_Rate,
    ROUND(CAST(o.int_rate.value AS FLOAT64),5) AS Int_Rate_Value FROM(
    SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY application_uuid.value ORDER BY kafka_timestamp_ts DESC) AS r
  FROM staging_evolved.uw_data_proto_external_decision_slr_r1 s
  )
  LEFT JOIN UNNEST(offers) AS O
  WHERE r = 1 AND CAST(o.origination_fee_percentage.value AS FLOAT64) = 0 AND o.rate_type ='FIXED'
  
  ) n ON n.Application_UUID_Value = s.application_uuid.Value AND n.Term = o.Term
),



F1 AS(SELECT 
  *,
  CASE
    WHEN CAST(term AS FLOAT64) = 5 AND Rate_Type = 'FIXED' THEN ROUND((Ori_Autopay_Int_Rate - Origination_Fee_Percentage/1.75),5)
    WHEN CAST(term AS FLOAT64) = 7 AND Rate_Type = 'FIXED' THEN ROUND((Ori_Autopay_Int_Rate  - Origination_Fee_Percentage/2),5)
    WHEN CAST(term AS FLOAT64) = 10 AND Rate_Type = 'FIXED' THEN ROUND((Ori_Autopay_Int_Rate - Origination_Fee_Percentage/2.5),5)
    WHEN CAST(term AS FLOAT64) = 15 AND Rate_Type = 'FIXED' THEN ROUND((Ori_Autopay_Int_Rate - Origination_Fee_Percentage/3),5)
    WHEN CAST(term AS FLOAT64) = 20 AND Rate_Type = 'FIXED' THEN ROUND((Ori_Autopay_Int_Rate - Origination_Fee_Percentage/3.25),5)
  END AS T_Autopay_Int_Adj_Rate,
    CASE 
    WHEN CAST(term AS FLOAT64) = 5 AND Rate_Type = 'FIXED' THEN ROUND((Ori_Autopay_Int_Rate - Origination_Fee_Percentage/2.4),5) 
    WHEN CAST(term AS FLOAT64) = 7  AND Rate_Type = 'FIXED' THEN ROUND((Ori_Autopay_Int_Rate - Origination_Fee_Percentage/3.3),5)
    WHEN CAST(term AS FLOAT64) = 10  AND Rate_Type = 'FIXED' THEN ROUND((Ori_Autopay_Int_Rate - Origination_Fee_Percentage/4.6),5)
    WHEN CAST(term AS FLOAT64) = 15 AND Rate_Type = 'FIXED' THEN ROUND((Ori_Autopay_Int_Rate - Origination_Fee_Percentage/6.7),5)
    WHEN CAST(term AS FLOAT64) = 20 AND Rate_Type = 'FIXED' THEN ROUND((Ori_Autopay_Int_Rate - Origination_Fee_Percentage/8.5),5)
  END AS T_APR_Adj_Rate
FROM F0)

SELECT 
  kafka_timestamp_ts,
  Application_UUID_Value,
  Amt_To_Borrow,
  Selected_Int_Rate,
  Selected_Term,
  Selected_Rate_Type,
  Margin,
  Libor,
  Rate_Type,
  Term,
  T_Autopay_Rate,
  CASE 
  WHEN ROUND(Autopay_Int_Rate,4) = ROUND(T_Autopay_Rate,4) THEN 'Match'
  WHEN ROUND(Autopay_Int_Rate,4) != ROUND(T_Autopay_Rate,4) THEN 'Unmatch'
  ELSE 'Unavailable'
  END AS T_Autopay_Rate_Match,
  Non_Autopay_Rate,
  T_Non_Autopay_Rate,
  CASE 
  WHEN ROUND(Non_Autopay_Rate,4) = ROUND(T_Non_Autopay_Rate,4) THEN 'Match'
  WHEN ROUND(Non_Autopay_Rate,4) != ROUND(T_Non_Autopay_Rate,4) THEN 'Unmatch'
  ELSE 'Unavailable'
  END AS T_Non_Autopay_Rate_Match,
  Origination_Fee,
  Origination_Fee_Percentage,
  Ori_Autopay_Int_Rate,
  Autopay_Int_Rate,

  T_Autopay_Int_Adj_Rate,
  CASE
  WHEN ROUND(Autopay_Int_Rate,4) = ROUND(T_Autopay_Int_Adj_Rate,4) THEN 'Match'
  WHEN ROUND(Autopay_Int_Rate,4) != ROUND(T_Autopay_Int_Adj_Rate,4) THEN 'Unmatch'
  ELSE 'Unavailable'
  END AS T_Autopay_APR_Adj_Rate_Match,
  Non_Autopay_APR_Rate,
  APR_Rate,
  T_APR_Adj_Rate,
  CASE
  WHEN ROUND(APR_Rate,4) = ROUND(T_APR_Adj_Rate,4) THEN 'Match'
  WHEN ROUND(APR_Rate,4) != ROUND(T_APR_Adj_Rate,4) THEN 'Unmatch'
  ELSE 'Unavailable'
  END AS T_APR_Adj_Rate_Match,
  Rate_Cap_Value,
  T_Ofee_Usury_Cap_Percentage
FROM F1
WHERE 
ROUND(Autopay_Int_Rate,4) != ROUND(T_Autopay_Rate,4)
OR ROUND(Non_Autopay_Rate,4) != ROUND(T_Non_Autopay_Rate,4)

OR ROUND(APR_Rate,4) != ROUND(T_APR_Adj_Rate,4) OR ROUND(Autopay_Int_Rate,4) != ROUND(T_Autopay_Int_Adj_Rate,4)

 
ORDER BY kafka_timestamp_ts DESC

