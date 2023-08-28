--SCOTT--
--���� ����
--1. ��������(SUBQUERY)�� ���ؼ� �����ϼ���.
	1) Query�� �ϳ��̻��� ���̺��̳� ��κ��� �����͸� �˻�(retrieve)�ϴ� ������ ���Ѵ�.
   	   �� �� �����ϴ� �ֻ��� ���� SELECT ���� Query(����:����)�� �Ѵ�.
	2) ������ �Ǵٸ� SQL ������ nested�� ���� subquery�� �Ѵ�.
       ��, SQL �� �ӿ� �� �ٸ� SQL���� �־��� �ִ� ����̴�.
	3) main(parent) query
       sub(child) query
	3) main     ����O      sub query : ��� ���� ����(correlated subquery)
                ����X
                
--1-2. �ζ��κ�(inline view)�� ���ؼ� �����ϼ���.
	1)���� ���� ���� 3���� : �ζ��� ��, ��ø(NESTED) ��������, �Ϲݼ�������
	2)FROM���� ��ġ�� ��������
	3)��ġ �������̺�ó�� ���Ǵ� ���������̴�. ALIAS(��Ī) �ο��ؾ� �Ѵ�.

--1-3. WITH ���� ���ؼ� �����ϼ���.
	SELECT �� 7���� �� �ϳ�
	WITH ��Ī AS (��������),... ������ ����

--1-4. emp ���̺���
   pay(sal+comm)  1000 �ʰ�~ 3000 �̸� �޴�  
   30�μ����� ������ ��� ����鸸 
   ename�� �������� �������� �����ؼ� ��ȸ�ϴ� ������ �ۼ��ϼ���.  
    (1) �Ϲ� ���� ���;
SELECT deptno, ename, sal, comm, sal+NVL(comm, 0 ) PAY
FROM emp
WHERE sal + NVL(comm, 0 ) > 1000 AND sal + NVL(comm, 0 ) < 3000
AND deptno != 30
ORDER BY ename;

    (2) inline view ���;
-- FROM(��������)
SELECT E.* -- �������̺��� �ϳ����̱� ������ e ��Ī ���� ����
FROM(
    SELECT deptno, ename, sal, comm, sal+NVL(comm, 0 ) PAY
    FROM emp
    --WHERE deptno != 30
    )e
WHERE e.PAy > 1000 AND e.pay < 3000
ORDER BY ename;

    (3) with �� ���  
WITH E AS(
    SELECT deptno, ename, sal, comm, sal+NVL(comm, 0 ) PAY
    FROM emp
    --WHERE deptno != 30
)
SELECT *
FROM E
WHERE e.PAy > 1000 AND e.pay < 3000
ORDER BY ename;

3. ���ݱ��� ��� [Oracle �Լ�]�� ���� �����ϼ��� .
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename)
FROM emp;
1) UPPER()
2) LOWER()
3) INITCAP()

SELECT name, ssn
,SUBSTR(ssn, 0, 2)
,SUBSTR(ssn, 1, 2)
,SUBSTR(snn, -1, 1)
,SUBSTR(snn, -7)
FROM insa;
4) SUBSTR() ����Ÿ�� CHAR
4-2) EXTRACT() ����Ÿ�� NUMBER

SELECT NVL(comm, 0)
FROM emp;
5) NVL()

SELECT SYSDATE, CURRENT_DATE
FROM dual;
6) SYSDATE, CURRENT_DATE

SELECT -- 5%3
      MOD(5,3)
FROM dual;
7) MOD()

SELECT �� ��ȯ �Լ�
FROM ;
8) TO_CHAR(NUMBER)
   TO_CHAR(DATE)
   TO_CHAR(CHAR����)
   TO_DATE()
   TO_NUMBER()

9) COUNT()
emp ���̺��� job(����)�� ������ ���� ��� ���� �ۼ�.

--ORA-00937: not a single-group group function
SELECT DISTINCT job -- �������� ���ڵ带 �ѷ��ִ� �÷��ε�
      ,COUNT(DISTINCT job) 
      -- count�� �������� ���ڵ尡 ���� �Ѱ��� ���� 1���� Į���� select �Ǵ� �����Լ��̴�.
