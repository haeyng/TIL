--SCOTT--

-- [���� �Լ�]
-- �� ������� �޿�
-- �� ������� �ѱ޿���
-- �� ��� ��
-- �� ������� ��ձ޿�
SELECT SUM (sal + NVL(comm, 0)) SUM_PAY --27125
        , COUNT(sal + NVL(comm, 0)) cnt --12��
        , SUM (sal + NVL(comm, 0))/COUNT(sal + NVL(comm, 0)) avg_pay
        , AVG(sal + NVL(comm, 0)) avg_pay 
        , MAX(sal + NVL(comm, 0)) MAX_pay 
        , MIN(sal + NVL(comm, 0)) MIN_pay
        , STDDEV(sal + NVL(comm, 0)) STDDEV_pay--ǥ������ : �л��� ������(��Ʈ)
        , VARIANCE(sal + NVL(comm, 0)) VARIANCE_pay--�л� : (�� ������� PAY - AVG_PAY)^2�� ���
FROM emp;
----------------------------------------------------------
-- 1. insa ���̺��� ���ڴ� 'X', ���ڴ� 'O' �� ����(gender) ����ϴ� ���� �ۼ�
-- 1-1. ����(SET)������ ����ؼ� Ǯ��
SELECT name, ssn
       ,'X' gender
FROM insa
WHERE mod(SUBSTR(ssn,-7,1),2) = 1
UNION
SELECT name, ssn
       ,'O' gender
FROM insa
WHERE mod(SUBSTR(ssn,-7,1),2) = 0;

--1-2. REPLACE() ����ؼ� Ǯ��
SELECT ename
    , REPLACE(ename, 'M', '*')
FROM emp;
-- ������ 1 or 0 .. 1�̸� X 0�̸� O

WITH t as(
SELECT name, ssn
       ,mod(SUBSTR(ssn,-7,1),2) gender
FROM insa
)
SELECT t.name, t.ssn
    ,replace(replace(t.gender, 1, 'X'), 0 , 'O') gender
FROM t;

--3. NVL2(), NULLIF() ����ؼ� Ǯ��.
SELECT NULLIF(1,1) -- NULL
FROM dual;
--
SELECT NULLIF(1,0) -- 1
FROM dual;
--

select comm
    ,nvl(comm,0) 
    ,nvl2(comm,comm,0)
FROM emp;
--
SELECT name, ssn
    --,NULLIF(A,B) --A==B ���� NULL��ȯ , A!=B A��ȯ 
    , NVL2(NULLIF(mod(SUBSTR(ssn,-7,1),2),1),'O','X') GENDER
FROM insa;
------------------------------------------------------------
--2. insa ���̺��� 2000�� ���� �Ի��� ���� ��ȸ�ϴ� ���� �ۼ�
--�Ի����ڸ� �������� �⵵ �����ؼ� ��
SELECT name, ibsadate
    ,TO_CHAR(ibsadate, 'yyyy')
    ,EXTRACT(year FROM ibsadate) 
FROM insa
WHERE TO_CHAR(ibsadate, 'yyyy') = '2000';
WHERE EXTRACT(year FROM ibsadate) = 2000;
--
SELECT name, ibsadate
FROM insa
WHERE ibsadate >='2000.1.1';
-----------------------------------------
3. SQL ����(SET) �������� ������ ������ �ϼ���
  1) ���� 
  	UNION 
	UNION ALL 
	INTERSECT 
	MINUS
------------------------------------------
--4. emp ���̺��� �޿��� ��ձ޿��� ���ϰ�
   �� ����� �޿�-��ձ޿��� �Ҽ��� 3�ڸ����� �ø�,�ݿø�,�����ؼ� �Ʒ��� 
   ���� ��ȸ�ϴ� ������ �ۼ��ϼ���.
   
   SELECT ename, sal + NVL(comm, 0) pay
   FROM emp;
   --
   SELECT ename
   , AVG(sal + NVL(comm, 0) pay) AVG_PAY 
   -- �������� �������(���ڵ�)�� ���� �ϳ��� ���� ����(�������Լ�) , ename�� �����Լ��� ���� ����
   FROM emp;
   --
   --�������� ���******************************************
    WITH temp AS(
    SELECT ename, sal + NVL(comm, 0) pay
         -- , AVG(sal + NVL(comm, 0) pay) AVG_PAY 
        ,(select AVG(sal + NVL(comm, 0)) AVG_PAY from emp) avg_pay 
    from emp)
    
    --��ձ޿��� �Ҽ��� 3��° �ڸ����� �ݿø� round(��, 2) //2+1 �ݿø�
    select ename, pay
    ,round(avg_pay,2) avg_pay
