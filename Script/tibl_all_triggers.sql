--Org Info Trigger
CREATE OR REPLACE TRIGGER TRG_Org_info
    BEFORE INSERT OR UPDATE
    ON org_info
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    v_orginfo   NUMBER;
    v_bank_code NUMBER;
BEGIN
    IF INSERTING
    THEN
        SELECT NVL (MAX (ORG_ID), 0) + 1 INTO v_orginfo FROM org_info; --organization id increament by one
        :NEW.ORG_ID  := v_orginfo;
        SELECT NVL (MAX (bank_code), 101) + 100 INTO v_bank_code FROM org_info; --Bank code is three digits increment by 100
        :new.bank_code := v_bank_code;
        :NEW.INSERT_DATE := TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'),'DDMMYYHH24:MI:SS');
    ELSIF UPDATING    THEN
        :NEW.UPDATE_DATE :=TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'), 'DDMMYYHH24:MI:SS');
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_User_info
    BEFORE INSERT OR UPDATE
    ON USER_INFO
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    v_USER_ID  NUMBER;
BEGIN
    IF INSERTING
    THEN
        SELECT NVL (MAX (USER_ID), 0) + 1 INTO v_USER_ID FROM USER_INFO;
        :NEW.USER_ID  := v_USER_ID;
        :NEW.INSERT_DATE := TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'),'DDMMYYHH24:MI:SS');
    ELSIF UPDATING    THEN
        :NEW.UPDATE_DATE :=TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'), 'DDMMYYHH24:MI:SS');
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_NOMINEE_INFO
    BEFORE INSERT OR UPDATE
    ON NOMINEE_INFO
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    v_NOMINEE_ID  NUMBER;
BEGIN
    IF INSERTING
    THEN
        SELECT NVL (MAX (NOMINEE_ID), 0) + 1 INTO v_NOMINEE_ID FROM NOMINEE_INFO;

        :NEW.NOMINEE_ID  := v_NOMINEE_ID;
        :NEW.INSERT_DATE := TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'),'DDMMYYHH24:MI:SS');
    ELSIF UPDATING    THEN
        :NEW.UPDATE_DATE :=TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'), 'DDMMYYHH24:MI:SS');
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_LOC_TYPE
    BEFORE INSERT OR UPDATE
    ON LOC_TYPE
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    v_LOCTYP_SL  NUMBER;
BEGIN
    IF INSERTING
    THEN
        SELECT NVL (MAX (LOCTYP_SL), 0) + 1 INTO v_LOCTYP_SL FROM LOC_TYPE;

        :NEW.LOCTYP_SL  := v_LOCTYP_SL;
        :NEW.INSERT_DATE := TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'),'DDMMYYHH24:MI:SS');
    ELSIF UPDATING    THEN
        :NEW.UPDATE_DATE :=TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'), 'DDMMYYHH24:MI:SS');
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_LOC_TREE
    BEFORE INSERT OR UPDATE
    ON LOC_TREE
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    v_LOC_SL  NUMBER;
BEGIN
    IF INSERTING
    THEN
        SELECT NVL (MAX (LOC_SL), 0) + 1 INTO v_LOC_SL FROM LOC_TREE;

        :NEW.LOC_SL  := v_LOC_SL;
        :NEW.INSERT_DATE := TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'),'DDMMYYHH24:MI:SS');
    ELSIF UPDATING    THEN
        :NEW.UPDATE_DATE :=TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'), 'DDMMYYHH24:MI:SS');
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_HOLIDAY_LIST
    BEFORE INSERT OR UPDATE
    ON HOLIDAY_LIST
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    v_HOLIDAY_ID  NUMBER;
BEGIN
    IF INSERTING
    THEN
        SELECT NVL (MAX (HOLIDAY_ID), 0) + 1 INTO v_HOLIDAY_ID FROM HOLIDAY_LIST;

        :NEW.HOLIDAY_ID  := v_HOLIDAY_ID;
        :NEW.INSERT_DATE := TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'),'DDMMYYHH24:MI:SS');
    ELSIF UPDATING    THEN
        :NEW.UPDATE_DATE :=TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'), 'DDMMYYHH24:MI:SS');
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_CLIENT_SIGNATURE
    BEFORE INSERT OR UPDATE
    ON CLIENT_SIGNATURE
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW

