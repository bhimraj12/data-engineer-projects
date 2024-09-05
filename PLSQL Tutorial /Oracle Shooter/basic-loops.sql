LOOP Statements
Loop statements run the same statements with a series of different values. The loop statements are:
Basic LOOP
FOR LOOP
Cursor FOR LOOP
WHILE LOOP
The statements that exit a loop are:
EXIT
EXIT WHEN
The statements that exit the current iteration of a loop are:
CONTINUE
CONTINUE WHEN
--==================
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
Basic LOOP Statement

    LOOP
      statements
    END LOOP;

--====================================================
Example :- Basic LOOP Statement with EXIT Statement
--====================================================

DECLARE
  x NUMBER := 0;
BEGIN
 
  LOOP
    DBMS_OUTPUT.PUT_LINE ('Inside loop:  x = ' || x);

    x := x + 1;

    IF x > 10 THEN
      EXIT;
    END IF;

  END LOOP;
 
  DBMS_OUTPUT.PUT_LINE(' After loop:  x = ' || TO_CHAR(x));
END;


OUTPUT:-
Inside loop:  x = 0
Inside loop:  x = 1
Inside loop:  x = 2
Inside loop:  x = 3
Inside loop:  x = 4
Inside loop:  x = 5
Inside loop:  x = 6
Inside loop:  x = 7
Inside loop:  x = 8
Inside loop:  x = 9
Inside loop:  x = 10
 After loop:  x = 11





--====================================================
Example :- Basic LOOP Statement with EXIT WHEN Statement
--====================================================

DECLARE
  x NUMBER := 0;
BEGIN
 
  LOOP
    DBMS_OUTPUT.PUT_LINE('Inside loop:  x = ' || x);
    x := x + 1;

    EXIT WHEN x > 10;

  END LOOP;
 
  DBMS_OUTPUT.PUT_LINE('After loop:  x = ' || x);
END;


OUTPUT:-
Inside loop:  x = 0
Inside loop:  x = 1
Inside loop:  x = 2
Inside loop:  x = 3
Inside loop:  x = 4
Inside loop:  x = 5
Inside loop:  x = 6
Inside loop:  x = 7
Inside loop:  x = 8
Inside loop:  x = 9
Inside loop:  x = 10
 After loop:  x = 11




--====================================================
Example :- CONTINUE Statement in Basic LOOP Statement
--====================================================

DECLARE
  x NUMBER := 0;
BEGIN

  LOOP -- After CONTINUE statement, control resumes here
    DBMS_OUTPUT.PUT_LINE ('Inside loop:  x = ' || x);
    x := x + 1;
   
    IF x < 3 THEN
      CONTINUE;
    END IF;
   
    DBMS_OUTPUT.PUT_LINE ('Inside loop, after CONTINUE:  x = ' || x);
    EXIT WHEN x = 5;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE (' After loop:  x = ' || x);
END;

OUTPUT:-
Inside loop:  x = 0
Inside loop:  x = 1
Inside loop:  x = 2
Inside loop, after CONTINUE:  x = 3
Inside loop:  x = 3
Inside loop, after CONTINUE:  x = 4
Inside loop:  x = 4
Inside loop, after CONTINUE:  x = 5
 After loop:  x = 5

--====================================================
Example :- CONTINUE WHEN Statement in Basic LOOP Statement
--====================================================

DECLARE
  x NUMBER := 0;
BEGIN
  LOOP -- After CONTINUE statement, control resumes here
    DBMS_OUTPUT.PUT_LINE ('Inside loop:  x = ' || TO_CHAR(x));
    x := x + 1;
   
    CONTINUE WHEN x < 3;
   
    DBMS_OUTPUT.PUT_LINE ('Inside loop, after CONTINUE:  x = ' || TO_CHAR(x));
   
    EXIT WHEN x = 5;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE (' After loop:  x = ' || TO_CHAR(x));
END;


OUTPUT:-
Inside loop:  x = 0
Inside loop:  x = 1
Inside loop:  x = 2
Inside loop, after CONTINUE:  x = 3
Inside loop:  x = 3
Inside loop, after CONTINUE:  x = 4
Inside loop:  x = 4
Inside loop, after CONTINUE:  x = 5
 After loop:  x = 5

--====================================================
You have to know ablout this
Example:- Nested, Labeled Basic LOOP Statements with EXIT WHEN Statements
--====================================================

DECLARE
  i  NUMBER := 0;
  j  NUMBER := 0;
 
BEGIN
   
    <<outer_loop>>   
    LOOP
        i := i + 1 ;
        J:= 0;
           
        <<inner_loop>>
        LOOP
           
        j := j + 1;
        dbms_output.put_line (i||' -  '||j);
        EXIT inner_loop WHEN (j = 5);  
            
        END LOOP inner_loop;
       
        EXIT outer_loop WHEN (i =5);
    END LOOP outer_loop;
    
END;

OUTPUT:-
1 -  1
1 -  2
1 -  3
1 -  4
1 -  5
2 -  1
2 -  2
2 -  3
2 -  4
2 -  5
3 -  1
3 -  2
3 -  3
3 -  4
3 -  5
4 -  1
4 -  2
4 -  3
4 -  4
4 -  5
5 -  1
5 -  2
5 -  3
5 -  4
5 -  5
