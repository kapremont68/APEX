--------------------------------------------------------
--  DDL for View V_TOTAL_HOUSE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "FCR"."V_TOTAL_HOUSE" ("HOUSE_ID", "MN", "PERIOD", "CHARGE_SUM_MN", "CHARGE_SUM_TOTAL", "PAY_SUM_MN", "PAY_SUM_TOTAL", "PENI_SUM_MN", "PENI_SUM_TOTAL", "BARTER_SUM_MN", "BARTER_SUM_TOTAL", "DOLG_SUM_MN", "DOLG_SUM_TOTAL", "JOB_SUM_MN", "JOB_SUM_TOTAL", "OWNERS_JOB_SUM_MN", "OWNERS_JOB_SUM_TOTAL", "GOS_JOB_SUM_MN", "GOS_JOB_SUM_TOTAL", "BALANCE_SUM_MN", "BALANCE_SUM_TOTAL", "ROW_TIME") AS 
  select "HOUSE_ID","MN","PERIOD","CHARGE_SUM_MN","CHARGE_SUM_TOTAL","PAY_SUM_MN","PAY_SUM_TOTAL","PENI_SUM_MN","PENI_SUM_TOTAL","BARTER_SUM_MN","BARTER_SUM_TOTAL","DOLG_SUM_MN","DOLG_SUM_TOTAL","JOB_SUM_MN","JOB_SUM_TOTAL","OWNERS_JOB_SUM_MN","OWNERS_JOB_SUM_TOTAL","GOS_JOB_SUM_MN","GOS_JOB_SUM_TOTAL","BALANCE_SUM_MN","BALANCE_SUM_TOTAL","ROW_TIME" from fcr.t#total_house@dbl_fcr1
;