FROM emp;
-------------------------------------------
-ORA-00936: missing expression
SELECT DISTINCT job 
      ,SELECT COUNT(DISTINCT job) from emp     
FROM emp;
------------------------------------------
--�ݵ�� ���������� ��ȣ �ȿ� �־��ش�
SELECT DISTINCT job 
      ,(SELECT COUNT(DISTINCT job) from emp ) jobcount   
FROM emp;
------------------------------------------ �ϱ��ϱ�

10) CONCAT()
    ||
 ------------------------------------------   
    
3-2. ���ݱ��� ��� ����Ŭ�� ������(operator)�� ��������.  
IS NOT
AND
ALL
ANY
--
���ڿ� ���� ������ ||
��� ������ + - * / MOD()
�������� AND OR NOT
SQL ������ ALL, ANY, SOME, EXISTS, IN, BETWEEN, LIKE, IS, NULL, IS NOT NULL
�� ������ = != ^= <>         > < >= <=
    
    
    
    
 ------------------------------------------ 4������ Ǯ��
SELECT ssn
    , SUBSTR(SSN, 1,2) YEAR
    -- SSN -> ������� ���� (��¥) ����ȯ -> EXTRACT
    -- , EXTRACT(MONTH FROM ��¥) MONTH
    , SUBSTR(SSN, 0,6)
    , TO_DATE(SUBSTR(SSN, 0,6))
    , EXTRACT(MONTH FROM TO_DATE(SUBSTR(SSN, 0,6))) MONTH -- ���ڸ��� 09�� �ƴ϶� 9�̴� �����̱� ������
    , SUBSTR(SSN,-7,1) --����
FROM insa;
 ------------------------------------------   
SELECT ename, hiredate
    , TO_CHAR(hiredate) -- ���ڿ� '80/12/17'
    --, SUBSTR(hiredate, 0, 2) �Ʒ�ó�� ��ȯ�ؼ� ����ϱ�
    , SUBSTR(TO_CHAR(hiredate), 0, 2)
FROM emp;
 ------------------------------------------   
 --4-3)����Ǯ��
 -- + 70��� 12���� ��� ��� LIKE '7_12%'
 --   12���� LIKE '__12'
 --   70��� LIKE '7%'
SELECT name
, SUBSTR(SSN,1,8)||'******' RRN
-- , SUBSTR(SSN,3,2) = '12' --�� 12�ϰ� ������? ��
FROM insa
-- WHERE SUBSTR(SSN,1,2) BETWEEN '70' AND '79' AND MOD(SUBSTR(SSN, -7,1),2) = 1; --���ڻ��
-- LIKE ������ ����غ���
WHERE SSN LIKE '7%' AND MOD(SUBSTR(SSN, -7,1),2) = 1;
-------------------------------------------   
-- 6�� Ǯ��
SELECT ENAME
, NVL(TO_CHAR(MGR),'BOSS') MGR --MGR�� ����Ÿ��!
, NVL(COMM,0) COMM
FROM emp;

-- NVL2 ����غ���
-- NVL2(p1, p2, p3) -- �Ű������� 3��
-- P1�� NULL�� �ƴϸ� P2
-- P1�� NULL�̸�     P3�� �ȴ�
SELECT ENAME
, NVL(TO_CHAR(MGR),'BOSS') MGR
, NVL2(COMM,COMM,0) COMM
FROM emp;
------------------------------------------- 
--6-2)����Ǯ��
SELECT name, tel
FROM insa
WHERE tel IS NULL; --3���� NULL�ΰ� Ȯ��
-- �ڷ��� �ľ��ϱ�
DESC insa;
-- TEL               VARCHAR2(15)  TEL�� ���ڿ��̴�.
SELECT name 
       --,NVL(TEL,'����ó ��� �ȵ�') TEL
       ,NVL2(TEL,TEL,'����ó ��� �ȵ�')TEL
