
SELECT DEPTNO, ENAME, HIREDATE, SAL, COMM
        , SAL + COMM PAY
FROM emp
ORDER BY DEPTNO ASC, PAY DESC;


SELECT *
FROM SCOTT.emp; -- ���� ������ ����
-- ORA-00942: table or view does not exist

SELECT SYSDATE, CURRENT_DATE --�Լ�
FROM dual;

-------------------------------------------
SELECT *
FROM arirang; --ORA-00942: table or view does not exist HR�� ������� ����
--HR ������ SCOTT �����ڷκ��� emp ���̺� SELECT �� �� �ִ� ������ �ο��޾ƾ� �Ѵ�.



