SELECT BUSEO,NAME,BASICPAY + SUDANG PAY        
FROM insa
WHERE BASICPAY + SUDANG BETWEEN 2000000 AND 2500000
--WHERE BASICPAY + SUDANG <= 2500000 AND BASICPAY + SUDANG >= 2000000 
ORDER BY BUSEO, NAME ASC, PAY DESC; 

--1) WITH�� ���, ó�� ���� ����ϱ�
with e AS --() ��ȣ�� ������� e�� ������. --with���� ������ ����
(
    SELECT BUSEO,NAME,BASICPAY + SUDANG PAY        
    FROM insa
)
--, d AS 
--(
--    SELECT deptno, dname
--    FROM dept
--)

--SELECT e.*, e.buseo, e.name, e.pay
SELECT buseo, name, pay
FROM e
WHERE pay BETWEEN 2000000 AND 2500000;





--�ζ��� ��(INLINE VIEW)--
--�ζ��� ��� FROM ������ ���������� ����Ͽ� ������ �ӽ� ���̴�.

-- �� : ������ ���� ���̺��̴�.
-- ���̺� : �����͸� �����ϴ� �����̴�. ��� ���� �̷�����ִ�.
SELECT e.*
FROM ( --�ζ��κ�
SELECT BUSEO, NAME, BASICPAY + SUDANG PAY        
    FROM insa
    )e
WHERE (e.pay BETWEEN 2000000 AND 2500000) AND buseo != '�ѹ���';


-- 81/11/17 NLS RR/MM/DD    YY/MM/DD   
-- �ڹ� : hiredate String(���ڿ�) "81/12/20".substirng (0,2).equals("80")
-- ����Ŭ : ���ڿ� �ڷ���              ���� ���� �Լ� = '81'  ==> �ȵ�
--              hiredate�� ��¥��   


-- �ڹ� : hiredate ��¥�� -> �⵵ ����
--       Date d = new Date(); --->�⵵  d.getYear()+1900;
-- ����Ŭ : hiredate ��¥�� -> EXTRACT()�� ����� �⵵ ���� -> 81�⵵���� ��
--                          TO_CHAR()


DESC emp;
-- HIREDATE          DATE  ����Ŭ�� ��¥��     TIMESTAMP


-- ��¥�� --2087 ���� ��µ� �̻���
SELECT empno, ename, hiredate
    ,EXTRACT(year FROM hiredate) h_year
FROM emp;
-- �� ����� �����Ϸ��� ��
--7876	ADAMS	87/05/23	2087
--7788	SCOTT	87/04/19	2087
DML : INSERT, UPDATE, DELETE  + DML�� �ݵ�� TCL���� COMMIT, ROLLBACK�� �����ؾ��Ѵ� 

DELETE FROM ���̺��
[WHERE ������];

DELETE FROM emp; -- WHERE �������� ������ ��� ���ڵ�(��)�� ������
--14�� �� ��(��) �����Ǿ����ϴ�. 
ROLLBACK;
COMMIT; --Ŀ���ϰ� ���� �ѹ� ����.

-- �����Ҷ��� ������ Ű������ �����Ѵ�
DELETE FROM emp
WHERE empno IN(7876,7788);
--2�� �� ��(��) �����Ǿ����ϴ�.

----------------------------------------
SELECT empno, ename, hiredate
    ,EXTRACT(year FROM hiredate) h_year

FROM emp
WHERE TO_CHAR(hiredate, 'YYYY') = 1981   --'1981' �� 1981 ������ ���� �ʰ� ��°���� ������ ���� �ڵ��� �ƴ�
--WHERE TO_CHAR(hiredate, 'YYYY') = '1981'
--WHERE TO_CHAR(hiredate, 'YY') = '81' -- TO_DHAR�� ���ڷ�!
--WHERE EXTRACT (YEAR FROM hiredate) = 1981 --12������ �ι�° Ǯ�� ���
ORDER BY hiredate ASC;
----------------------------------------



-- ���ڿ�
SELECT empno, ename, hiredate
FROM emp
WHERE hiredate BETWEEN '81/1/1' AND '81/12/31';
WHERE hiredate >= '81/1/1'  AND hiredate <= '81/12/31'; --12������ ù��° Ǯ�� ���



-- dual�̶�
DESC dual;
--DUMMYĮ���� ������ �ִ�  VARCHAR2(1) , ���ڵ�� X�� �ϳ� ������ ����

-- FROM�� �ڿ��� ���̺�, ��(�������̺�)�� ����
FROM dual;

-- ���� ��¥�� ��ȸ�Ϸ��� �� 
SELECT SYSDATE; -- SYSDATE()�� ���� ��¥�� ��ȯ���ִ� �Լ����� �Ű������� ��� ()��ȣ ����
--ORA-00923: FROM keyword not found where expected ����
-- ����Ŭ���� SELECT�� FROM���� �ݵ�� �� �ʿ��ϴ�

SELECT SYSDATE
FROM emp; --���ڵ� ������ŭ ��¥�� ��µ�
--�ϳ��� ���ڵ常 ������ �ִ� dual�� ����� ����� ��� �׽�Ʈ �����ϴ�.

SELECT SYSDATE
    ,EXTRACT( YEAR FROM SYSDATE) year
    ,EXTRACT( month FROM SYSDATE) month
    ,EXTRACT( day FROM SYSDATE) day
    
    ,TO_CHAR(SYSDATE, 'YYYY')
    ,TO_CHAR(SYSDATE, 'YY') 
FROM dual; -- �ð��� ������ ������ ��¸� ���� ���� ��


-- SUBSTR �Լ� ����
-- ù��° ��ġ�� 0�̳� 1���� ����
SELECT SUBSTR('abcdesfg', 3,2) --3��° ��ġ���� 2���� �߶�� -- ���� 'cd' ���
        ,SUBSTR('abcdesfg', 3) --'cdesfg' ���
        ,SUBSTR('abcdesfg', -3,2) --'sf'
FROM dual;


-----------------------------------------12������ ����° Ǯ�� ���
SELECT empno, ename, hiredate
    ,EXTRACT(year FROM hiredate) h_year   
FROM emp
WHERE SUBSTR(hiredate, 1,2) = '81'  -- SUBSTR(���ڿ�, ������ġ, ����) DATE Ÿ���� �־ ������ ���� ���� ��?
ORDER BY hiredate ASC;
----------------------------------------

SELECT empno, ename, hiredate
    , EXTRACT(YEAR FROM hiredate) h_year
    , TO_CHAR(hiredate, 'YY')
FROM emp
WHERE TO_CHAR(hiredate, 'YY') = '81'
ORDER BY hiredate;
----------------------------------------




-- [����] insa ���̺��� �̸�, �ֹε�Ϲ�ȣ ��ȸ // �̸�,�ֹε�Ϲ�ȣ,�⵵,��,��,����,���� ��ȸ
-- ������� ����� 721217-1*****
-- SUBSTR �Լ� ����ϱ�

SELECT NAME, SSN
        , CONCAT(SUBSTR(SSN, 1,8),'*****')
--    , SUBSTR(SSN, 1,2) --�⵵
--    , SUBSTR(SSN, 3,2) --��
--    , SUBSTR(SSN, 5,2) --��
--    , SUBSTR(SSN,8,1) --����   
FROM insa;

------------------------------------------

SELECT NAME, SSN
        ,SUBSTR(SSN, 0,8)||'*****' AS rrn --ù��° ��ġ�� 0�� ����!
        ,SUBSTR(SSN, 1,2) year
        ,SUBSTR(SSN, 3,2) month
        ,SUBSTR(SSN, 5,2) AS "DATE"
--        ,SUBSTR(SSN, 5,2) date --ORA-00923: FROM keyword not found where expected �����߻� 
                          --from���� ��ġ�ؾߵǴµ� �ٸ��� �ִٰ� �ߴ� ����
        ,SUBSTR(SSN,8,1) gender
        ,SUBSTR(SSN, -1)
FROM insa;

--771212-[1]022432 ����⵵ 1900, 1800, 2000 + 77  ==> 1977



--�������� 14. emp ���̺��� ���ӻ��(mgr)�� ����  ����� ������ ��ȸ�ϴ� ���� �ۼ�.
SELECT *
FROM emp
WHERE mgr is NULL;

--�������� 14-2. emp ���̺��� ���ӻ��(mgr)�� �ִ�  ����� ������ ��ȸ�ϴ� ���� �ۼ�.
SELECT *
FROM emp
WHERE mgr IS NOT NULL;

