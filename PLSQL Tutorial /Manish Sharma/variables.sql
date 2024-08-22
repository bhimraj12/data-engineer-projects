SET SERVEROUTPUT ON;
DECLARE
    v_test Varchar(15);
Begin
    v_test := 'RebellionRider';
    DBMS_OUTPUT.PUT_LINE(v_test);
END;