BEGIN
    IF INSERTING
    THEN
        :NEW.INSERT_DATE := TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'),'DDMMYYHH24:MI:SS');
    ELSIF UPDATING    THEN
        :NEW.UPDATE_DATE :=TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'), 'DDMMYYHH24:MI:SS');
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_CLIENT_ID
    BEFORE INSERT OR UPDATE
    ON CLIENT_INFO
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    v_CLIENT_ID  NUMBER;
BEGIN
    IF INSERTING
    THEN
        SELECT NVL (MAX (CLIENT_ID), 40000) + 1 INTO v_CLIENT_ID FROM CLIENT_INFO;
        :NEW.CLIENT_ID  := v_CLIENT_ID;
        :NEW.INSERT_DATE := TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'),'DDMMYYHH24:MI:SS');
    ELSIF UPDATING    THEN
        :NEW.UPDATE_DATE :=TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'), 'DDMMYYHH24:MI:SS');
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_CHART_OF_ACCOUNT
    BEFORE INSERT OR UPDATE
    ON CHART_OF_ACCOUNT
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    v_GL_ID  NUMBER;
BEGIN
    IF INSERTING
    THEN
        SELECT NVL (MAX (GL_ID), 0) + 1 INTO v_GL_ID FROM CHART_OF_ACCOUNT;
        :NEW.GL_ID  := v_GL_ID;
        :NEW.INSERT_DATE := TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'),'DDMMYYHH24:MI:SS');
    ELSIF UPDATING    THEN
        :NEW.UPDATE_DATE :=TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'), 'DDMMYYHH24:MI:SS');
    END IF;
END;


CREATE OR REPLACE TRIGGER TRG_BRANCH_OPEN_CLOSE
    BEFORE INSERT OR UPDATE
    ON BRANCH_OPEN_CLOSE
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    v_BRANCH_OPENCLOSE_ID  NUMBER;
BEGIN
    IF INSERTING
    THEN
        SELECT NVL (MAX (BRANCH_OPENCLOSE_ID), 0) + 1 INTO v_BRANCH_OPENCLOSE_ID FROM BRANCH_OPEN_CLOSE;

        :NEW.BRANCH_OPENCLOSE_ID  := v_BRANCH_OPENCLOSE_ID;
        :NEW.INSERT_DATE := TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'),'DDMMYYHH24:MI:SS');
    ELSIF UPDATING    THEN
        :NEW.UPDATE_DATE :=TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'), 'DDMMYYHH24:MI:SS');
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_BRANCH_INFO
    BEFORE INSERT OR UPDATE
    ON BRANCH_INFO
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    v_BRANCH_ID  NUMBER;
    v_branch_code number;
BEGIN
    IF INSERTING
    THEN
        SELECT NVL (MAX (BRANCH_ID), 1) + 1 INTO v_BRANCH_ID FROM BRANCH_INFO;
        :NEW.BRANCH_ID  := v_BRANCH_ID;
        SELECT NVL (MAX (branch_code), 2000) + 1 INTO v_branch_code FROM BRANCH_INFO;
        :new.branch_code := v_branch_code;
        :NEW.INSERT_DATE := TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'),'DDMMYYHH24:MI:SS');
    ELSIF UPDATING    THEN
        :NEW.UPDATE_DATE :=TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'), 'DDMMYYHH24:MI:SS');
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_ACCOUNT_TYPE
    BEFORE INSERT OR UPDATE
    ON ACCOUNT_TYPE
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    v_ACC_TYPE_ID NUMBER;
BEGIN
    IF INSERTING
    THEN
        SELECT NVL (MAX (ACC_TYPE_ID), 300) + 1 INTO v_ACC_TYPE_ID FROM ACCOUNT_TYPE;
        :NEW.ACC_TYPE_ID  := v_ACC_TYPE_ID;
        :NEW.INSERT_DATE := TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'),'DDMMYYHH24:MI:SS');
    ELSIF UPDATING    THEN
        :NEW.UPDATE_DATE :=TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'), 'DDMMYYHH24:MI:SS');
    END IF;
END;


