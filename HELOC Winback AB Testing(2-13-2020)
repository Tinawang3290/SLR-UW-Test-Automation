WITH F0 AS (
SELECT 
  kafka_timestamp_ts,
  la.create_timestamp AS App_Created_Date,
  se.application_uuid.value AS App_UUID, 
  se.identity_uuid.value AS Identity_UUID,
  lp.email AS Email,
  o.term AS Term,
  uw_packet.pre_loan_cltv.value AS Pre_Loan_CLTV,
  uw_packet.pre_loan_adj_cltv.value AS Pre_Loan_Adj_CLTV,
  uw_packet.post_loan_cltv.value AS Post_Loan_CLTV, 
  uw_packet.post_loan_adj_cltv.value AS Post_Loan_Adj_CLTV,
  uw_packet.credit_score AS Credit_Score, 
  uw_packet.first_lien AS First_Lien,
  property_type AS Property_Type, 
  
 -- Owner occupied/non-judicial 
-- 5 years
--0-50% 
 CASE 
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0699  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0625  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0549  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
--50-60% 
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0775  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
--60-65%
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0875  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0849  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0749  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
-- 65-75%
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0899  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0749  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0549  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
-- 75~80%
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0625  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0549  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A' 
-- 80-85%  
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0749  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
-- 85-90%   
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0625  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
-- 90-95%  
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0625  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 800 AND 850) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'

-- 10 years
--0-50%  
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0749  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0649  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
--50-60% 
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0825  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799 THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0699  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0625  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
--60-65%
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0899  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0875  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0775  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0699  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
-- 65-75%
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0925  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0825  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0775  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
-- 75~80%
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0649  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A' 
-- 80-85%  
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0775  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0699  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0625  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
-- 85-90%   
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0825  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0749  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0649  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 800 AND 850) AND CAST(o.int_rate.value AS FLOAT64) = 0.0549  THEN 'A'
-- 90-95%  
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0749  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0699  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 800 AND 850) AND CAST(o.int_rate.value AS FLOAT64) = 0.0649  THEN 'A'
  
 -- 15 years
--0-50%  
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0775  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0749  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
--50-60% 
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0849  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0825 THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0649  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
--60-65%
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0925  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0899  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0549  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
-- 65-75%
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0949  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0849  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
-- 75~80%
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A' 
-- 80-85%  
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0649  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0549  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 800 AND 850) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
-- 85-90%   
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0849  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0775  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0625  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 800 AND 850) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'
-- 90-95%  
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0775  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0699  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS FALSE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 800 AND 850) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'
   
  
  -- Owner occupied/judicial														