FROM insa
WHERE tel IS NULL;
------------------------------------------- 
--NULLIF() �� �������� ����
-- ��ȯ�� : NULL, �ϳ��� ��
-- � ��쿡 �ٸ��� �ľ�
--  �� ���� ���� ���Ͽ� NULL �Ǵ� �� �� ���� �ϳ��� ����Ѵ�.
-- ù��° ���� �ι�° ���� ���Ͽ� �� ���� ������ NULL�� ����ϰ�, ���� ������ ù��° ���� ����Ѵ�.
�����ġ�
        NULLIF(expr1, expr2)
�̴� CASE ������ ���� ������ ����.
    CASE WHEN expr1 = expr2 THEN NULL ELSE expr1 END
;

SELECT ename
       , NULLIF( ename, 'SMITH')
FROM emp;
-------------------------------------------
--COALESCE �յ�(����,����)�ϴ�.
SELECT sal, comm
      ,SAL + NVL(COMM, 0) pay
      ,SAL + NVL2(COMM, COMM, 0) PAY --NVL2 ���
      -- , COALESCE (P1,P2,P3,P4,P5..) -- ó������ NULL�� �ƴѰ��� ������ ���
      , COALESCE (SAL + COMM, SAL, 0 ) PAY -- SAL+COMM�� NULL�̸� SAL�̰� SAL�� NULL�̸� 0
FROM emp;
-------------------------------------------
-- 6-3) ���� Ǯ��
SELECT NUM, NAME
      -- , NVL (TEL, 'X')
      -- , NVL2 (TEL, 'O', 'X')
FROM insa;
-------------------------------------------
--6-4)
SELECT name, ssn
    ,SUBSTR(ssn, -7, 1) gender
    ,MOD(TO_NUMBER(SUBSTR (ssn, -7,1)),2) gender
    ,MOD(SUBSTR(ssn, -7,1),2) gender
    ,NULLIF(MOD(SUBSTR(ssn,-7,1),2), 1 ) gender
    ,NVL2(NULLIF (MOD (SUBSTR(SSN,-7,1),2),1), '����', '����') gender
FROM insa;
-------------------------------------------
SELECT SYSDATE
    , TO_CHAR(SYSDATE, 'CC') --21����
    , TO_CHAR(SYSDATE, 'SCC') --21����
FROM dual;
-------------------------------------------
-- '05/01/10' -- ��¥X ���ڿ�O
SELECT '05/01/10' -- ��¥X ���ڿ�O
FROM dual;
-------------------------------------------ora_help �� to_char �˻��ؼ� ����
SELECT '05/01/10'
    ,TO_DATE('05/01/10', 'RR/MM/DD')--��¥�� ��ȯ
    ,TO_CHAR(TO_DATE('05/01/10', 'RR/MM/DD'), 'YYYY')RR --2005
    ,TO_CHAR(TO_DATE('05/01/10', 'YY/MM/DD'),'YYYY') YY --2005
    
    ,TO_CHAR(TO_DATE('97/01/10', 'RR/MM/DD'), 'YYYY')RR --1997
    ,TO_CHAR(TO_DATE('97/01/10', 'YY/MM/DD'),'YYYY') YY --2097 
FROM dual;
-- 'RR/MM/DD' RR�� 50~00������ ���Ⱑ 1900�� ����
SELECT ename, hiredate
    , TO_CHAR (hiredate, 'YYYY') year -- ����>������ 'RR/MM/DD' ���·� ����Ǿ� ���� 
FROM EMP;
--------------------------------------------------------------------
7. RR�� YY�� ������
RR�� YY�� �Ѵ� �⵵�� ������ ���ڸ��� ����� ������, 
���� system���� ����� ��Ÿ������ �ϴ� �⵵�� ���⸦ ���� ���� �� ��µǴ� ���� �ٸ���.
RR�� �ý��ۻ�(1900���)�� �⵵�� �������� �Ͽ� ���� 50�⵵���� ���� 49������� ���س⵵�� ����� 1850�⵵���� 1949�⵵������ ������ ǥ���ϰ�, 
�� ������ ���Ƴ� ��� �ٽ� 2100���� �������� ���� 50�⵵���� ���� 49������� ���� ����Ѵ�.
--------------------------------------------------------------------

