SET SERVEROUTPUT ON;
DECLARE
-- Normal datatype
    -- v_fname VARCHAR(15);  
-- Anchor datatype
    v_fname employees.first_name%TYPE;
Begin
    SELECT first_name INTO v_fname FROM employees WHERE employee_id = 100;
    DBMS_OUTPUT.PUT_LINE(v_fname);
END;