=====================================================
1. Basic LOOP Statement
    EXIT Statement
    EXIT WHEN Statement
    CONTINUE Statement
    CONTINUE WHEN Statement
2. WHILE LOOP Statement
3. FOR LOOP Statement
4. Cursor Loop

--====================================================
WHILE LOOP Statement
 
  WHILE Condition LOOP
    Action perform
    value ++ (Increment)
  END LOOP;
 
=====================================================
Ex:1-

DECLARE
  i  Number:= 0;
 
BEGIN

  WHILE i<5 LOOP
    DBMS_OUTPUT.PUT_LINE ('Loop running time :- '||i);
    i :=i+1; 
  END LOOP;

END;


--OUTPUT

Loop running time :- 0
Loop running time :- 1
Loop running time :- 2
Loop running time :- 3
Loop running time :- 4

--=======
Ex:2-
--=======

DECLARE
  V_START  BOOLEAN := FALSE;
BEGIN

  WHILE V_START LOOP
    DBMS_OUTPUT.PUT_LINE ('This line does not print.');
    V_START := TRUE;  -- This assignment is not made.
  END LOOP;

  WHILE NOT V_START LOOP
    DBMS_OUTPUT.PUT_LINE ('Hello, Oracle Shooter');
    V_START := TRUE;
  END LOOP;

END;

--OUTPUT
Hello, Oracle Shooter
--====================================================
FOR LOOP Statement

  FOR i IN START_INTEGER_VALUE..END_INTEGER_VALUE LOOP
        Action perform
  END LOOP;


 
--====================================================
Example  FOR LOOP Statements


BEGIN
  DBMS_OUTPUT.PUT_LINE ('lower_bound < upper_bound');

  FOR i IN 1..3 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE ('lower_bound = upper_bound');

  FOR i IN 2..2 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE ('lower_bound > upper_bound');

  FOR i IN 3..1 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;

END;

--OUTPUT
lower_bound < upper_bound
1
2
3
lower_bound = upper_bound
2
lower_bound > upper_bound

--====================================================
Example :- Reverse FOR LOOP Statements

  FOR i IN REVERSE START_INTEGER_VALUE..END_INTEGER_VALUE LOOP
        Action perform
  END LOOP;
 
--====================================================

BEGIN
  DBMS_OUTPUT.PUT_LINE ('upper_bound > lower_bound');

  FOR i IN REVERSE 1..3 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE ('upper_bound = lower_bound');

  FOR i IN REVERSE 2..2 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE ('upper_bound < lower_bound');

  FOR i IN REVERSE 3..1 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;
 
END;

--OUTPUT
upper_bound > lower_bound
3
2
1
upper_bound = lower_bound
2
upper_bound < lower_bound