-- 5 years														
--0-50%																												
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0775  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0749  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'														
  --50-60%														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0849  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0825  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0649  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'														
  --60-65%														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0925  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0899  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0549  THEN 'A'	
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'	
  -- 65-75%														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0949  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0849  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'														
  -- 75~80%														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'														
  -- 80-85%														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0649  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0549  THEN 'A'	
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
  -- 85-90%														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0849  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0775  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0549  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 800 AND 850) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'	
  -- 90-95%														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0775  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0649  THEN 'A'														
  WHEN o.term = 5 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 800 AND 850) AND CAST(o.int_rate.value AS FLOAT64) = 0.0625  THEN 'A'														

  -- 10 years														
  --0-50%														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0775  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0699  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0625  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'														
  --50-60%														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0875  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0849 THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0749  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'														
  --60-65%														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0949  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0925  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0825  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0749  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'		
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0549  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'														
  -- 65-75%														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0975  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0875  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0825  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0625  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0549  THEN 'A'																											
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'	
  -- 75~80%														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0699  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0625  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0549  THEN 'A'
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'	
  -- 80-85%														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0825  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0749  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0625  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'		
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 800 AND 850) AND CAST(o.int_rate.value AS FLOAT64) = 0.0549  THEN 'A'	
  -- 85-90%														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0875  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0699  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0649  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0625  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 800 AND 850) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'														
  -- 90-95%														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0749  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'														
  WHEN o.term = 10 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 800 AND 850) AND CAST(o.int_rate.value AS FLOAT64) = 0.0699  THEN 'A'														

  -- 15 years														
  --0-50%														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0825  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0649  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'														
  --50-60%														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0899  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0875 THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0775  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0699  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'														
  --60-65%														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 600 AND 619) AND CAST(o.int_rate.value AS FLOAT64) = 0.0975  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0949  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0849  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0775  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'		
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'		
  -- 65-75%														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0999  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0899  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0849  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0649  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
  -- 75~80%														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0625  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'		
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0549  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'	
  -- 80-85%														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0849  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0775  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0699  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0649  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.8 AND 0.85 AND (uw_packet.credit_score BETWEEN 800 AND 850) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'														
  -- 85-90%														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0899  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0825  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0649  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.85 AND 0.9 AND (uw_packet.credit_score BETWEEN 800 AND 850) AND CAST(o.int_rate.value AS FLOAT64) = 0.0625  THEN 'A'														
  -- 90-95%														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0825  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0775  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0749  THEN 'A'														
  WHEN o.term = 15 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.9 AND 0.95 AND (uw_packet.credit_score BETWEEN 800 AND 850) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'														

  -- 30 years														
  --0-50%														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0825  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0749  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 700 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0 AND 0.5 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'	
  
  --50-60%														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0899  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0725  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 700 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.5 AND 0.6 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'
  
  --60-65%														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.0975  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0875  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0649  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0625  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0575  THEN 'A'  
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.6 AND 0.65 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'															
  -- 65-75%														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 620 AND 639) AND CAST(o.int_rate.value AS FLOAT64) = 0.1025  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 640 AND 659) AND CAST(o.int_rate.value AS FLOAT64) = 0.0925  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 660 AND 679) AND CAST(o.int_rate.value AS FLOAT64) = 0.0875  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0699  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.65 AND 0.75 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'														
  -- 75~80%														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 680 AND 699) AND CAST(o.int_rate.value AS FLOAT64) = 0.0799  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 700 AND 719) AND CAST(o.int_rate.value AS FLOAT64) = 0.0699  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 720 AND 739) AND CAST(o.int_rate.value AS FLOAT64) = 0.0675  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 740 AND 759) AND CAST(o.int_rate.value AS FLOAT64) = 0.0599  THEN 'A'														
  WHEN o.term = 30 AND uw_packet.first_lien IS TRUE AND Property_Type = 'HOME' AND Pre_Loan_CLTV BETWEEN 0.75 AND 0.8 AND (uw_packet.credit_score BETWEEN 760 AND 799) AND CAST(o.int_rate.value AS FLOAT64) = 0.0525  THEN 'A'														

  END AS Grid,
    o.int_rate.value AS Int_Rate_Value,
    o.original_rate.value AS Ori_Rate_Value
  FROM `figure-production.staging_evolved.uw_decision` se
  JOIN `figure-production.reporting.lkup_profile` lp ON lp.identity_uuid_value = se.identity_uuid.value
  JOIN `figure-production.reporting.lkup_application` la ON la.identity_uuid_value = se.identity_uuid.value
  LEFT JOIN UNNEST(offers) AS O
  WHERE  o.int_rate.value  IS NOT NULL 
  Order by la.create_timestamp DESC)

  SELECT * FROM F0
  WHERE GRID != 'A' AND DATETIME(App_Created_Date) >= '2020-02-13' AND Identity_UUID IN 
