--------------------------------------------------------
--  DDL for View V_HOUSE_ADDR
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "FCR"."V_HOUSE_ADDR" ("HOUSE_ID", "ADDR") AS 
  select HOUSE_ID, ADDR from fcr.mv_houses_adreses@dbl_fcr1
;