8. dept ���̺� ��ȸ
SELECT *
FROM DEPT;

8-2. dept ���̺�   deptno = 50,  dname = QC,  loc = SEOUL  �� ���ο� �μ����� �߰�

INSERT INTO dept(deptno,dname,loc) 
VALUES (50, 'QC', 'SEOUL');
--VALUES ('50', 'QC', 'SEOUL');
--00984. 00000 -  "column not allowed here" SEOUL�� �÷��� ������� �ʴ� ���� �߻�
--������ �ν��ϴ°��� �ƴ϶� �÷����� �ν��ؼ� �߻���

--1 �� ��(��) ���ԵǾ����ϴ�.

DESC dept;

--50�� ''�� �ٿ����� �ڵ����� ����Ÿ������ ��ȯ��
-- to_number('50')

COMMIT;

8-3. dept ���̺� QC �μ��� ã�Ƽ� �μ���(dname)�� ����(loc)�� 
   dname = ����μ��� 2�� �߰�,  loc = POHANG ���� ����
SELECT deptno
FROM dept
WHERE dname = 'QC'; -- 50��

-- 50, 'QC', 'SEOUL'
UPDATE dept
SET dname = CONCAT(dname, '2') -- 2�� ���ڷ� --���� �μ��� 2 �߰�
, loc = 'POHANG'
WHERE deptno = 50;

COMMIT;

SELECT *
FROM DEPT;

SELECT deptno
FROM dept
WHERE DNAME = 'QC2';

DELETE FROM dept--deptno�� ����
WHERE deptno = (SELECT deptno FROM dept WHERE DNAME = 'QC2'); --��ø ��������

WHERE deptno = 50;

commit;

SELECT *
FROM DEPT;
-----------------------------------------
-- REPLACE() ����ϱ�
SELECT name, ssn
     --,gender
FROM insa;
-- �̸� �ӿ� m ���ڸ� �����ϸ� *���� ����
SELECT ename
FROM emp
-- WHERE ename LIKE '%m%'; --m�� �ҹ��� m�̶� �ƹ��͵� �ȶ� -- ��ҹ��� ���о��ϰ� ã������?
-- WHERE ename LIKE '%m%' OR ename LIKE '%M%'; -- ù��° ���
-- WHERE LOWER (ename) LIKE '%m%';
-- WHERE UPPER (ename) LIKE '%M%';
-- WHERE ename LIKE UPPER('%m%'); ���� X �̸��ӿ� �ҹ��� ������ �˻� �ȵ�
-- WHERE ename LIKE CONCAT(CONCAT('%', UPPER('m')),'%');
-- WHERE ename LIKE '%' || 'm' || '%'; --�ϱ�!!!!
WHERE ename LIKE '%' || UPPER('m') || '%'; --�ϱ�!!!! �� �ڵ��� ���� �ڵ�
--
SELECT ename
    ,REPLACE(ename, UPPER('m'), '*')
FROM emp
WHERE ename LIKE '%' || UPPER('m') || '%';
------------------------------------------------
--[����] emp ���̺��� ename 'la' ��ҹ��� ���о��� �ִ� ��� ��ȸ
--                          'la' 'La' 'lA' 'LA'
SELECT ename
FROM emp
WHERE ename LIKE '%la%' OR ename LIKE '%La%'
   OR ename LIKE '%lA%' OR ename LIKE '%LA%';
--
SELECT ename
FROM emp
WHERE REGEXP_LIKE(ename, 'la', 'i'); -- i �ɼ��� ��ҹ��� ���о����� ��Ÿ��
WHERE REGEXP_LIKE(ename, 'LA'); --����ǥ���� ���
WHERE ename LIKE '%la%' OR ename LIKE '%La%'
   OR ename LIKE '%lA%' OR ename LIKE '%LA%';
--
SELECT ename
    , REPLACE (ename, 'LA', '<span style="color:red">LA</span>')