--    ,ceil(pay - avg_pay,2) --�ø�
    ,ceil(pay - avg_pay*100)/100 --�ø�
    ,round(pay - avg_pay,2) --�ݿø�
    ,trunc(pay - avg_pay,2) --����(����) floor x
    from temp;
------------------------------------------------
( ��Ʈ : AVG() ��� ���ϴ�  �����Լ� ��� )
4-2. emp ���̺��� �޿��� ��ձ޿��� ���ϰ�
    �� ����� �޿��� ��ձ޿� ���� ������ "����"
                   ��ձ޿� ���� ������ "����"��� ���;                

SELECT ename, pay, avg_pay
        , sign(pay - avg_pay) --���1 ����-1 ������ 0 ��ȯ --(1����) (-1����), (0����)
        , NVL2(NULLIF(sign(pay - avg_pay),1),'����','����') --1,-1 ��쿡�� �����ѰŶ� �Ϻ��� �ڵ��� �ƴ� 0�� ó���ؾ��� replace ����ؼ� 0���� �غ���
from (select ename, sal + nvl(comm, 0) pay
    , (select avg(sal + nvl(comm, 0 )) from emp) avg_pay
     from emp
     )e;
--ORA-00936: missing expression -- �������� ��ȣ ����ߵ�
----------------------
--set �Լ� union ���
select ename, pay,'����'
from emp
where pay> avg_pay
union
...

-------------------------------------------------------------------
--5.  �� �Խñۼ��� 154���̰� �� �������� ����� �Խñ� ���� 15�� �� ��
    --�� ���������� ���ΰ� ����ϴ� ���� �ۼ�.
SELECT CEIL(154/15)
FROM dual;

--------------------------------------------------------------------
--5-2. insa ���̺��� ��� ������� 14�� ���� ����� �� �� ���� �������� ������ �ۼ��ϼ���.

select count(*)from insa;
--
select ceil(60/14)
from dual;
--
--ORA-00936: missing expression ���������� ��ȣó��
select ceil(select count(*)from insa/14)
from dual;
--
select ceil((select count(*)from insa)/14)
from dual;
------------------------------------------------
--6. emp ���̺��� �ְ� �޿���, ���� �޿��� ���� ��� ��ȸ

select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay, deptno
from emp;
--
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay, deptno
      , '�ְ�޿���'
from emp
where sal + nvl(comm,0) = 5000;
--(SELECT  MAX(sal + NVL(comm, 0)) MAX_pay FROM emp); --5000���� �������� ��������
--
SELECT  MAX(sal + NVL(comm, 0)) MAX_pay 
FROM emp;
--
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay, deptno
      , '�ְ�޿���'
from emp
where sal + nvl(comm,0) = (SELECT  MAX(sal + NVL(comm, 0)) MAX_pay FROM emp)
union
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay, deptno
      , '�����޿���'
from emp
where sal + nvl(comm,0) = (SELECT  min(sal + NVL(comm, 0)) MAX_pay FROM emp);
--


--2��° Ǯ��
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay, deptno
      , '�ְ�޿���'
from emp
where sal + nvl(comm,0) >= all(SELECT sal + NVL(comm, 0) FROM emp);
--union
--all, any, some
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay, deptno
      , '�����޿���'
from emp
where sal + nvl(comm,0) <= all(SELECT  sal + NVL(comm, 0) FROM emp);
--

--3��° Ǯ��
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay
      , deptno
from emp
where sal + nvl(comm,0) in(5000, 800);
--
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay
      , deptno
from emp
where sal + nvl(comm,0) in(5000, 800);
--
select max(sal + nvl(comm,0)), min(sal + nvl(comm,0))
from emp;
----------------------------------------------------
--ORA-00913: too many values ����
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay
      , deptno
from emp
where sal + nvl(comm,0) in(
    select max(sal + nvl(comm,0)), min(sal + nvl(comm,0))
    from emp);
----------
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay
      , deptno
from emp
where sal + nvl(comm,0) in(
    select max(sal + nvl(comm,0))--, min(sal + nvl(comm,0))
    from emp);
------------
--in���� ������ �̷���
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay
      , deptno
