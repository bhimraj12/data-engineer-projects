--====================================================
Simple Variable
1. Explicit Declaration
Ex:- V_NAME VARCHAR2(100);

2. Implicit Declaration
Ex:- V_NAME XXEMP_TL.ENAME%TYPE;

--====================================================
--Here we can store only one value. but if we waann to store multiple value in one variable
Composite Variable OR Table based Record Variable
--====================================================
Synatx:- Variable_Name Table_Name%RowType

Size of :- total size of all columns
DataType:- Table type

--====================================================

select * from XXEMP_TL

--========
Example:-1
--========

DECLARE
    V_EMPNO VARCHAR(5);
    V_ENAME VARCHAR(50);
    V_JOB VARCHAR(30);
    V_MGR VARCHAR(5);
    V_HIREDATE DATE;
    V_SAL NUMBER;
    V_COMM NUMBER;
    V_DEPTNO NUMBER;
   
BEGIN

SELECT  EMPNO, ENAME , JOB , MGR , HIREDATE , SAL , COMM , DEPTNO
INTO   V_EMPNO, V_ENAME , V_JOB , V_MGR , V_HIREDATE , V_SAL , V_COMM , V_DEPTNO
FROM XXEMP_TL
WHERE EMPNO = :V_EMPNO;
   
dbms_output.put_line ('Employee Record :- '||
                                      ' | Emp No : '||V_EMPNO||
                                      '  | Name : '||V_ENAME||
                                      '  | Designation : '||V_JOB||
                                      '  | Manager : '||V_MGR||
                                      '  | Hire Date : '||V_HIREDATE||
                                      '  | Salary : '||V_SAL||
                                      '  | Comm : '||V_COMM||
                                      '  | Deptartment : '||V_DEPTNO);

EXCEPTION when others THEN
    dbms_output.put_line (SQLCODE||' - ERROR MSG :- '||SQLERRM);
END;

--========
Example:-2
--========


DECLARE

V_EMP_TABLE  XXEMP_TL%ROWTYPE;
   
BEGIN

SELECT  EMPNO, ENAME , JOB , MGR , HIREDATE , SAL , COMM , DEPTNO
INTO   V_EMP_TABLE.EMPNO, V_EMP_TABLE.ENAME , V_EMP_TABLE.JOB , V_EMP_TABLE.MGR , V_EMP_TABLE.HIREDATE ,
V_EMP_TABLE.SAL , V_EMP_TABLE.COMM , V_EMP_TABLE.DEPTNO
FROM XXEMP_TL
WHERE EMPNO = :V_EMPNO;
   
dbms_output.put_line ('Employee Record :- '||
                                      ' | Emp No : '||V_EMP_TABLE.EMPNO||
                                      '  | Name : '||V_EMP_TABLE.ENAME||
                                      '  | Designation : '||V_EMP_TABLE.JOB||
                                      '  | Manager : '||V_EMP_TABLE.MGR||
                                      '  | Hire Date : '||V_EMP_TABLE.HIREDATE||
                                      '  | Salary : '||V_EMP_TABLE.SAL||
                                      '  | Comm : '||V_EMP_TABLE.COMM||
                                      '  | Deptartment : '||V_EMP_TABLE.DEPTNO);

EXCEPTION when others THEN
    dbms_output.put_line (SQLCODE||' - ERROR MSG :- '||SQLERRM);
END;

--====================================================
--Advantages
--====================================================
1. it decrease the coding lines
2. it increase the program performance

--====================================================
--Disadvantages
--====================================================
1. it Increase the coding lines for declaring the multi variables
2. it decrease the program performance
3. It increase the Program timing
4. by using %ROWTYPE we can not store perticular column value