FROM emp
WHERE REGEXP_LIKE(ename, 'la', 'i');
--                              match option : i(��ҹ��� ����X), C(��ҹ��� ����O), m(��Ƽ ����), x(���鹮�� ����)
--
-- LIKE ������ % _ ���ϵ�ī��
-- ����ǥ������ ����� �� �ִ� �Լ�
-- ������ �Լ�(�׷��Լ�)
SELECT COUNT(*) --����� 12�� -- �������� ���ڵ尡 ���� �������� �����ش�--�����Լ�
FROM emp;
-- ������ �Լ�(single row function)
SELECT LOWER(ename) -- �������Լ�
FROM emp;
----------------
-- ORA_HELP�� regexp_like �Լ��� �ִ� ���̺� �߰��ϰ� ����ǥ���� Ȯ���غ�
SELECT *
FROM TEST
WHERE REGEXP_LIKE(name, '^[�ѹ�]');
WHERE REGEXP_LIKE(name, '����$');
----------------------------------
--insa ���̺��� ���� �����
WHERE SSN LIKE '7%' AND MOD(SUBSTR(ssn, -7, 1),2) = 1;

WHERE REGEXP_LIKE (SSN, '^7.{6}[13579]');
--                         . �ƹ����ڳ� 6�� �ǳʶٰ�, �� ������ 13579����?
WHERE REGEXP_LIKE (SSN, '^7\d{5}-[13579]');
-----------------------------------
--[����] insa ���̺��� ���� �达, �̾��� ��ȸ
1) LIKE ���

SELECT *
FROM insa
WHERE name LIKE '��%' OR name LIKE '��%';

2) REGEXP_LIKE()���

SELECT *
FROM insa
WHERE REGEXP_LIKE(name, '^(��|��)');
WHERE REGEXP_LIKE(name, '^[����]');

--[����] insa ���̺��� ���� �达, �̾��� ������ ��ȸ
1) LIKE ���

SELECT *
FROM insa
WHERE NOT (name LIKE '��%' OR name LIKE '��%');

2) REGEXP_LIKE()���

SELECT *
FROM insa
WHERE NOT REGEXP_LIKE(name, '^[^����]');
WHERE NOT REGEXP_LIKE(name, '^[����]');
---------------------------------------
-- 9. �ó��(synonym)�̶�? 
�ϳ��� ��ü�� ���� �ٸ� �̸��� �����ϴ� ���
SQL ������ ����ϴ� ���̺��̳� �÷��� ����� ������ ����
������ �ش� SQL�� �������� ����� �� ������, �ó���� �����ͺ��̽� ��ü���� ����� �� �ִ� ��ü�̴�.

---------------------------------------
--10. emp ���̺��� �޿��� ���� ���� �޴� ����� ������ ��ȸ.
SELECT deptno, empno, ename, sal + NVL(COMM, 0) PAY
FROM emp
ORDER BY PAY DESC;
-- COUNT(),                                MAX(),MIN()
--10	7839	KING	5000




--10-2. emp ���̺��� �޿��� ���� ���� �޴� ����� ������ ��ȸ.
--20	7369	SMITH	800

-- SQL ������ ALL�� ����� Ǯ�� 
WITH temp AS(
SELECT deptno, empno, ename, sal + NVL(COMM, 0) PAY
FROM emp
)
SELECT *
FROM temp
--WHERE pay >= ALL(��� ����� PAY); -- ��� ����麸�� PAY�� ���ų� ũ�� ���� ū ��
WHERE pay >= ALL(SELECT pay FROM temp);

---------------------------------------------------
WITH temp AS(
SELECT deptno, empno, ename, sal + NVL(COMM, 0) PAY
FROM emp
)
SELECT *
FROM temp
WHERE pay <= ALL(SELECT pay FROM temp); --��� ����麸�� ���ų� ������ ���� ������
---------------------------------------------------
--MAX(), MIN() �׷�(����) �Լ�
-- SELECT ���� pay�� ���� ���
SELECT MAX(sal + NVL(comm, 0)) MAX_PAY
        ,MIN (sal + NVL(comm, 0)) MIN_PAY
