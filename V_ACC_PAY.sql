--------------------------------------------------------
--  DDL for View V_ACC_PAY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "FCR"."V_ACC_PAY" ("ACC_ID", "PAY_DATE", "PAY_SUM", "PAY_ACC", "PAY_PERIOD", "PAY_AGENT") AS 
  select
    COALESCE(C#ACC_ID, C#ACC_ID_CLOSE, C#ACC_ID_TTER) ACC_ID,
    P.C#REAL_DATE PAY_DATE,
    P.C#SUMMA PAY_SUM,
    P.C#ACCOUNT PAY_ACC,
    P.C#PERIOD PAY_PERIOD,
    K.C#NAME PAY_AGENT
from
    fcr.T#PAY_SOURCE@dbl_fcr1 P
    left join fcr.t#ops_kind@dbl_fcr1 K on (P.C#COD_RKC = K.C#COD)
;