from emp
where sal + nvl(comm,0) in(
(select max(sal + nvl(comm,0)) from emp),
(select min(sal + nvl(comm,0)) from emp)
);
-------
7. emp ���̺��� 
   comm �� 400 ������ ����� ���� ��ȸ
   ( comm �� null �� ����� ���� )
;

select ename, sal, comm
FROM emp
where comm <= 400; -- null --null�� ��,������ �ƴ�
--
--�ι�° ���
select ename, sal, comm
FROM emp
where comm <= 400 or comm is null;
--
--����° ���
select ename, sal, comm
FROM emp
where comm <= 400
union
select ename, sal, comm
from emp
where comm is null;
--
--ù��° ���
select ename, sal, comm
FROM emp
where nvl(comm,0)<=400;
--
--�׹�° ���
--lnnvl(���ǽ�)
--where�� ������ true�̸� false ��ȯ
--              null�̸� false ��ȯ
--              false�̸� true ��ȯ
select ename, sal, comm
FROM emp
where lnnvl(); --���� where comm <= 400 or comm is null
--
select ename, sal, comm
FROM emp
where lnnvl(comm > 400);--where comm <= 400 or comm is null�� ������� ���� �ڵ�
--
8. emp ���̺��� �� �μ��� �޿�(pay)�� ���� ���� �޴� ����� ���� ���. 

select max(sal + nvl(comm,0))from emp where deptno = 10; --10�� �μ� 5000
select max(sal + nvl(comm,0))from emp where deptno = 20; --20�� �μ� 3000
select max(sal + nvl(comm,0))from emp where deptno = 30; --30�� �μ� 2850
select max(sal + nvl(comm,0))from emp where deptno = 40; --40�� �μ� null

select*
from emp
where deptno = 30 and
sal + nvl(comm,0) = (select max(sal + nvl(comm,0))
from emp where deptno = 30)

union

select*
from emp
where deptno = 10 and
sal + nvl(comm,0) = (select max(sal + nvl(comm,0))
from emp where deptno = 10)

union

select*
from emp
where deptno = 20 and
sal + nvl(comm,0) = (select max(sal + nvl(comm,0))
from emp where deptno = 20);


--
-- ���� ���� ��
-- ��� ���� ����
select *
from emp e
where sal + nvl(comm,0) = (
    select max (sal+nvl(comm,0))
    from emp
    where e.deptno = deptno
)
--------------------------------------------------
-- �� �μ��� �ְ� �޿��� ������?
SELECT MAX(SAL + NVL(COMM,0)) MAX_PAY
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--------------------------------------
9. INSTR() �Լ� ����ϴ� �����Դϴ�. 
    '031)1234-5678' �̶�� ��ȭ��ȣ�� ���� ���
    INSTR() �Լ��� ����ؼ� 1234 ��ȭ��ȣ�� ������ ������ �ۼ��ϼ���;

--substr()
SELECT '031)1234-5678'
        , substr('031)1234-5678', 5, 4) --'1234'
        , instr('031)1234-5678', ')') --4
        , substr('031)1234-5678'
                , instr('031)1234-5678', ')')+1 -- +1�� ��ȣ �������Ϳ���
                , instr('031)1234-5678', '-') - instr('031)1234-5678', ')') -1)
              --,4)
FROM DUAL;
-----------------------------------------------
--12��
select deptno, ename, sal+nvl(comm,0) pay
        , round((sal+nvl(comm,0))/100) bar_length
        , lpad(' ',round((sal+nvl(comm,0))/100)+1, '#')
from emp
where deptno = 30
order by pay desc
;
------------------------------------------------
--13.  insa ���̺��� �ֹε�Ϲ�ȣ�� 123456-1******  �������� ����ϼ��� . 

select name, ssn
    , substr(ssn, 0, 8) || '******'
    , concat(substr(ssn, 0, 8), '******')
    , rpad(substr(ssn, 0, 8), 14, '*')
from insa;
-------------------------------------------------
--trunc() ����(����) �Լ�, ����, ��¥, �����ϰ��� �ϴ� Ư�� ��ġ�� �� �� �ִ�.
--floor() ����(����) �Լ�, ���� ,     �Ҽ��� ù��° �ڸ����� ����

select sysdate -- ����Ŭ���� ��¥�� ��Ÿ���� �ڷ��� �� date �ڷ��� : sysdate
      ,systimestamp --����Ŭ���� ��¥�� ��Ÿ���� �ڷ��� �� timestamp �ڷ���
      ,trunc( sysdate, 'year' ) --23/01/01
      ,trunc( sysdate, 'month' ) --23/08/01
      ,trunc( sysdate)--23/08/29 -- 00:00:00 �ð�,��,�� ����Ǿ��� --���� ����
from dual;
-------------------------------------------------
--15��

--ORA-00937: not a single-group group function
--avg �����Լ�
select sum(pay)
from(
    select ename, sal, comm
         , sal + nvl(comm,0) pay
        , round ((select avg(sal + nvl(comm,0)) from emp ),5) avg_pay
    from emp
)e
where pay > avg_pay;
-------------------------------------------------
--16��
select t.*
    ,t.pay/t.max_pay * 100 || '%' percent
    ,round (t.pay/t.max_pay * 100/10) ������
    ,lpad( ' ', round (t.pay/t.max_pay * 100/10)+1, '*')
from (
select ename
, sal + nvl(comm,0) pay
,(select max(sal + nvl(comm,0)) from emp) max_pay
from emp
)t;
-------------------------------------------------
-- [����] emp ���̺��� pay �޿� ������ ����� �ű�� (��� ���� ���� ����ؼ�)-- �ܿ��
-- ������� ���� �ΰ��� �ϱ��ϱ�

select t.*
    ,(SELECT COUNT(*)+1-- +1�� ��� üũ�ϴ� ������� �޿��� ���� ����� ��������� 1�� ���ؾ� �� ����� ����� ����
    FROM EMP
    WHERE sal + nvl(comm,0)>t.pay
    ) pay_rank
from(
    select ename, sal + nvl(comm,0) pay
    from emp
)t
order by pay_rank asc;
--
--with���� 
with t as(
select ename, sal + nvl(comm,0) pay
    from emp
)
select t.*
    ,(SELECT COUNT(*)+1
    FROM EMP
    WHERE sal + nvl(comm,0)>t.pay
    ) pay_rank
from t
order by pay_rank asc;
------------------------------------------------
--��¥ �Լ�
1)sysdate - ���� ��¥, �ð� ���� ��ȯ�ϴ� �Լ�
    to_char (��¥, '����')
select sysdate --'23/08/29'
    ,to_char(sysdate,'yyyy-mm-dd pm hh12:mi:ss (day)')
    ,to_char(sysdate,'ds ts')
from dual;

-- �ܿ�� ������ ���� 
--�� �� ���° �� ww ,iw (������?)  -   w

2)round(��¥, [����])
select sysdate
     , to_char(sysdate,'DL TS') --2023�� 8�� 29�� ȭ���� ���� 3:47:33
     , ROUND (SYSDATE) --23/08/30 --12��(����)�� ������ ������ �ݿø��Ǽ� 29�������� 30�Ϸ� ����
     , ROUND (SYSDATE, 'DD') --23/08/30 --���� �������� �ݿø�
     , ROUND (SYSDATE, 'MONTH') --23/09/01 15���� ������ ������ �ݿø� 9/1
     , ROUND (SYSDATE, 'YEAR') --24/01/01
from dual;
--
3) TRUNC(date)
select sysdate
     , to_char(sysdate,'DL TS') 
     , TRUNC (SYSDATE) 
     , TRUNC (SYSDATE, 'DD') 
     , TRUNC (SYSDATE, 'MONTH') 
     , TRUNC (SYSDATE, 'YEAR') 
from dual;
--
3)MONTHS_BETWEEN() --�ΰ��� ��¥���� �������� �����ϴ� �Լ�
--emp ���̺��� �� ������� �ٹ��ϼ�, �ٹ�������, �ٹ���� ��ȸ.

-- �� �ܿ��
��¥ - ��¥ = �ϼ�
��¥ + ���� = ��¥
��¥ - ���� = ��¥
��¥ + �ð� = ��¥
      ����/24

select ename
    , hiredate
    , sysdate
    , round ( sysdate - hiredate ) �ٹ��ϼ� -- ��¥ - ��¥ = �ϼ�
    , round ( months_between (sysdate, hiredate), 1) �ٹ�������
    , round ( months_between (sysdate, hiredate)/12, 1) �ٹ����
from emp;

--
--1�ð� �� ���� ����

select sysdate 
    , to_char (sysdate, 'ts') --���� 4:14:30
    , sysdate + 1
    , sysdate + 10 --10�� ��
    , to_char(sysdate +1/24, 'ts') --���� 5:15:22