FROM emp;
--
SELECT deptno, ename, sal + NVL(comm, 0) PAY
FROM emp
WHERE sal + NVL(comm, 0) = (
SELECT MAX(sal + NVL(comm, 0))
FROM emp
);
WHERE sal + NVL(comm, 0) = 5000;
--
-------------------------------
11. 5. ���� �ý����� ��¥ ����ϴ� ������ �ۼ��ϼ���. 
SELECT ( �� ), ( �� ) 
FROM dual;

SELECT SYSDATE CURRENTDATE
FROM DUAL;



---------------------------------------------
-- [���տ�����(Set Operator)]
-- 1) �� ���̺��� Į�� ���� ����
-- 2) �����Ǵ� Į������ ������ Ÿ���� �����ؾ� �Ѵ�.
-- 3) �÷� �̸��� �޶� ��� ������
-- 4) ���� ������ ����� ��µǴ� �÷��� �̸��� ù���� select ���� �÷� �̸��� ������.

-- 5) ������ : UNION, UNION ALL
    --������ : INTERSECT
    --������ : MINUS

-- emp  +  insa �� ���̺��� ���ļ� ��� ��� ������ ��ȸ.
SELECT empno, ename, hiredate --, deptno -- number
FROM emp
UNION
SELECT num, name, ibsadate --, buseo -- varchar2
FROM insa;

------- emp ( ����(join) dept ) +  insa
SELECT empno, ename, hiredate -- , deptno -- number
FROM emp
UNION
SELECT num, name, ibsadate -- , buseo -- varchar2
FROM insa;

SELECT deptno, dname, loc
FROM dept;

--------------------------------------------------
SELECT empno, ename, hiredate --, deptno -- number
FROM emp
UNION ALL
SELECT num, name, ibsadate --, buseo -- varchar2
FROM insa;
--------------------------------------------------
-- [UNION �� UNION ALL�� ������ + INTERSECT,MINUS]

(1) insa ���̺��� ���ߺ� ��ȸ
SELECT name, city, buseo
FROM insa
WHERE buseo = '���ߺ�';

(2) insa ���̺��� ������� : ��õ ��ȸ
SELECT name, city, buseo
FROM insa
WHERE city = '��õ'; -- 9�� ��� ��ȸ (���ߺ� ����� 6��)

--UNION�� ��� : 14�� (�ߺ��� ������ �ѹ��� �߰��ϰ� ���ܵ�)
SELECT name, city, buseo
FROM insa
WHERE city = '��õ' -- 9��
UNION
SELECT name, city, buseo
FROM insa
WHERE buseo = '���ߺ�'; --14��

--UNION ALL�� ��� : 23�� (�ߺ��� �����͵� �߰���)
SELECT name, city, buseo
FROM insa
WHERE city = '��õ' -- 9��
UNION ALL
SELECT name, city, buseo
FROM insa
WHERE buseo = '���ߺ�'; --14��

--INTERSECT�� ��� : 6�� (��õ�̰� ���ߺ��� 6��) ������
SELECT name, city, buseo
FROM insa
WHERE city = '��õ' -- 9��
INTERSECT
SELECT name, city, buseo
FROM insa
WHERE buseo = '���ߺ�'; --14��

--MINUS ��� : 3�� (��õ 9�� - ���ߺ� 6��)
SELECT name, city, buseo
FROM insa
WHERE city = '��õ' -- 9��
-- ORDER BY NAME ���� �������� ��ġ�ؾ� �Ѵ�.
MINUS
SELECT name, city, buseo
FROM insa
WHERE buseo = '���ߺ�'; --14��
ORDER BY name ASC;
----------------------------------------

--[����] insa ���̺��� ����O, ����X

SELECT name, ssn
--,NULLIF( MOD(SUBSTR(SSN, -7,1),2), 1)
      ,NVL2(NULLIF( MOD(SUBSTR(SSN, -7,1),2), 1),'X','O') GENDER
FROM insa;

-- ���տ�����(SET OPERATOR)
UNION -- ALL
1) ���� ��ȸ
SELECT name, ssn, 'O' gender
FROM insa
WHERE MOD(SUBSTR(SSN, -7,1),2) = 1;

