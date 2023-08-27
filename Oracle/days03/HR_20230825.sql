
SELECT DEPTNO, ENAME, HIREDATE, SAL, COMM
        , SAL + COMM PAY
FROM emp
ORDER BY DEPTNO ASC, PAY DESC;


SELECT *
FROM SCOTT.emp; -- 접근 권한이 없음
-- ORA-00942: table or view does not exist

SELECT SYSDATE, CURRENT_DATE --함수
FROM dual;

-------------------------------------------
SELECT *
FROM arirang; --ORA-00942: table or view does not exist HR은 사용하지 못함
--HR 계정이 SCOTT 소유자로부터 emp 테이블에 SELECT 할 수 있는 권한을 부여받아야 한다.



