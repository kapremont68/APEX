--------------------------------------------------------
--  DDL for View V_ACCOUNT_NUMS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "FCR"."V_ACCOUNT_NUMS" ("HOUSE_ID", "ACCOUNT_ID", "FLAT_NUM", "ACCOUNT_NUM") AS 
  select
--     *
    DISTINCT
        T.HOUSE_ID,
        T.ACCOUNT_ID,
        T.FLAT_NUM,
        A.ACCOUNT_NUM
from
    V_TOTAL_ACCOUNT T
    join V_ALL_ACC A on (T.ACCOUNT_ID = A.ACCOUNT_ID)
;