2) ���� ��ȸ

SELECT name, ssn, 'X' gender
FROM insa
WHERE MOD(SUBSTR(SSN, -7,1),2) = 0;
---------------------------------
SELECT name, ssn, 'O' gender
FROM insa
WHERE MOD(SUBSTR(SSN, -7,1),2) = 1
UNION
SELECT name, ssn, 'X' gender
FROM insa
WHERE MOD(SUBSTR(SSN, -7,1),2) = 0;
------------------------------------

IS [NOT] NAN == Not A Number 
IS [NOT] INFINITE == ���Ѵ�

------------------------------------
1.����Ŭ���� �Լ��� ����
2.����Ŭ���� �Լ��� ���
3.����Ŭ���� �Լ��� ����
------------------------------------
(1)�����Լ�
    - ROUND(number, �ݿø���ġ ���, ����) �ݿø��Լ�
    - CEIL() �ø��Լ�(�����Լ�)
    - FLOOR() �����Լ�(�����Լ�)
        ��TRUNC() �����Լ�(�����Լ�)
        
    SELECT ROUND(15.193) a --15 �Ҽ��� ù��° �ڸ����� �ݿø�.
        --,ROUND(15.193, 0) --15 �ݿø� ��ġ ���ذͰ� ���� ��ġ 0
        , ROUND(15.193,1) --15.2 �Ҽ��� �ι�° �ڸ����� �ݿø�.
        --, ROUND(15.193,n) -- �Ҽ��� n+1 ��° �ڸ����� �ݿø��Ѵ�.
        , ROUND(19.193,-1) -- 20 ���� �ڸ����� �ݿø�
        , ROUND(15.193,-2) -- ���� �ڸ����� �ݿø�.
    FROM dual;
    
    -- ������ ���ں��� ���ų� ū ���� �߿� �ּڰ�
    SELECT CEIL(15.193) --16
        ,CEIL(15.913) --16
    FROM dual;
    
    -- ������ ���ں��� �۰ų� ���� ���� �߿� �ִ�
    SELECT FLOOR(15.193) --15
        ,FLOOR(15.913) --15
    FROM dual;
    
    - �ݿø� ROUND(), �ø�(����) CEIL(), ����(����) FLOOR()
    - ����(����) �Լ� : FLOOR(), TRUNC(���� ��ġ�� �ָ� ��) ������.
    
    -- 15.193 ���ڸ� �Ҽ��� 2�ڸ����� ���� -- ���� ���ϴ� ��ġ�� �����Ϸ��� �����ؾ���
    SELECT FLOOR(15.8193) --15
        ,FLOOR(15.8193*10)/10 --15.8
        
        ,TRUNC(15.8193) --FLOOR(15.8193) ����
        ,TRUNC(15.8193,1) --FLOOR(15.81*10)/10 ����
        ,TRUNC(15.8193,2) --15.81
        ,TRUNC(15.8193,-1) -- 10 -- ���� �ڸ����� ����
        
    FROM dual;
    
    -- �Ҽ��� ����° �ڸ����� �ݿø��ؼ� �Ҽ��� ���ڸ����� ����϶�.
    SELECT 10/3
    FROM dual;
    --
    SELECT 10/3
        ,ROUND(10/3,2)
    FROM dual;
    ---------------------------------------------------------
    -- ������ MOD(), REMAINDER()
    SELECT MOD(19,4),REMAINDER(19,4)
    FROM dual;
    
    -- MOD(n2, n1)        = n2-n1*FLOOR(n2/n1)
    -- REMAINDER(n2, n1)  = n2-n1*ROUND(n2/n1)
    
    --ABS() ���밪 
    SELECT ABS(100), ABS(-100)
        ,SIGN(100), SIGN(-100)-- 1(�Ű������� ����϶� 1 ��ȯ)  -1(�����϶� -1 ��ȯ)
        ,SIGN(0) --0
        ,POWER(2,3)
        ,SQRT(2)
    FROM dual;
    
    
