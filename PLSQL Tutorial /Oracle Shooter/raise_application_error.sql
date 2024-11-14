2.  User-Defined Exceptions

--====================================================
SQLCODE returns the number of the last encountered error.
SQLERRM returns the  message associated with its error-number argument.


--====================================================
 EXCEPTION Raise thru ( RAISE_APPLICATION_ERROR )
--====================================================

--==================================
1/0 = ZERO_DIVIDE       -1476
ORA-01476: divisor is equal to zero
--==================if we are NOT using EXCEPTION handeler =====================

DECLARE
V_Total_Qty   NUMBER := 100;
V_Count_Of_Person  NUMBER := 0;
V_Per_distrib_Qty      NUMBER;

ZERO_DIVISER EXCEPTION;

BEGIN

    If  V_Count_Of_Person = 0 THEN
    RAISE ZERO_DIVISER;
    ELSE
      V_Per_distrib_Qty := V_Total_Qty / V_Count_Of_Person; 
    END IF;
END;



--==================if we are using EXCEPTION handeler =====================

DECLARE
V_Total_Qty   NUMBER := 100;
V_Count_Of_Person  NUMBER := 0;
V_Per_distrib_Qty      NUMBER;

ZERO_DIVISER EXCEPTION;

BEGIN

    If  V_Count_Of_Person = 0 THEN
    RAISE ZERO_DIVISER;
    ELSE
      V_Per_distrib_Qty := V_Total_Qty / V_Count_Of_Person; 
    END IF;

EXCEPTION

WHEN ZERO_DIVISER THEN
dbms_output.put_line('SQLCODE: '|| SQLCODE);
dbms_output.put_line('SQLERRM: '|| SQLERRM);

END;

OUTPUT:-

SQLCODE: 1
SQLERRM: User-Defined Exception

--==================if we are NOT using EXCEPTION handeler =====================

DECLARE
V_Total_Qty   NUMBER := 100;
V_Count_Of_Person  NUMBER := 0;
V_Per_distrib_Qty      NUMBER;


BEGIN

If  V_Count_Of_Person = 0 THEN
RAISE_APPLICATION_ERROR (-20008, 'You are not authorized for vote you are below 18 years');

ELSE
  V_Per_distrib_Qty := V_Total_Qty / V_Count_Of_Person; 
END IF;

EXCEPTION

WHEN OTHERS THEN
dbms_output.put_line('SQLCODE: '|| SQLCODE);
dbms_output.put_line('SQLERRM: '|| SQLERRM);

END;

--==================if we are using EXCEPTION handeler =====================

DECLARE
V_Total_Qty   NUMBER := 100;
V_Count_Of_Person  NUMBER := 0;
V_Per_distrib_Qty      NUMBER;


BEGIN

If  V_Count_Of_Person = 0 THEN
RAISE_APPLICATION_ERROR (-20008, 'You are not authorized for vote you are below 18 years');

ELSE
  V_Per_distrib_Qty := V_Total_Qty / V_Count_Of_Person; 
END IF;

EXCEPTION

WHEN OTHERS THEN
dbms_output.put_line('SQLCODE: '|| SQLCODE);
dbms_output.put_line('SQLERRM: '|| SQLERRM);

END;

OUTPUT:-
SQLCODE: -20008
SQLERRM: ORA-20008: You are not authorized for vote you are below 18 years.