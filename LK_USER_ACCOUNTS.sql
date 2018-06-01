--------------------------------------------------------
--  DDL for Table LK_USER_ACCOUNTS
--------------------------------------------------------

  CREATE TABLE "FCR"."LK_USER_ACCOUNTS" 
   (	"ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"USER_ID" NUMBER, 
	"HOUSE_ID" NUMBER, 
	"FLAT_NUM" VARCHAR2(50 BYTE), 
	"ACCOUNT_NUM" VARCHAR2(50 BYTE), 
	"ACCOUNT_ID" NUMBER, 
	"ROOM_ID" NUMBER, 
	"ROW_TIME" TIMESTAMP (6) DEFAULT sysdate, 
	"ADDR" VARCHAR2(100 BYTE), 
	"AREA_VAL" NUMBER(7,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_11801091090798670" ;