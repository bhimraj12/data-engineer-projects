--====================================================
User Defined Record 
--====================================================
Synatx:-

DECLARE

TYPE <TYPE_NAME> IS RECORD (  Col1 DATATYPE(SIZE),
                                                   Col2 DATATYPE(SIZE),
                                                   Col3 DATATYPE(SIZE),
                                                   Col4 DATATYPE(SIZE)
                                                  );


VARIAVLE_NAME  <TYPE_NAME>;

BEGIN

EXCEPTION
END;

--====================================================

select * from XXEMP_TL

V_EMP_TABLE  XXEMP_TL%ROWTYPE;

EMPNO,    ENAME,    JOB,    MGR,    HIREDATE,    SAL,    COMM,    DEPTNO

EMPNO,    ENAME,    DEPTNO

select A.EMPNO, A.ENAME, A.DEPTNO
FROM XXEMP_TL A
WHERE EMPNO = :V_EMPNO;


--========================
Example:-1 :- Based on Single Table
--========================

DECLARE

TYPE XX_EMP_INFO IS RECORD (
                                    EMPNO  XXEMP_TL.EMPNO%TYPE  ,
                                    ENAME XXEMP_TL.ENAME%TYPE ,
                                    DEPTNO XXEMP_TL.DEPTNO%TYPE                             
                                  );


V_EMP_TABLE  XX_EMP_INFO;
   
BEGIN

SELECT  A.EMPNO, A.ENAME, A.DEPTNO
INTO    V_EMP_TABLE.EMPNO, V_EMP_TABLE.ENAME, V_EMP_TABLE.DEPTNO 
FROM XXEMP_TL A
WHERE EMPNO = :V_EMPNO;
   
dbms_output.put_line ('Employee Record :- '||
                                      '  | Emp No : '||V_EMP_TABLE.EMPNO||
                                      '  | Name : '||V_EMP_TABLE.ENAME||
                                      '  | Deptartment : '||V_EMP_TABLE.DEPTNO
                                      );

EXCEPTION when others THEN
    dbms_output.put_line (SQLCODE||' - ERROR MSG :- '||SQLERRM);
END;


--=======================
Example:-2 Based on Multiple Tables
--=======================

select * from XXEMP_TL
select * from XXDEPT_TL

SELECT  A.EMPNO, A.ENAME, B.DEPTNO, B.DNAME
FROM XXEMP_TL A, XXDEPT_TL B
WHERE A.DEPTNO = B.DEPTNO
AND EMPNO = :V_EMPNO;


--=================================


DECLARE

TYPE XX_EMP_TYPE IS RECORD (
                                    EMPNO  XXEMP_TL.EMPNO%TYPE  ,
                                    ENAME XXEMP_TL.ENAME%TYPE ,
                                    DEPTNO XXDEPT_TL.DEPTNO%TYPE , 
                                    DNAME XXDEPT_TL.DNAME%TYPE
                                  );


V_EMP_TABLE  XX_EMP_TYPE;
   
BEGIN

SELECT  A.EMPNO, A.ENAME, B.DEPTNO, B.DNAME
INTO    V_EMP_TABLE.EMPNO, V_EMP_TABLE.ENAME, V_EMP_TABLE.DEPTNO, V_EMP_TABLE.DNAME 
FROM XXEMP_TL A, XXDEPT_TL B
WHERE A.DEPTNO = B.DEPTNO
AND EMPNO = :V_EMPNO;
   
dbms_output.put_line ('Employee Record :- '||
                                      '  | Emp No : '||V_EMP_TABLE.EMPNO||
                                      '  | Name : '||V_EMP_TABLE.ENAME||
                                      '  | Deptartment : '||V_EMP_TABLE.DEPTNO||
                                      '  | Dept name : '||V_EMP_TABLE.DNAME);

EXCEPTION when others THEN
    dbms_output.put_line (SQLCODE||' - ERROR MSG :- '||SQLERRM);
END;



--====================================================
--Advantages
--====================================================
1. it support multi table columns ( because it is defined by user)
2. It saves memory :- which is used by our variables
3. it also reduce the no of variable declaration which we declare.
4. it is totally user defined :- record Structure with user defined columns only

--====================================================
--Disadvantages
--====================================================

1. We have to write more lines of code
2. that decrease our program performance
3. some limitation in each variables all things are depends on our requirement
