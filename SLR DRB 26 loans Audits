SELECT *FROM (
SELECT
 sla.application_uuid_value AS Application_UUID_Value,
  CASE 
  WHEN DATE(app_start_date) = '2020-03-26' THEN sla.kafka_timestamp_ts
  ELSE app_start_date 
  END AS App_Created_Dt,
  s.uw_packet.credit_score AS FICO,
  BCC5838,BCC5830, BCX5830,RTR5030,BAX5030, BCX5030,ILN5820,ILN5824,ALX5830, AUA5820,STU5020,STU5820, MTF5820,MTS5820,HLC5820,  ALL5830,MTA5830, MTX5839, AUT5820, MTJ0416, 
  CAST(uw_packet.revolving_credit_card_debt.amount AS FLOAT64) AS Z, 
  ROUND(CAST(uw_packet.total_revolving_debt.amount AS FLOAT64),4) AS Monthly_Revolving_Debt, 
  CAST(uw_packet.total_installment_debt.amount AS FLOAT64) AS Monthly_Installment_Debt,
  CAST(uw_packet.total_mortgage_debt.amount AS FLOAT64) AS Monthly_Mortgage_Debt,  

  CAST(uw_packet.msa_housing_expense.amount AS FLOAT64) AS MSA_Housing_Expense, 
  CAST(uw_packet.housing_expense.amount AS FLOAT64) AS Housing_Rent_Expense, 
  CAST(uw_packet.transportation_expense.amount AS FLOAT64) AS Transportation_Expense,
  CAST(uw_packet.bureau_debt.amount AS FLOAT64) AS Additional_Bureau_Debt,
  ROUND(CAST(uw_packet.monthly_debt.amount AS FLOAT64),4) AS Monthly_Debt,
  loan_amount_requested,
  CAST(amount_to_borrow.amount AS FLOAT64) AS Requested_Amount,  
  CAST(uw_packet.total_bureau_reported_sl_balance.amount AS FLOAT64) AS Total_Bureau_Reported_SL_Balance,
  CAST(sla.pre_loan_dti AS FLOAT64) AS Pre_Loan_DTI,
  ROUND(CAST(uw_packet.current_student_loan_payment.amount AS FLOAT64),3) AS Current_Student_Loan_Payment,
  CAST(uw_packet.stated_monthly_income.amount AS FLOAT64) AS Stated_Monthly_Income,
  CAST(uw_packet.tax_reduction_factor.value AS FLOAT64) AS Tax_Reduction_Factor,
  -- need to verify
  CAST(sla.verified_monthly_income_amount AS FLOAT64) AS Verified_Montly_Income, 
  CAST(loan_term AS FLOAT64) AS Selected_Term,
  CAST( app_rate_with_auto AS FLOAT64) AS Offer_Autopay_Rate,
  CAST( app_rate_wo_auto AS FLOAT64) AS Offer_Non_Autopay_Rate,
  CAST(sla.pre_loan_free_cash_flow AS FLOAT64) AS Pre_Loan_Free_Cashflow,
  CAST(sla.post_loan_free_cash_flow AS FLOAT64) AS Post_Loan_Free_Cashflow,

 ROW_NUMBER() OVER(PARTITION BY sla.application_uuid_value ORDER BY s.kafka_timestamp_ts DESC) AS r

FROM `figure-production.staging_evolved.uw_data_proto_external_decision_slr_r1` s
JOIN `figure-production.reporting.lkup_slr_application` sla ON sla.application_uuid_value = s.application_uuid.value
JOIN (SELECT * FROM `reporting.lkup_credit_attr` WHERE credit_type = 'Hard Credit') lca ON lca.application_uuid_value = s.application_uuid.value
LEFT JOIN UNNEST(offers) AS O
LEFT JOIN UNNEST(decline_reasons) AS D
WHERE sla.application_uuid_value  IN ('9679f32a-a070-47ee-8ad2-49873fe5b45e', '5a0711ec-b8eb-47c8-8e6d-000dfe929aee','0df49e4d-8d65-4664-9caa-7119a76a35d6','1e12707b-0e4f-4d70-8112-049dd4be84fd'
, '9679f32a-a070-47ee-8ad2-49873fe5b45e', '5a0711ec-b8eb-47c8-8e6d-000dfe929aee', '0df49e4d-8d65-4664-9caa-7119a76a35d6', '1e12707b-0e4f-4d70-8112-049dd4be84fd',
'3419dc67-0272-4cd7-91d8-ebc75a1cfac5', '542d0a4b-878c-4c7f-be04-d4e6e0b11447','290005d3-832a-4e70-b6d8-e233092f8c3a', '5cf2e57b-b0a5-4923-9b72-4d942e17b3e1','2eea626c-4518-46e9-8980-07c846f2a1a3',
'cea54884-9f5f-4b54-923c-71ad2f9155ca','0d5cc68f-9594-4ece-a7ce-4a9012b6b67b','0cba2658-1240-4554-a7ee-098f554856f3','ac068f6c-51b8-4cef-993f-690f6d2e3031','4964bae6-b33d-4ccd-b49e-34bb977a1e57','5c4d1a40-fe9a-4366-979b-53c15cc2625f',
'042ac4d2-671f-4691-a72d-ed2ce9cc9565','acb83712-649e-48ee-b99f-eed5fa519be2', 'ed2091be-2d5e-40d2-8425-048f0db632f5','d392b157-6429-466b-b347-29a57c46aa10', '98d857b0-4bc0-4819-98f0-a2ae899f765b','771c2614-3596-4c5f-9c75-39485ee98d51',
'382771a6-3caa-4888-85e5-32651f031270','49e86d83-dfaf-4dcb-9423-41ebc85682e1','e9d9dffd-8f31-4092-96ad-0c29d6cf72ad','084f7e66-e103-4934-968d-79efe9052e5e','70d23f4c-57c4-4f24-8706-229f0774971f')
ORDER BY s.kafka_timestamp_ts DESC)
WHERE R=1
