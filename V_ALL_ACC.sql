--------------------------------------------------------
--  DDL for View V_ALL_ACC
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "FCR"."V_ALL_ACC" ("ACCOUNT_ID", "ACCOUNT_NUM") AS 
  select distinct "ACCOUNT_ID","ACCOUNT_NUM" from (
    SELECT
        C#ACCOUNT_ID ACCOUNT_ID,
        C#OUT_NUM    ACCOUNT_NUM
    FROM
        fcr.T#ACCOUNT_OP@dbl_fcr1
    UNION ALL
    SELECT
        C#ID  ACCOUNT_ID,
        C#NUM ACCOUNT_NUM
    FROM
        fcr.V#ACCOUNT@dbl_fcr1
)
;
