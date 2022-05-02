--------------------------------------------------------
--  File created - Monday-May-02-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TRANSACTIONS_TBL
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."TRANSACTIONS_TBL" 
   (	"GUID" VARCHAR2(128 BYTE), 
	"CREATED_BY" VARCHAR2(128 BYTE), 
	"PARKING_NO" NUMBER(*,0), 
	"STARTING_DATE" TIMESTAMP (6), 
	"HOURS_DURATION" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.TRANSACTIONS_TBL
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index TRANSACTIONS_TBL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."TRANSACTIONS_TBL_PK" ON "SYSTEM"."TRANSACTIONS_TBL" ("GUID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table TRANSACTIONS_TBL
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."TRANSACTIONS_TBL" ADD CONSTRAINT "TRANSACTIONS_TBL_PK" PRIMARY KEY ("GUID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."TRANSACTIONS_TBL" MODIFY ("HOURS_DURATION" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TRANSACTIONS_TBL" MODIFY ("STARTING_DATE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TRANSACTIONS_TBL" MODIFY ("PARKING_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TRANSACTIONS_TBL" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TRANSACTIONS_TBL" MODIFY ("GUID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table TRANSACTIONS_TBL
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."TRANSACTIONS_TBL" ADD CONSTRAINT "TRANSACTIONS_TBL_FK1" FOREIGN KEY ("GUID")
	  REFERENCES "SYSTEM"."USERS_TBL" ("GUID") ON DELETE CASCADE ENABLE;
