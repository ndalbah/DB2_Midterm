SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    TYPE T_EMP_REC IS RECORD (
        V_JOBID EMPLOYEE.JOB_ID%TYPE,
        V_JOBTITLE JOB.FUNCTION%TYPE,
        V_MAXSALARY EMPLOYEE.SALARY%TYPE,
        V_MINSALARY EMPLOYEE.SALARY%TYPE
    );
    TYPE TEmpList IS TABLE OF T_EMP_REC;
    V_EMPLIST TEmpList;
    V_MAXALL NUMBER:=0;
    V_MINALL NUMBER:=0;
    
BEGIN
    SELECT EMPLOYEE.JOB_ID, JOB.FUNCTION, MAX(EMPLOYEE.SALARY), MIN(EMPLOYEE.SALARY)
    BULK COLLECT INTO V_EMPLIST 
    FROM EMPLOYEE
    JOIN JOB ON EMPLOYEE.JOB_ID = JOB.JOB_ID
    GROUP BY EMPLOYEE.JOB_ID, JOB.FUNCTION;
    DBMS_OUTPUT.PUT_LINE('========================================================');
    DBMS_OUTPUT.PUT_LINE('Job ID       Job Title      Max. Salary    Min. Salary');
    DBMS_OUTPUT.PUT_LINE('========================================================');

    FOR I IN V_EMPLIST.FIRST .. V_EMPLIST.LAST LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD(V_EMPLIST(I).V_JOBID,15,' ') || 
        RPAD(V_EMPLIST(I).V_JOBTITLE,15,' ')||
        RPAD(V_EMPLIST(I).V_MAXSALARY,15,' ')||
        RPAD(V_EMPLIST(I).V_MINSALARY,15,' '));

         IF V_EMPLIST(I).V_MAXSALARY > V_MAXALL THEN
            V_MAXALL := V_EMPLIST(I).V_MAXSALARY;
        END IF;
        IF V_EMPLIST(I).V_MINSALARY < V_MINALL OR V_MINALL = 0 THEN
            V_MINALL := V_EMPLIST(I).V_MINSALARY;
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('========================================================');
    DBMS_OUTPUT.PUT_LINE('Minimum of all min above: ' || V_MINALL);
    DBMS_OUTPUT.PUT_LINE('Maxiumum of all max above: ' || V_MAXALL);
    DBMS_OUTPUT.PUT_LINE('========================================================');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