CREATE OR REPLACE TRIGGER TRG_ACCOUNT_MASTER
    BEFORE INSERT OR UPDATE
    ON ACCOUNT_MASTER
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    v_ACCOUNT_ID NUMBER;
    v_bank_code number;
    v_BRANCH_code number;
    v_ACC_TYPE_ID number;
    v_account_number number;
BEGIN
    IF INSERTING
    THEN
        SELECT NVL (MAX (ACCOUNT_ID), 50000) + 1 INTO v_ACCOUNT_ID FROM ACCOUNT_MASTER;
        :NEW.ACCOUNT_ID  := v_ACCOUNT_ID;

        SELECT MAX(bank_code) INTO v_bank_code FROM org_info;
        SELECT MAX(BRANCH_code) INTO v_BRANCH_code FROM BRANCH_INFO;
        SELECT MAX(ACC_TYPE_ID) INTO v_ACC_TYPE_ID FROM ACCOUNT_TYPE;
        v_account_number := v_bank_code || v_BRANCH_code || v_ACC_TYPE_ID || v_ACCOUNT_ID;
        --Combine 3 Digit of Bank + 4 Digit of Branch Code + 3 Digit of Account type + 5 Digit of account id results 15 DIGIT OF ACCOUNT NUMBER
        :NEW.ACCOUNT_NUMBER := v_account_number;
        :NEW.INSERT_DATE := TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'),'DDMMYYHH24:MI:SS');
    ELSIF UPDATING    THEN
        :NEW.UPDATE_DATE :=TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'), 'DDMMYYHH24:MI:SS');
    END IF;
END;


CREATE OR REPLACE TRIGGER TRG_SERVICE_CHARGE_LIMIT
    BEFORE INSERT OR UPDATE
    ON SERVICE_CHARGE_LIMIT
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    v_CHARGE_ID NUMBER;
BEGIN
    IF INSERTING
    THEN
        SELECT NVL (MAX (CHARGE_ID), 0) + 1 INTO v_CHARGE_ID FROM SERVICE_CHARGE_LIMIT;

        :NEW.CHARGE_ID  := v_CHARGE_ID;
        :NEW.INSERT_DATE := TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'),'DDMMYYHH24:MI:SS');
    ELSIF UPDATING    THEN
        :NEW.UPDATE_DATE :=TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'), 'DDMMYYHH24:MI:SS');
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_TRAIL_BALANCE
    BEFORE INSERT OR UPDATE
    ON TRAIL_BALANCE
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    v_TRIAL_ID NUMBER;
BEGIN
    IF INSERTING
    THEN
        SELECT NVL (MAX (TRIAL_ID), 0) + 1 INTO v_TRIAL_ID FROM TRAIL_BALANCE;

        :NEW.TRIAL_ID  := v_TRIAL_ID;
        :NEW.INSERT_DATE := TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'),'DDMMYYHH24:MI:SS');
    ELSIF UPDATING    THEN
        :NEW.UPDATE_DATE :=TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'), 'DDMMYYHH24:MI:SS');
    END IF;
END;

CREATE OR REPLACE TRIGGER TRG_TRANSACTION
    BEFORE INSERT OR UPDATE
    ON TRANSACTION
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    v_Transaction_id NUMBER;
    v_Transaction_sl NUMBER;

BEGIN
    IF INSERTING THEN
        SELECT NVL (MAX (Transaction_sl), 0) + 1 INTO v_Transaction_sl from transaction;
        :NEW.Transaction_sl  := v_Transaction_sl;
        v_Transaction_id := to_number(to_char(sysdate, 'mmyyss'))+v_Transaction_sl;
        :NEW.Transaction_id  := v_Transaction_id;

        :NEW.INSERT_DATE := TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'),'DDMMYYHH24:MI:SS');
    ELSIF UPDATING    THEN
        :NEW.UPDATE_DATE :=TO_DATE (TO_CHAR (SYSDATE, 'DDMMYYHH24:MI:SS'), 'DDMMYYHH24:MI:SS');
    END IF;
END;



------------------------------------------------
declare 
v_count number;
begin
  select count(1) into v_count from HOLIDAY_LIST where '21-FEB-2023' = to_char(holiday_date, 'DD-MON-YYYY');
  if v_count => 1 ThEn 
    dbms_output.put_line(SYSDATE||' is a holiday!');
  elsif
----Code Here
  end if;
   dbms_output.put_line(v_count);
end;
/
