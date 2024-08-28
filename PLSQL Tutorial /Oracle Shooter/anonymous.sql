SET SERVEROUTPUT ON;


DECLARE
    V_Value1 NUMBER;
    V_Value2 NUMBER;
    V_Total NUMBER;

Begin
V_Value1 := 10;
v_value2 := 20;

v_total := v_value1 + v_value2;
    DBMS_OUTPUT.PUT_LINE('Total : '||v_total);
END;

-- Dynamic anonymous block
DECLARE
    v_value1 NUMBER;
    v_value2 NUMBER;
    v_total NUMBER;

Begin
    v_value1 := &v_value1;
	v_value2 := &v_value2;
	v_total := v_value1 + v_value2;
    DBMS_OUTPUT.PUT_LINE('Total : '||v_total);
END;