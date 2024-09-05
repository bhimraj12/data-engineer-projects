--====================================================

1. Basic LOOP Statement
    EXIT Statement
    EXIT WHEN Statement
    CONTINUE Statement
    CONTINUE WHEN Statement
2. WHILE LOOP Statement
3. FOR LOOP Statement
4. Cursor Loop


--====================================================
You have to Know this Cooncept
Example :-  FOR LOOP Index with Same Name as Declared Variable
--====================================================

DECLARE
  i NUMBER := 5;
 
BEGIN

  FOR i IN 1..3 LOOP
    DBMS_OUTPUT.PUT_LINE ('Inside loop, i is ' || TO_CHAR(i));
  END LOOP;
 
  DBMS_OUTPUT.PUT_LINE ('Outside loop, i is ' || TO_CHAR(i));
 
END;


 --output
Inside loop, i is 1
Inside loop, i is 2
Inside loop, i is 3
Outside loop, i is 5



--====================================================
FOR LOOP With Cursor
--====================================================

DECLARE

  CURSOR C1 is  
  SELECT * FROM XXEMP_TL;
 
BEGIN
 
  FOR i IN C1 LOOP
    dbms_output.put_line ( I.ENAME);
  END LOOP;

END;
  --output


Smith
Allen
Ward
Jones
MARTIN
BLAKE
CLARK
Scott
KING
TURNER
ADAMS
James
FORD
MILLER

Rani 
--====================================================

DECLARE
  v_employees XXEMP_TL%ROWTYPE;

  CURSOR c1 is
  SELECT * FROM XXEMP_TL;
 
BEGIN
  OPEN c1;
   
  LOOP
  -- Fetch entire row into v_employees record:-
    FETCH c1 INTO v_employees; 
    EXIT WHEN c1%NOTFOUND;
    -- Process data here
    dbms_output.put_line ( v_employees.ENAME);
  END LOOP;
  CLOSE c1;
END;

 --output




Smith
Allen
Ward
Jones
MARTIN
BLAKE
CLARK
Scott
KING
TURNER
ADAMS
James
FORD
MILLER
Rani