--14-3. emp ���̺��� ���ӻ��(mgr)�� ����  ����� mgr�� 'CEO'�� ����ϴ� ���� �ۼ�.

--mgr null ó���� �Ϸ��� �ռ� ��� nvl �Լ��� ����غ�
SELECT empno, ename, job
             ,NVL(mgr, 'CEO') mgr 
             ,hiredate, sal, comm, deptno 
FROM emp;
-- ORA-01722: invalid number 
-- *Cause:    The specified number was invalid. �߸��� ���ڰ� �ִٴ� ���� �߻��� ������?
--,nvl(mgr, 'CEO') mgr --mgr�� ������Ÿ��? mgr�� ������ Ÿ���� Ȯ���غ��� 
DESC emp; 
[��°��]
-- MGR        NUMBER(4) mgr�� ����Ÿ���̴�
-- NUMBERŸ���� => String mgr ��ȯ�ؾ� -> NVL()�� �̿��� 'CEO' ó���� �����ϴ�
-- �����ȣ 7369 -> �������� '7369' ��ȯ�ϵ���  null -> nvl() ó���ϸ� 'ceo' ������ �� ����.
-------------------------------------
SELECT EMPNO, ENAME, JOB
-- ,nvl(mgr,0) mgr --mgr�� 0 ó���� ������
,NVL(TO_CHAR (mgr), 'CEO') mgr --mgr�� ���ڷ� ��ȯ �� NVL �Լ��� �̿��� 'CEO'�� ��ȯ�ߴ�.
,hiredate, sal, comm,deptno
FROM emp;
-------------------------------------
SELECT empno, ename, job
,DECODE(mgr, NULL, 'CEO', mgr) AS mgr
, hiredate, sal, comm, deptno
FROM emp
WHERE mgr IS NULL;
-- �� �������� DECODE �Լ��� mgr �÷��� ���� NULL�� ��� 'CEO'�� ����ϰ�, 
--�׷��� ������ ������ mgr ���� ����Ѵ�.
------------------------------------





SELECT
'AbCd'
,UPPER('AbCd')
,LOWER('AbCd')
FROM dual;

--TO_CHAR (��¥)
--[TO_CHAR (����)]
SELECT name
    , basicpay+sudang pay --2,810,000 �޸��� ��� ����. TO_CHAR(����, ['fmat', 'NLS����'])���ڸ� ���ڿ��� ������ ��
    , TO_CHAR(basicpay+sudang) pay -- '2810000' ����� ������ ���� �Ǿ������� ����, ���� ���� �Ǿ������� ����
    --, TO_CHAR(basicpay+sudang, '99,999,999') pay
    --, TO_CHAR(basicpay+sudang, '9,999') pay--##### �ڸ��� �����ϸ� ����ó�� #���� ��� �ڸ����� �ݾ׺��� ũ�� ����
    , TO_CHAR(basicpay+sudang, 'L99,999,999') pay 
    , ibsadate
FROM insa;

--TO_CHAR (����)
-- ����Ŭ �ڷ��� -���߿� ����
-- ����Ŭ ������
--1)��������� + - * /   �������� ���ϴ� �����ڴ� ���� �Լ��� �ִ�: MOD()
SELECT 1+2 --3
    , 1-2 -- -1
    , 1*2 --2
    , 1/2 d --0.5   Java 0
    -- , 2/0 ���� --ORA-01476: divisor is equal to zero ������� 0���� ������ �����߻�
    -- ,3.14/0 �Ǽ� --ORA-01476: divisor is equal to zero
    -- , 1%2 --������ �����ڴ� %�� �ƴѰ� ���� --ORA-00911: invalid character
    ,MOD(1,2) --1 
FROM dual;


-- FROM���� �ִ� dual�̶�? PUBLIC SYNONYM       ��Ű��(SYS).��ü���� �ٿ��� == dual�� ���
-- SCOTT ����ڰ� �����ϰ� �ִ� ���̺� ���� ��ȸ
--[����] dba_xxx, all_xxx, user_xxx ������ ?
SELECT *
--FROM emp;
--FROM scott.emp;
FROM user_tables; -- ���� ������ �����(USER)�� ������ ���̺� ������ ��ȸ.
FROM dba_tables; -- ORA-00942: table or view does not exist --DBA�� ����� �� �ִ� ��� ���̺� ������ ��ȸ.
FROM all_tables; -- ���� ����ڰ� �����ϰ� �ִ� ���̺� + ������ �ο��� ���̺� ������ ��ȸ





