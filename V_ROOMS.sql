--------------------------------------------------------
--  DDL for View V_ROOMS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "FCR"."V_ROOMS" ("ACCOUNT_ID", "ROOM_ID", "ACCOUNT_NUM444", "LIVING_TAG", "OWN_TYPE_TAG", "AREA_VAL") AS 
  select
    A.c#id ACCOUNT_ID,
    A.C#ROOMS_ID ROOM_ID,
    A.C#num ACCOUNT_NUM444,
    R.C#LIVING_TAG LIVING_TAG,
    R.C#OWN_TYPE_TAG OWN_TYPE_TAG,
    R.C#AREA_VAL AREA_VAL
from
    fcr.V#ACCOUNT@dbl_fcr1 A
    join fcr.V#ROOMS@dbl_fcr1 R on (A.C#ROOMS_ID = R.C#ROOMS_ID)
;
