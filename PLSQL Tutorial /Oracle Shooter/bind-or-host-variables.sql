--====================================================
1. How to use and pass Bind Variables
--====================================================
Variables
1. User Variables
2. Bind Variables / Host variables/ Global Variables

--====================================================
Example:-  1. User Variables ( here i am using TOAD)
--====================================================

DECLARE
V_NAME VARCHAR2(100) := 'Oracle Shooter';

BEGIN

dbms_output.put_line ('My Name is :- '||V_NAME);

EXCEPTION WHEN OTHERS THEN
dbms_output.put_line (SQLERRM);
END;

--====================================================
Example:-  2. Bind Variables / Host variables
--====================================================

--============ SQL Developer --============
VARIABLE  V_NAME VARCHAR2(100);

--------
Way_1. :-
--------
EXEC :V_NAME := 'Oracle Shooter';

--------
Way_2. :-
--------
BEGIN
:V_NAME := 'Oracle Shooter';
END;

--============ Toad For Oracle --============


BEGIN

dbms_output.put_line ('My Name is :- '||:V_NEW_NAME);

EXCEPTION WHEN OTHERS THEN
dbms_output.put_line (SQLERRM);
END;