-- �ó�� ���� 3) scott ����
-- �ó�� ���� 4) �ó�Կ� ������ �ο��Ѵ�


GRANT SELECT ON emp TO HR; --SELECT ON ���� �ο��Ѵٴ� ��
--Grant��(��) �����߽��ϴ�.

SELECT *
FROM arirang;


-- ����Ŭ �Լ�
--2) || ���� ���ڿ�
DROP TABLE ���̺�� CASCADE; --CASCADE ��ܽ�      DDL ���� �ڵ����� ���� ����, PL/SQL ���� ����
-- ���� ��ü�� ���� �����ϴ� �� : ��������
SELECT 'DROP TABLE' || table_name || 'CASCADE;'
FROM user_tables;

--DROP TABLEDEPTCASCADE;
--DROP TABLEEMPCASCADE;
--DROP TABLEBONUSCASCADE;
--DROP TABLESALGRADECASCADE;
--DROP TABLEINSACASCADE;



3) ����� ���� ������
--create operator ������ �����ڸ� ������ �� ����.

4) ������ ���� ������
--PRIOR, CONNECT_BY_ROOT�� ������ ���� ������

5) �� ������ = != <> ^= > < >= <=
   -- �Ʒ� 3���� �� �������� ���ÿ� SQL �������̴�.
   ANY, SOME
   ALL

-- 10 20 30 40 �μ���ȣ ��ȸ
SELECT deptno
FROM dept;


SELECT *
FROM emp
WHERE deptno > ANY(SELECT deptno FROM dept); --10�� �μ� ���ܵ� ��� ���
WHERE deptno <= ANY(SELECT deptno FROM dept);-- ���������� ��� �ϳ��� �����ص� ��-> ��ȸ --SOME �� ANY�� ����
WHERE deptno <= ALL(SELECT deptno FROM dept);--10�� --�������� ������ ��� �����ؾ�

WHERE deptno �񱳿����� ALL(��������);
WHERE deptno <=20; -- 10�� 20�� �μ�


