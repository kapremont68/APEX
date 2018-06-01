--------------------------------------------------------
--  DDL for View V_HOUSE_INFO
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "FCR"."V_HOUSE_INFO" ("HOUSE_ID", "ADDR", "AREA_VAL", "CREATE_YEAR", "WALL_TYPE", "FLORS", "ELEVATOR_TAG", "BASEMENT_TAG", "ROOF_YEAR", "FACE_YEAR", "ISYS_YEAR", "CMET_YEAR", "ELEV_YEAR", "BASE_YEAR", "FUND_YEAR", "CHARGE_SUM_TOTAL", "PAY_SUM_TOTAL", "BARTER_SUM_TOTAL", "DOLG_SUM_TOTAL", "OWNERS_JOB_SUM_TOTAL", "BALANCE_SUM_TOTAL", "PAY_PERCENT") AS 
  select
    HI.c#house_id house_id,
    HA.ADDR,
    HI.C#area_val area_val,
    HI.C#CREATE_YEAR CREATE_YEAR,
    WT.C#NAME WALL_TYPE,
    C#FLORS FLORS,
    C#ELEVATOR_TAG ELEVATOR_TAG,
    C#BASEMENT_TAG BASEMENT_TAG,
    C#ROOF_L_YEAR||'-'||C#ROOF_H_YEAR ROOF_YEAR,
    C#FACE_L_YEAR||'-'||C#FACE_H_YEAR FACE_YEAR,
    C#ISYS_L_YEAR||'-'||C#ISYS_H_YEAR ISYS_YEAR,
    C#CMET_L_YEAR||'-'||C#CMET_H_YEAR CMET_YEAR,
    C#ELEV_L_YEAR||'-'||C#ELEV_H_YEAR ELEV_YEAR,
    C#BASE_L_YEAR||'-'||C#BASE_H_YEAR BASE_YEAR,
    C#FUND_L_YEAR||'-'||C#FUND_H_YEAR FUND_YEAR
    ,TH.CHARGE_SUM_TOTAL
    ,TH.PAY_SUM_TOTAL
    ,TH.BARTER_SUM_TOTAL
    ,TH.DOLG_SUM_TOTAL
    ,TH.OWNERS_JOB_SUM_TOTAL
    ,TH.BALANCE_SUM_TOTAL
    ,TH.PAY_SUM_TOTAL/TH.CHARGE_SUM_TOTAL*100 PAY_PERCENT
from
    fcr.t#house_info@dbl_fcr1 HI
    left join fcr.T#HOUSE_WALL_TYPE@dbl_fcr1 WT on (HI.C#WALL_TYPE_ID = WT.C#ID)
    join V_HOUSE_ADDR HA on (HI.c#house_id  = HA.HOUSE_ID)
    join V_TOTAL_HOUSE TH on (HA.HOUSE_ID = TH.HOUSE_ID and MN = (select max(mn) from V_TOTAL_HOUSE))
;