(2)�����Լ�
    --UPPER()
    --LOWER()
    --INICQP() ù��° ���ڸ� �빮�ڷ� �ٲٴ� �Լ�
    --CONCAT()
    --SUBSTR()
    
    --LENGTH() ���ڿ� ����
    SELECT DISTINCT job
          , LENGTH(job)
    FROM emp;
    
    -- emp ���̺��� ename �� L ���ڰ� �ִ� ����� ��ȸ   
    SELECT ename, job
    FROM emp
    WHERE REGEXP_LIKE( ename , 'l', 'i');
    WHERE ename LIKE '%L%';
    -- L ���ڰ� �ִ� ��ġ���� ��ȸ
    SELECT ename
          , INSTR (ename, 'L')
    FROM emp
    WHERE REGEXP_LIKE( ename , 'l', 'i');
    
    -----------------
    SELECT 
           INSTR('corporate floor','or') --2
          ,INSTR('corporate floor','or',1,3) --14
          ,INSTR('corporate floor','or',-1,3) --2
          ,INSTR('corporate floor','or',4)
          ,INSTR('corporate floor','or',4,2) -- 4��° ���ں��� 2��° �ִ� OR�� ã��
    FROM dual;
    
    -- RPAD / LPAD
    -- Right Left
    -- PAD == �е�, �� ��� ��, �޿� �ִ� ��
    -- ����) RPAD (expr1, n[  , expr2])
      
    SELECT ename, sal + NVL(comm, 0) pay
        -- ,LPAD(sal + NVL(comm, 0), 10, '*')
        -- ,RPAD(sal + NVL(comm, 0), 10, '*')
    FROM emp;
    -----------------------------------------
    --100 ������ #�� ����ϰ� ���� 200 ## 300 ###
    --10�� �������� �ݿø� #
        SELECT ename, sal + NVL(comm, 0) pay
        , ROUND (sal + NVL(comm, 0),-2)
        , ROUND (sal + NVL(comm, 0),-2)/100
        , RPAD(' ', ROUND(sal + NVL(comm, 0),-2)/100 + 1, '#') --(sal + NVL(comm, 0) ��� ' ' ���� --������
        -- +1�� �ƴϰ� 8,19,18�� ..??
    FROM emp;
    -------------------------------------------------------
    
    -- LTRIM(), RTRIM(), TRIM() ���ڰ� �߿��� ����/������ ���� ���� Ư�����ڿ� ��ġ�ϴ� ���ڰ��� �����Ѵ�.
    -- java. String.trim() ��/�� ���� �����ϴ� �Լ�
    -- ��) "    abc    ".trim()    ===>     "abc"
    
    SELECT '['||'   admin   '||']'             --[   admin   ]
        ,'['|| LTRIM('   admin   ') ||']'      --[admin   ]
        ,'['|| RTRIM('   admin   ', ' ') ||']' --[   admin]
        ,'['|| TRIM('   admin   ') ||']'       --[admin]
        
        ,'['|| LTRIM('xyxyadminxyxy','xy') ||']' --[adminxyxy]
        ,'['|| RTRIM('xyxyadminxyxy','xy') ||']' --[xyxyadmin]
    FROM dual;
    -----------------------------------------------------------
    
    SELECT ASCII('A'), ASCII('a'), ASCII('0')
        , CHR(65), CHR(97), CHR(48)
    FROM dual;
    
    -----------------------------------------------------------
    SELECT GREATEST (3,5,2,4,1)
            ,LEAST (3,5,2,4,1)
            ,GREATEST('MBC','TVC','SBS')
    FROM dual;
    -----------------------------------------------------------
    REPLACE() SMITH ���� M�� *�� �ٲٴ°� ������ ����
    -----------------------------------------------------------
    VSIZE() ������ ���ڿ��� ũ�⸦ ���ڷ� ��ȯ�ϴ� �Լ�
    -- ���ĺ��� 1����Ʈ �ѱ��� 3����Ʈ 
    SELECT VSIZE('a'), VSIZE('��')--1  3
    FROM dual;
    -----------------------------------------------------------
    