-- 6) �� ������ : AND OR NOT
-- 7) SQL ������
    (1) ( NOT ) IN (���)
    (2) ( NOT ) BETWEEN a AND b
    (3) IS ( NOT ) NULL
    (4) ANY, SOME, ALL, WHERE �� ��������
    (5) EXISTS ��� ���������� ����.
    (6) ���� ���� �˻��� ��
          1.  ( NOT ) LIKE 
            - ���� ���� �˻��� �� ���Ǵ� SQL �������̴�.
            - �� ���Ͽ� ���Ǵ� ��ȣ�� ���ϵ� ī�� : %   _
            - ���ϵ� ī�带 �Ϲ� ����ó�� ����ϰ� ���� �� ESCAPE �ɼ��� ����Ѵ�.
          2.  REGEXP_LIKE �Լ�
              REGEXT_XXX ����ǥ������ ����ϴ� �Լ��̴�.
        ��) emp ������̺� R ���ڷ� �����ϴ� ����� �˻�
            insa ���̺� ������� '��'���� ����� �˻��ϰ� ���� ; -- �����ݷ� ���� ���� ���� �ȵǼ� ���� �ȳ�
            SELECT *
            FROM insa
            WHERE name LIKE '��%'; -- % �������� ���ڰ� �� �� �ִ�. �ϳ��� �ȿ͵� ������� java���� *�� ����
            WHERE name LIKE '���� ���ϵ�ī�� %  _ '; -- LIKE ������ ���
            WHERE SUBSTR(name, 1, 1) = '��';
    
       ��) insa ���̺� ����� '��'�� ���� ����� �˻��ϰ� ����
            SELECT *
            FROM insa
            WHERE name LIKE '%��%';     
    
       ��) insa ���̺� ����� �������� '��'�� ������ ����� �˻��ϰ� ����
            SELECT *
            FROM insa
            WHERE name LIKE '%��';
        
       ��) insa ���̺��� 81��� ��� ���� ��ȸ
            SELECT *
            FROM insa
            WHERE ssn LIKE '81%';
        
        
       [����] insa ���̺��� ���ڻ���� ��ȸ
            SELECT name, ssn
            ,SUBSTR(ssn, 8)
            FROM insa
            WHERE ssn LIKE '______-1%';
            WHERE SUBSTR(ssn, 8) LIKE '1%';
            WHERE SUBSTR(ssn, 8, 1) = '1';
            WHERE ssn LIKE '%-1%';

            -- �ֹι�ȣ�� 1/3/5/7/9 ����

       [����] insa ���̺��� �̸��� �ι�° ���ڰ� '��'
            SELECT name, ssn
            ,SUBSTR(ssn, 8)
            FROM insa
            WHERE name LIKE '_��%';
            WHERE SUBSTR(name, 2,1) = '��';
    
            FROM ��ǰ���̺�
            WHERE ��ǰ�� LIKE '%��ũ�е�%' AND ��ǰũ�� =17 AND ���뷮 = 32;

            -- �μ����̺�
            -- deptno(�μ���ȣ) dname(�μ���) loc(������)
            --10	ACCOUNTING	NEW YORK
            --20	RESEARCH	DALLAS
            --30	SALES	CHICAGO
            --40	OPERATIONS	BOSTON
            SELECT *
            FROM dept;

            -- ���ο� �μ��� �߰�
            -- DML : DELETE, UPDATE, INSERT + Ŀ��, �ѹ�
            
            INSERT INTO ���̺��(�÷���, �÷���...) VALUES (��,��,��...);
            COMMIT;

            INSERT INTO dept(deptno, dname, loc) VALUES ( 50, '�ѱ�_����' , 'SEOUL');
            
            INSERT INTO dept(deptno, dname, loc) VALUES ( 50, '�ѱ�100%����' , 'SEOUL'); --�ѱ�100%���� �� 16����Ʈ
            --SQL ����: ORA-12899: value too large for column "SCOTT"."DEPT"."DNAME" (actual: 16, maximum: 14)
            
            INSERT INTO dept(deptno, dname, loc) VALUES ( 50, '��100%��' , 'SEOUL');
            --ORA-00001: unique constraint (SCOTT.PK_DEPT) violated --���ϼ� �������� ����
            --�μ���ȣ�� ����Ű�� �����״µ� 50�� ���� ��ȣ�� �־��� ������ ������.
            
            INSERT INTO dept(deptno, dname, loc) VALUES ( 60, '��100%��' , 'SEOUL');
            
            COMMIT;

            DESC dept;
            
            [���]
            10	ACCOUNTING	NEW YORK
            20	RESEARCH	DALLAS
            30	SALES	CHICAGO
            40	OPERATIONS	BOSTON
            50	�ѱ�_����	SEOUL
            60	��100%��	SEOUL
            -------------------------
            
            
            --�˻� : �μ���(dname)�� ��ġ ������� '_��' �˻�
            
            SELECT *
            FROM dept
            WHERE dname LIKE '%\_��%' ESCAPE '\'; -- \_�� �Ϲݹ��� _�� �νĵǰ�
            WHERE dname LIKE '%_��%'; -- _�� ���ϵ�ī��� �νĵ�
            [���]
            50	�ѱ�_����	SEOUL
            60	��100%��	SEOUL
            -----------------
            
            
            [����] �μ��� %�� ���ִ� �μ� �˻�
            
            SELECT *
            FROM dept
            WHERE dname LIKE '%\%%' ESCAPE '\';
            -----------------------------------
            
            
            DML - UPDATE + Ŀ��, �ѹ�
            UPDATE ���̺��
            SET �÷��� = �÷���...
            [WHERE ������;] --������ ��� ���ڵ� ������
            
            UPDATE dept
            SET loc = 'KOREA'; --6�� �� ��(��) ������Ʈ�Ǿ����ϴ�.       
            
            ROLLBACK;
            ---------
            
            UPDATE dept
            SET loc = 'KOREA'
            WHERE loc = 'SEOUL';--2�� �� ��(��) ������Ʈ�Ǿ����ϴ�.
            
            [���]
            10	ACCOUNTING	NEW YORK
            20	RESEARCH	DALLAS
            30	SALES	CHICAGO
            40	OPERATIONS	BOSTON
            50	�ѱ�_����	KOREA
            60	��100%��	KOREA
            -------------
            
            
            DELETE FROM dept
            WHERE deptno >=50;
            COMMIT;
            [���]
            10	ACCOUNTING	NEW YORK
            20	RESEARCH	DALLAS
            30	SALES	CHICAGO
            40	OPERATIONS	BOSTON

