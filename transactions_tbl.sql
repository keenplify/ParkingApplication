--------------------------------------------------------
--  File created - Monday-May-02-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SYB12_SYSUSERS
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYSTEM"."SYB12_SYSUSERS" 
   (	"DB_ID" NUMBER(10,0), 
	"SUID" NUMBER(10,0), 
	"DB_UID" NUMBER(10,0), 
	"GID" NUMBER(10,0), 
	"NAME" VARCHAR2(256 BYTE), 
	"ENVIRON" VARCHAR2(256 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
REM INSERTING into SYSTEM.SYB12_SYSUSERS
SET DEFINE OFF;
--------------------------------------------------------
--  Constraints for Table SYB12_SYSUSERS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."SYB12_SYSUSERS" MODIFY ("DB_UID" NOT NULL ENABLE);
