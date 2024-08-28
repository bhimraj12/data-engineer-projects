--====================================================
-- Named Block
--====================================================
--DROP PROCEDURE XX_ADD_PROC

CREATE OR REPLACE PROCEDURE XX_ADD_PROC AS

-- if we use DECLARE then it will be anonymous block
V_EMPNO NUMBER;
V_NAME VARCHAR2(100);
V_JOB VARCHAR2(100);
V_SAL NUMBER;
V_DEPTNO NUMBER;

BEGIN

V_EMPNO := '8888';
V_NAME := 'RAVI';
V_JOB := 'SALESMAN';
V_SAL := 11000;
V_DEPTNO := 10;

dbms_output.put_line ('Empno | '||V_EMPNO);
dbms_output.put_line ('Name | '||V_NAME);
dbms_output.put_line ('Job | '||V_JOB);
dbms_output.put_line ('Salary | '||V_SAL);
dbms_output.put_line ('Department No | '||V_DEPTNO);

--dbms_output.put_line ('Empno | '|| V_EMPNO ||'Name | '|| V_NAME ||'Job | '|| V_JOB || 'Salary | '|| V_SAL ||'Department No | '|| V_DEPTNO);

EXCEPTION 
WHEN OTHERS THEN
dbms_output.put_line (  'We are in Exception so please check your process' );

END; 

--====================================================

BEGIN
XX_ADD_PROC;
END;

select * from all_objects
where object_name = 'XX_ADD_PROC' 