from dual;
--------------------------------------------------
4)ADD_MONTHS(��¥, ���� ��)

select sysdate
    ,add_months(sysdate, 3) -- 23/11/29
    ,add_months(sysdate, -1) --23/07/29
from dual;
-------------------------------------------------
5)LAST_DAY() --Ư�� ��¥�� ���� ���� ���� ������ ��¥�� �����ϴ� �Լ�
select sysdate a
    --,last_day(sysdate)--23/08/31
     -- �̹� �� ������ ��¥�� ���� ����, ���ϱ������� ��ȸ
    --,to_char (last_day(sysdate), 'dy')
    --,to_char (last_day(sysdate), 'dd')
    
    -- �̹� �� 1���� ���� ����?
    ,to_char(trunc(sysdate, 'month'),'day') --23/08/01
    ,to_char(last_day(add_months(sysdate,-1)) + 1, 'day')
from dual;
-------------------------------------------------
6)next_day() --��õ� ������ ���ƿ��� ���� �ֱ��� ��¥�� �����ϴ� �Լ�
  ����)NEXT_DAY(��¥, '����')
  
  select sysdate, to_char(sysdate, 'day')
        , next_day(sysdate, '�ݿ���') --sysdate���� ���� ����� �ݿ���
        , next_day(sysdate, 'ȭ����') --23/09/05
  FROM dual;
---------------------------------------------------
select sysdate --'23/08/29'
      , CURRENT_DATE --'23/08/29'
from dual;
--------------------------------------------------
--[����] ������ 23.7.13(��) �κ���  100���� �Ǵ� ��¥ ����?
-- ��¥ + ���� = ���ڸ�ŭ�� �ϼ��� ������ ��¥
-- ����Ŭ ��¥, ���ڿ� ''

--ORA-01722: invalid number
--'23.7.13' == ��¥�� �����ǵ� ���ڿ��� �νĵǼ� ����
--���ڿ�->��¥ �� ��ȯ : to_date()                 to_char(����,��¥,����->���ں�ȯ)
--�����ġ�
     TO_DATE( char [,'fmt' [,'nlsparam']])
     
select to_date('23.7.13') + 100 --23/10/21
        ,to_date('23/7/13') + 100
       --,to_date('23.7.13(��)') +100 --ORA-01830: date format picture ends before converting entire input string
       --,to_date('23.7.13(��)', 'yy.m.dd(dy)') +100 --ORA-01821: date format not recognized
       ,to_date('23.7.13(��)', 'yy.mm.dd(dy)') +100 --23/10/21
FROM dual;



--------------------------------------------

--[��ȯ �Լ�]
1) TO_NUMBER() --�� �Ⱦ� �ڵ����� �ٲ��ֱ� ������
    -- ��������             ����������
    select '100' , to_number('100')
    from dual;
--------------------------------------------
-- DECODE �Լ� (�߿�)
-- �������� ������ �־� ���ǿ� ���� ��� �ش� ���� ��ȯ�ϴ� �Լ� (if��)
-- �񱳿����ڸ� '= ����' �� ����� �� �ִ�.
-- from�������� ����� �� ����.
-- PL/SQL �ȿ��� ����� �� �ִ� �Լ��̴�.

-- �ڹ�
int x = 10;
if ( x == 11){
return c;
}
-- ����Ŭ decode �Լ��� ����ؼ� ǥ��
decode (x, 11, c) x�� 11�̸� c�� �����Ѵ�.
-----------------------------------------
-- �ڹ�
int x = 10;
if ( x == 11){
return c;
}else{
return d;
}
-- ����Ŭ decode �Լ��� ����ؼ� ǥ��
decode (x, 11, c, d) x�� 11�̸� c�� �����ϰ� �׷��� ������ d�� �����Ѵ�.
------------------------------------------
-- �ڹ�
int x = 10;
if ( x == 11){
return c;
}else if(x==12){
return d;
}else if(x==13){
return e;
}else{
return f;
}
-- ����Ŭ decode �Լ��� ����ؼ� ǥ��
decode (x, 11, c, 12, d, 13, e, f) x�� 11�̸� c�� �����ϰ�...
--------------------------
��) insa ���̺��� �ֹε�Ϲ�ȣ�� ������ "����", "����"��� ���.

select name, ssn
     ,mod(substr(ssn,-7,1),2)
     ,decode(mod(substr(ssn,-7,1),2), 1, '����', '����') gender
     ,decode(mod(substr(ssn,-7,1),2), 1, '����', 0,'����') gender
