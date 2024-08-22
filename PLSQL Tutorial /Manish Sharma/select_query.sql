SET SERVEROUTPUT ON;
DECLARE
    v_salary NUMBER(15);
Begin
    SELECT salary INTO v_salary FROM employees WHERE employee_id = 100;
    DBMS_OUTPUT.PUT_LINE(v_salary);
END;

DECLARE
    v_salary NUMBER(15);
    v_fname VARCHAR2(20);
Begin
    SELECT salary,first_name INTO v_salary,v_fname FROM employees WHERE employee_id = 100;
    DBMS_OUTPUT.PUT_LINE(v_fname || 'has salary' || v_salary);
END;