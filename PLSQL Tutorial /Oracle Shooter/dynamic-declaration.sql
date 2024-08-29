--========
Example:-1 -- ( Simple Assignment )
--========

DECLARE
    V_NAME VARCHAR(30) := 'I am from DECLARE Section';

BEGIN
    dbms_output.put_line ('Stage-1 :- '||V_NAME);
       
     V_NAME := 'I am from BEGIN Section';
   
    dbms_output.put_line ('Stage-2 :- '||V_NAME);
    
    V_NAME := ' FOOOOOOOOOOOOOOOOOOOOOOOOOOR Exception ';

EXCEPTION when others THEN
V_NAME := 'I am from EXCEPTION Section';
    dbms_output.put_line ('Stage-3 :- '||V_NAME);
   
END;

--========
Example:-2 -- ( How to Assign value by using INTO keword )
NOTE:- we can no do this in declare section
--========

select * from XXEMP_TL
--========
-- use INTO keyword for Single Assignment 
--========

DECLARE
    V_NAME VARCHAR(10) ;

BEGIN
   
    SELECT ENAME INTO V_NAME FROM XXEMP_TL WHERE EMPNO =  :V_EMPNO;
    
    dbms_output.put_line ('Employee Name : -  '||V_NAME);

EXCEPTION when others THEN
    dbms_output.put_line (SQLCODE||' - ERROR MSG :- '||SQLERRM);
END;

--========
-- use INTO keyword for Multi Assignment 
--========


DECLARE
    V_NAME VARCHAR2(100);
    V_SAL NUMBER;

BEGIN

    SELECT ENAME, SAL INTO V_NAME, V_SAL  FROM XXEMP_TL WHERE EMPNO =  :V_EMPNO;
   
    dbms_output.put_line ('Employee Name : -  '||V_NAME || '           and Salary is :- '|| V_SAL);

EXCEPTION when others THEN
    dbms_output.put_line (SQLCODE||' - ERROR MSG :- '||SQLERRM);
END;