('9b60649a-711c-48b5-a550-d2fcf8a5ca44','dc2a25df-29da-4bcb-a0ed-c7b54f91c517','3d9dfbd0-a635-4970-8d12-0e4cf7341fe6','2c752b06-e6ce-4610-86b3-4c38c1d3e2f4','c0ece3d0-5267-4d2d-852b-5afc5637fba1','daba9f00-3b56-48fd-9e5c-979334a94fc3','dad7fe2e-7d2a-40b4-8e4a-c5972741679b','16d5a216-94e9-4086-8d43-5385db532de4','f80d2588-121f-40d0-8b93-82402b996c15','7cc12be3-f317-4f8d-884c-56338f4c0fd2','1e050331-8253-47b1-ba5f-936ec84829fd','54c1be62-4ee3-4ad9-bcb3-d4ec93a2a5ea','10b55244-6159-445a-9a13-65d3fab9f9e8','b32cb239-49e6-48ed-833f-e00aafbb8f9f','4ed4a076-3344-42c8-b52b-a5dcbad9ed3f','897d8836-84ed-4605-97f8-6e9f15ca8604','d7b3e024-a424-4eec-a70b-2e7e8fffe4c4','19ce9965-7cfd-4c78-953c-a631a209dc7e','84faf9d1-55a5-48ee-85d7-92b7c78976ac','34c0827f-5162-4ffb-9c49-b4a7526bb532','a0d3c39a-ae76-47ef-9222-412923d5a2a6','51581695-b181-41e9-9f89-c39dc8721694','6cb2867b-184c-440f-b50c-dbd044810a1e','e57c4732-d4c6-40d3-83bb-1fe95f82425e','5abc9de5-d440-495d-a5a4-2e78815fcc3b','7aea2c68-1499-4a63-b271-cf9c02067eda','a50bc367-4214-4ad5-87b7-03df99d23712','bc4559b2-bc3e-438b-8d9b-734dcdb811ef','907f67a9-6b03-4534-9339-244eab74bbc5','80576113-f50a-4388-b063-273a0b1bc372','f24e74f4-a460-42ca-8ed9-87ba7d643afa','6b3bf634-b210-4f7c-8113-0beea9f4c63d','e81fbb25-5b5a-483f-be3e-fdeae48e72ae','70929cfd-e6b4-4ef0-ac65-0346d4362e0c','879e1bcb-5eaf-4e60-9c11-5ebca9971c81','aac77f8f-11ff-4731-bbd3-8de9a59a994d','20b2c6d0-f3e0-438b-acac5ff8a016b2ee','6b2054a4-a293-49ff-b447-9065c0364722','ebf98653-cb9d-4c22-adab-405ae0214a7b','548ede8b-c52b-4daa-8d5b-a9da5c0a6888','3a098ac6-360d-46fb-a6dd-fc5158a3a062','99023173-1507-4ac5-8840-84be22304513','41469d51-8dab-4e52-a0b8-7495f0d4bb98','a6867323-8a5a-4aa9-932c-4e8bd6eb6e9c','4e87b60e-8760-4ab6-a949-c56a11e0898c','994e5230-152b-40f6-8735-a7e4becd173b','c6280a16-a27c-41ca-aebd-6773bd9bf1eb','84435b82-d16f-4f8a-a1f9-a66aff80c2ea','7a208473-8d50-41b3-9be5-de3eec9202dd','102a8683-bbf3-40b5-850a-451a3fab1563','df976697-767b-4d0f-b636-7a469ecc63c3','1344d0e1-23ee-43de-8c87-ef52cd87b802','e296717a-3e50-434c-89e6-27a6580ebbee',
'a8e83792-c49f-4c2b-ae85-ec587fa83406','2fabc5ee-5338-47a9-86b0-516490e991d1','c7d1ee6c-53f8-4255-b72c-8d22ab219d9a','215deaab-8dd4-48ef-a1e7-cb62cec8ae06','a976ff92-7a5e-4fbe-a942-72c471fe93fc','903ad00d-c538-40a0-9bea-e1769773baac','f069f5a2-1383-46b4-a90c-4f525cf3026f','2aa61380-069e-47a1-9230-172d8a5a5858','38767915-6f35-4caf-a126-2af5b834a4a8','5d6c9334-3512-4f3a-8a48-ab08b0434ee8','514880d5-cf01-4b35-89e3-90478556d585',
'333db985-8d3c-4eae-8a4c-3daa39594c83','2422b9f4-32a7-48ac-8175-fdf06d245bf5','187f8f27-1b54-4322-8fe0-656c270fc663','4cfa807a-56d5-4c88-bb96-b088c7b41617','731726c4-5c08-41d3-960b-3c25c34a26bf','fd3c295f-4b22-43b2-89a6-f66f963656c2','e4b51b39-903d-4f3a-85d8-4eb893a28f7d','c6c8d9f2-09d0-4fff-b0a2-39aab7395755',
'a3992e87-3970-4020-83e2-1fd34607df96','57eb5d55-10ea-4025-9033-a82a261c9c53','bd7c85ef-c008-401a-bdd4-0fe36f87a3d2','2db361de-a1d9-43ec-9b17-541af1496847','f89ef45a-79ee-483c-a68c-525514c46bc8','d47e8bd3-8228-419e-aafb-1456d850b1ff','1520fbea-8e4b-4ce2-8379-c3a8552eaed3','1e76736e-9e8a-4b81-a771-e22d95ed6d85','ef5a6782-5c41-42c6-a7e5-4ce9c65432ac','16e92d89-db4c-4049-88d8-8acfe77ccb0a','2cb47c8a-f061-4c4f-b75f-68a7c1956b62','f513202f-e550-41d7-9d35-b1dee2c2f76b',
'32dee56d-f505-485c-82c4-619fc9aade31','b6c9ebca-0ba7-437c-be67-55c64806049b','20ace113-914a-438e-a899-ea2df80cd540','25ab1145-be19-493b-aaf7-6606a25ee633','0de6fdf2-4d42-422c-866c-de01584917eb','edaeb137-1cf4-4c2e-a509-d9350bb3b135','37ee5734-5f35-4534-983b-bf11be7ed801','4874e5c8-bc8c-4fd1-bddc-2772ba244d41','daaf2f7c-d6b5-4c0d-8181-55df01dbd417','b25110d6-bba8-41d9-a7fb-a7c9d2c95078','0219b3a3-9fe8-43dc-89f3-046d3314b580','c788f1df-4c54-467d-b6e7-2bf489b09c62','8dc47b9b-8dcf-434e-a260-dd5ef7a45f29','8ef60044-a3a4-4a01-8258-dbb3a88c5d41','20cce273-de0b-4baa-a69e-f8724710cecd', 'e7c8d21f-fb1b-4e00-ace4-b7a1ba3aece9','351ebad7-cc1a-404e-9c6b-d5a9733e5126','214cb258-2c0e-444b-83db-1bb82f3b9511','e3e62300-5738-4efc-835a-50428320f221','0dfc54da-f3af-4d94-8ebc-d29c0a46122a','1c6eaf05-db75-41eb-83b8-b97466edd031', '1b044a9c-73bd-4b7f-97d2-6633185c2aa2','c1ba2077-547a-417a-89fe-134ed49879ba','b1ca41b3-bae8-4b2f-983e-c0a3ccd1a5e9','dcc0a5f5-4664-4a4c-b412-5a95d638f548','57cbe77e-6834-4328-bca2-7846c1ddd1c9','c38131c8-4fbc-470e-900a-d2adf7c8f883','e62a407e-047d-44b1-a563-075aeed22e24','5c8c65ee-13e5-4bdd-ba80-4c4071d89fe9','5d7a523b-420c-4424-b511-d25efcec531e','91ad39b9-4194-4e95-af4e-261401155fbb','4b834855-c1b8-40a1-9b08-cbbebce2fbd7','ca2d22ab-4f10-41ae-90da-bf76c3795523','62908cd3-c23c-4c26-b466-47fed2916f88','47c14657-efb8-4b5a-b4a9-b88e2bf7b00f','9cb37ff5-3390-44ff-9eb2-4ce34a5517c4','215669a7-90b5-4f75-9349-a0089febf75e',
'a8e83792-c49f-4c2b-ae85-ec587fa83406', '9fe2c851-f48e-4234-8967-0395149c80d2','2ca3ef5f-a787-40ba-bb53-cba75f59b498')




