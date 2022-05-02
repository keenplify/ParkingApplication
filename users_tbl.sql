--------------------------------------------------------
--  File created - Monday-May-02-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table USERS_TBL
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."USERS_TBL" 
   (	"GUID" VARCHAR2(128 BYTE), 
	"FIRST_NAME" VARCHAR2(64 BYTE), 
	"LAST_NAME" VARCHAR2(64 BYTE), 
	"PHONE_NUMBER" VARCHAR2(16 BYTE), 
	"GENDER" VARCHAR2(20 BYTE), 
	"USERNAME" VARCHAR2(64 BYTE), 
	"PASSWORD" VARCHAR2(1024 BYTE), 
	"TYPE" VARCHAR2(16 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."USERS_TBL"."GENDER" IS 'Enum MALE or FEMALE';
   COMMENT ON COLUMN "SYSTEM"."USERS_TBL"."PASSWORD" IS 'Hashed password';
   COMMENT ON COLUMN "SYSTEM"."USERS_TBL"."TYPE" IS 'Enum USER or ADMIN';
REM INSERTING into SYSTEM.USERS_TBL
SET DEFINE OFF;
Insert into SYSTEM.USERS_TBL (GUID,FIRST_NAME,LAST_NAME,PHONE_NUMBER,GENDER,USERNAME,PASSWORD,TYPE) values ('d79fc601-9a4f-433f-808f-2bae11a2186e','Tester','User','09062281049','FEMALE','testuser','$2y$10$MbtiLiysA15cFjrHIRTIpOIzuQvXWIvmbvBgcNfJZxvaIr30XXptu','ADMIN');
Insert into SYSTEM.USERS_TBL (GUID,FIRST_NAME,LAST_NAME,PHONE_NUMBER,GENDER,USERNAME,PASSWORD,TYPE) values ('c585d9f6-a967-4790-9461-c4cf52f8a3fd','John','Doe','09062281050','MALE','testuser','$2y$10$pmaZ57LcW1hyrdYb1z2a5uWx/qExvgp.BI1jn8hkb6isZbFGCeSRu','USER');
Insert into SYSTEM.USERS_TBL (GUID,FIRST_NAME,LAST_NAME,PHONE_NUMBER,GENDER,USERNAME,PASSWORD,TYPE) values ('557116f3-3cf0-4945-b2cd-e9594659ed9b','Aczell','Florencio','09062281049','MALE','testuser','$2a$10$5qYYuZmBH90goGj7MvSB6OhhAGMP6lJS00WyUBlrNKAFM.0k0aYr.','USER');
--------------------------------------------------------
--  DDL for Index USERS_TBL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."USERS_TBL_PK" ON "SYSTEM"."USERS_TBL" ("GUID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger USERS_TBL_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."USERS_TBL_TRG" 
BEFORE INSERT ON USERS_TBL 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SYSTEM"."USERS_TBL_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS_TBL
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."USERS_TBL" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERS_TBL" ADD CONSTRAINT "USERS_TBL_PK" PRIMARY KEY ("GUID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."USERS_TBL" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERS_TBL" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERS_TBL" MODIFY ("GENDER" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERS_TBL" MODIFY ("PHONE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERS_TBL" MODIFY ("LAST_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERS_TBL" MODIFY ("FIRST_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERS_TBL" MODIFY ("GUID" NOT NULL ENABLE);