from insa;
---------------------------
--[����] emp ���̺��� 10�� �μ��� �޿� 15% �λ�, 20�� �μ��� �޿� 30% �λ�, �� �� �μ��� 5% �λ�, ���(�μ���ȣ, �����, ���� �޿�, �λ��, �λ�� �޿�)

select empno, ename ,sal + nvl(comm,0) pay
    ,decode( sal + nvl(comm,0),  ,  ,   )
from emp;
--------------------------------------------------------------------------------




1. insa ���̺��� ���ڴ� 'X', ���ڴ� 'O' �� ����(gender) ����ϴ� ���� �ۼ�
�ۼ��ϴ� ���� �𸣰��� gender�� ����Ϸ���???�ڡڡڡڡڡڡڡڡڡ�

WITH t as(
SELECT name, ssn
       ,mod(SUBSTR(ssn,-7,1),2) gender
FROM insa
)
SELECT t.name, t.ssn
    ,replace(replace(t.gender, 1, 'X'), 0 , 'O') gender
FROM t;



WITH t AS (
    SELECT name, ssn, SUBSTR(ssn, 8, 1) gender
    FROM insa    
)
SELECT name, ssn
--    , gender
--    , MOD( gender, 2 )
--    , NULLIF( MOD( gender, 2 ), 1 )
    , NVL2( NULLIF( MOD( gender, 2 ), 1 ), 'X','O' ) gender
FROM t;




--------------------------------------------------------------

4. emp ���̺��� �޿��� ��ձ޿��� ���ϰ�
   �� ����� �޿�-��ձ޿��� �Ҽ��� 3�ڸ����� �ø�,�ݿø�,�����ؼ� �Ʒ��� 
   ���� ��ȸ�ϴ� ������ �ۼ��ϼ���.

SELECT ename, pay, avg_pay
    , CEIL((pay-avg_pay)*100)/100 "�� �ø�"
    , ROUND((pay-avg_pay),2) "�� �ݿø�"
    , TRUNC((pay-avg_pay),2) "�� ����"
FROM (
    SELECT ename
        , sal+NVL(comm, 0) pay
        , (SELECT AVG(sal+NVL(comm, 0)) FROM emp) avg_pay
    FROM emp
) temp;




--------------------------------------------------------------
( ��Ʈ : AVG() ��� ���ϴ�  �����Լ� ��� )
4-2. emp ���̺��� �޿��� ��ձ޿��� ���ϰ�
    �� ����� �޿��� ��ձ޿� ���� ������ "����"
                   ��ձ޿� ���� ������ "����"��� ���

SELECT ename, pay, avg_pay
        , sign(pay - avg_pay) --���1 ����-1 ������ 0 ��ȯ --(1����) (-1����), (0����)
        , NVL2(NULLIF(sign(pay - avg_pay),1),'����','����') --1,-1 ��쿡�� �����ѰŶ� �Ϻ��� �ڵ��� �ƴ� 0�� ó���ؾ��� replace ����ؼ� 0���� �غ���
from (
    select ename, sal + nvl(comm, 0) pay
        , (select avg(sal + nvl(comm, 0 )) from emp) avg_pay
    from emp
) e;

-----------------------------------------------------
--6. emp ���̺��� �ְ� �޿���, ���� �޿��� ���� ��� ��ȸ
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay
      , deptno
from emp
where sal + nvl(comm,0) in(
    (select max(sal + nvl(comm,0)) from emp)
    ,(select min(sal + nvl(comm,0)) from emp)
);



-----------------------------------------------------
8. emp ���̺��� �� �μ��� �޿�(pay)�� ���� ���� �޴� ����� ���� ���. 



select *
from emp
where (deptno = 30 
    and sal + nvl(comm,0) = ( select max(sal + nvl(comm,0))
                              from emp 
                              where deptno = 30))
    OR
    (deptno = 20 
    and sal + nvl(comm,0) = ( select max(sal + nvl(comm,0))
                              from emp 
                              where deptno = 20))
    OR
    (deptno = 10 
    and sal + nvl(comm,0) = ( select max(sal + nvl(comm,0))
                              from emp 
                              where deptno = 10));
                              

SELECT *
FROM emp e
WHERE sal+NVL(comm,0) = ( 
                        SELECT MAX(sal+NVL(comm,0)) 
                        FROM emp 
                        WHERE e.deptno=deptno 
                        );
