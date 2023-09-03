-- 1. ���� ��¥�� TO_CHAR() �Լ��� ����ؼ� '2023�� 08�� 30�� ���� 14:03:32 (��)' �������� ���

select sysdate  
        --ORA-01821: date format not recognized
        --,to_char(sysdate, 'yyyy�� mm�� dd�� am hh24:mi:ss (dy)')
        ,to_char(sysdate, 'yyyy"��" mm"��" dd"��" am hh24:mi:ss (dy)')
--      ,to_char(sysdate, 'cc') ����
--      ,to_char(sysdate, 'yyyy') ����
--      ,to_char(sysdate, 'mm') ��
--      ,to_char(sysdate, 'dd') ��
--      ,to_char(sysdate, 'am') 
--      ,to_char(sysdate, 'hh24') �ð�
--      ,to_char(sysdate, 'mi') ��
--      ,to_char(sysdate, 'ss') ��
--      ,to_char(sysdate, 'dy') ����
--      ,to_char(sysdate, 'ts')

from dual;
--------------------------------------------------------------------------------
--2. �츮�� ������ ( '2023.12.27' ) ���ú��� ������ ���� ���� �ϼ� ? 

select sysdate, '2023.12.27'
--     , ��¥ - ��¥ = �ϼ�
      , ceil ( abs( sysdate - tO_date ( '2023.12.27' ) ) ) "���� �ϼ�"
from dual;
--------------------------------------------------------------------------------
--3. emp ���̺��� �����ȣ�� 6�ڸ��� ����ϱ�. 
--java String.format("%06d", 123); 000123
    [ ��� ��� ��]
    7369	 007369
    7499	 007499
    7521	 007521
    7566	 007566
    7654	 007654 

select empno
        , to_char(empno, '009999')
        , lpad(empno, 6, 0)
from emp;
--------------------------------------------------------------------------------
--4.  emp ���̺��� �� ����� ��ȣ, �̸�, �޿�(pay) ���.
    1) 10�� �μ����� 15% �޿�(pay) �λ�
    2) 20�� �μ����� 30% �޿�(pay) �λ�
    3) �� �� �μ����� 5% �޿�(pay) �λ�
    �� �Ǵ� ���� �ۼ��ϼ���.
    ( DECODE, CASE �Լ� );
    
select empno, ename, sal + nvl(comm, 0) pay
       , decode(deptno, 10, 15, 20, 30, 5) || '%' "�λ��"
       , (sal + nvl(comm, 0)) * (decode(deptno, 10, 0.15, 20, 0.3, 0.05)) "�λ��"
       , (sal + nvl(comm, 0)) * (case deptno
                                  when 10 then 0.15
                                  when 20 then 0.3
                                  else 0.05
                                  end
                                )"�λ��"
       , (sal + nvl(comm, 0)) + (sal + nvl(comm, 0)) * (decode(deptno, 10, 0.15, 20, 0.3, 0.05)) "�λ� ��"
from emp;
--------------------------------------------------------------------------------
--5. emp ���̺��� �� �μ��� ������� 3�� ������ �μ� ��ȸ
  ( ���� : 40�� �μ��� 0 ���� ���, OUTER JOIN ��� ) 
  [���� ���]
     DEPTNO         COUNT 
---------- --------------
        10              3
        20              3
        40              0 
;
select d.deptno, count(empno) -- COUNT (comm) X
from emp e right outer join dept d on e.deptno = d.deptno -- dept�� ����Ұǵ� dept�� �����ʿ� �־ right 
group by d.deptno
having count(empno) <= 3
order by d.deptno;
--------------------------------------------------------------------------------
-- join ~ on ���� => ,�� ����
select d.deptno, count(empno)
from emp e , dept d -- , �� �ٲٰ� �ڿ� �������� where ���� ����.  
where e.deptno = d.deptno 
group by d.deptno
having count(empno) <= 3
order by d.deptno;
[���] 30���� �������� right oute join�� ���� �־.
10	3
20	3
--------------------------------------------------------------------------------
-- (+) �� right outer join�� �ǹ��Ѵ�.
-- (+) �� where e.deptno = d.deptno(+) �ȴٸ� left outer join�� �ǹ��Ѵ�.
select d.deptno, count(empno)
from emp e , dept d -- , �� �ٲٰ� �ڿ� �������� where ���� ����.  
where e.deptno(+) = d.deptno 
group by d.deptno
having count(empno) <= 3
order by d.deptno;
--------------------------------------------------------------------------------
--5-2. emp ���̺��� �� �μ��� ������� ��ȸ
    ( ���� : DECODE, COUNT �Լ� ��� ) ;
select count(*) "�� ��� ��"
      ,COUNT ( decode(deptno, 10, 'O') ) "10�� �����"
      ,COUNT ( decode(deptno, 20, 'O') ) "20�� �����"
      ,COUNT ( decode(deptno, 30, 'O') ) "30�� �����"
      ,COUNT ( decode(deptno, 40, 'O') ) "40�� �����"
from emp;
--------------------------------------------------------------------------------
--6. ���� ǥ������ ����ϴ� �Լ��� ��� ��������.
LIKE SQL ������     % _ ���ϵ�ī��
REGEXP_LIKE() �Լ�

INSTR()  '031)1234-5678'  ')' ��ġ  '-'��ġ
REGEXP_INSTR() �Լ�

SUBSTR()
REGEXP_SUBSTR()

REPLACE()
REGEXP_REPLACE()
--------------------------------------------------------------------------------
-- 7. emp ���̺��� �μ���, job�� ����� �޿����� ��ȸ.
  [���� ���] 
    DEPTNO JOB          SUM_PAY
---------- --------- ----------
        10 CLERK           1300
        10 MANAGER         2450
        10 PRESIDENT       5000
        20 ANALYST         3000
        20 CLERK            800
        20 MANAGER         2975
        30 CLERK            950
        30 MANAGER         2850
        30 SALESMAN        7800

-- �μ��� �� �޿� ��
select deptno, sum (sal + nvl(comm, 0)) deptno_sum_pay
from emp
group by deptno;

-- job��
select deptno, job, sum (sal + nvl(comm, 0)) deptno_sum_pay
from emp
group by deptno, job
order by deptno, job;
--------------------------------------------------------------------------------
--8. emp ���̺��� �� �μ��� �ѱ޿��� ��ȸ
  1) GROUP BY �� ���

select deptno, sum(sal + nvl(comm, 0))
from emp
group by deptno;


  2) DECODE, SUM �Լ� ���

select sum (sal + nvl(comm,0)) --27125 �� ��� �޿���
      ,sum (decode ( deptno, 10, sal + nvl(comm, 0))) "10��"
      ,sum (decode ( deptno, 20, sal + nvl(comm, 0))) "20��"
      ,sum (decode ( deptno, 30, sal + nvl(comm, 0))) "30��"
from emp;
--------------------------------------------------------------------------------
9. emp ���̺��� �� �μ���, job �� �ѱ޿��� ��ȸ (sum_pay�� �������� �ʴ� job�� ���)
  [���� ���] 
    DEPTNO JOB          SUM_PAY
---------- --------- ----------
        10 ANALYST            0
        10 CLERK           1300
        10 MANAGER         2450
        10 PRESIDENT       5000
        10 SALESMAN           0
        20 ANALYST         3000
        20 CLERK            800
        20 MANAGER         2975
        20 PRESIDENT          0
        20 SALESMAN           0
        30 ANALYST            0

    DEPTNO JOB          SUM_PAY
---------- --------- ----------
        30 CLERK            950
        30 MANAGER         2850
        30 PRESIDENT          0
        30 SALESMAN        7800


with j as (
select distinct job
from emp
)
select deptno, j.job , sum( sal + nvl(comm, 0) ) dj_sum_pay
from j left outer join emp e on j.job = e.job
group by deptno, j.job
order by deptno;
--------------------------------------------------------------------------------
-- Oracle 10g �� �߰��� ���� PARTITION BY OUTER JOIN ����� ����
with j as (
select distinct job
from emp
)
select deptno, j.job , NVL(sum( sal + nvl(comm, 0) ), 0) dj_sum_pay
from j left outer join emp e PARTITION BY(deptno) on j.job = e.job
-- deptno�� ��Ƽ���� ������ 'left outer join' ������ j(job) �� ����Ѵٴ� �ǹ�.
group by deptno, j.job
order by deptno;
--------------------------------------------------------------------------------
--10.  empno, dname, ename, hiredate �÷� ��ȸ ( JOIN )
-- dept - dname
-- emp - empno, ename, hiredate
-- join ����

 [������]
7369	RESEARCH	SMITH	80/12/17
7499	SALES	ALLEN	81/02/20
7521	SALES	WARD	81/02/22

select empno, dname, ename, hiredate
from dept d inner join emp e on d.deptno = e.deptno; --inner ����
------------------------------------
select empno, dname, ename, hiredate
from dept d , emp e
where d.deptno = e.deptno;
--------------------------------------------------------------------------------
11. insa���̺��� �����ο����� 5�� �̻��� �μ��� ���.  
 [������]
BUSEO               COUNT
--------------- ----------
���ߺ�                   8
������                   8

select *
from insa
where ���ڻ����;
---------------
select buseo, count(*) -- * -> buseo, count(*)
from insa
where mod(substr(ssn,-7,1),2)=0
group by buseo; -- �μ����� �׷�
---------------
select buseo, count(*)
from insa
where mod(substr(ssn,-7,1),2)=0
group by buseo
having count(*) >= 5; 
-- [Ǯ�� ��]
--------------------------------------------------------------------------------
select *
from emp;

select*
from salgrade;
----------------
20	SMITH	800
30	ALLEN	1600
30	WARD	1250
20	JONES	2975
30	MARTIN	1250
----------------
-- deptno, ename, sal ,grade ��� ��ȸ (emp ���̺��� ����� �޿� ���)
select deptno, ename, sal
      ,case
           when sal >= 700 and sal < 1200 then 1
           when sal between 1201 and 1400 then 2
           when sal between 1401 and 2000 then 3
           when sal between 2001 and 3000 then 4
           when sal between 3001 and 9999 then 5
       end grade
from emp;
--------------------------------------------------------------------------------
--join ���
--non equal join 
select deptno, ename, sal ,grade
from emp e join salgrade s on e.sal between s.losal and s.hisal;
--
select deptno, ename, sal 
       ,losal || '~' ||hisal
       ,grade
from emp e join salgrade s on e.sal between s.losal and s.hisal;
--------------------------------------------------------------------------------


select deptno, ename
from emp
order by deptno;
-- [��µǱ� ���ϴ� ����(���η�)]
-- 10 , KING/CLARK/MILLER
-- 20 , FORD/SMITH/JONES

-- *** LISTAGG() ***
-- ����Ŭ 11g �������� ����� �� �ִ� �Լ��� �׷쿡 �����ִ� �����͸� ���η� ������ �� ����Ѵ�. 

SELECT deptno 
        ,LISTAGG (ename,'/')
         WITHIN GROUP (ORDER BY sal DESC)
FROM emp
GROUP BY deptno;
[���]
10	KING/CLARK/MILLER
20	FORD/JONES/SMITH
30	BLAKE/ALLEN/TURNER/MARTIN/WARD/JAMES
--------------------------------------------------------------------------------
[����] �� ��� + 40�� �μ� �߰� �ϰ� ������� ���� ���
10	KING/CLARK/MILLER
20	FORD/JONES/SMITH
30	BLAKE/ALLEN/TURNER/MARTIN/WARD/JAMES
40  �������

SELECT d.deptno 
        ,nvl (LISTAGG (ename,'/') WITHIN GROUP (ORDER BY sal DESC), '�������')
FROM emp e right outer join dept d on d.deptno = e.deptno
GROUP BY d.deptno;
--------------------------------------------------------------------------------
-- GROUPING SETS ��
-- ��) GROUP BY exp1
--      UION ALL
--     GROUP BY exp2

-- GROUPING SETS (exp1, exp2)


select deptno, count(*)
from emp
group by deptno;
[���]
30	6
20	3
10	3

-- union all

select job, count(*)
from emp
group by job;
[���]
CLERK	    3
SALESMAN	4
PRESIDENT	1
MANAGER	    3
ANALYST	    1

-- [GROUPING SETS ��]
select deptno, job, count(*)
from emp
group by grouping sets (deptno, job);

-- emp ���̺��� �޿��� ���� ���� �޴� ����� ����(empno, deptno, ename, pay) ��ȸ

select deptno, empno, ename
     , sal + nvl(comm, 0) pay
from emp
where (sal + nvl(comm, 0)) = (select max(sal + nvl(comm, 0)) from emp);
where (sal + nvl(comm, 0)) >= all(select sal + nvl(comm, 0) from emp);
--------------------------------------------------------------------------------
-- RANK ���� �Լ�
-- [TOP-N �м�]  �α� ���� TOP 10,5 .. ��
-- 1) ORDER BY ���ĵ� �ζ��κ�
-- 2) ROWNUM �ǻ� Į�� - �ึ�� ������� ��ȣ�� �ο��ϴ� Į��
-- 3) WHERE ������ ���� > , <= ������ �����Ѵ�.

-- �ǻ�(pseudo) �÷� -- ���� �������� �ʴ� ��¥
-- Pseudocolumn�� ���̺��� �÷�ó�� ����������, ���̺��� ������ ����Ǿ� ���� �ʴ´�. 
-- �׷��Ƿ� pseudocolumn���� select�� �ؾ� �Ѵ�.
-- Pseudocolumn���� insert, update, delete�� ������ �� ������, 
-- ������ argument���� �Լ�ó�� �����ϴ� ���̴�.
select rowid, rownum, ename
from emp;

desc emp; -- ���� Ȯ��
--------------------------------------------------------------------------------
-- TOP - N �м�(���) 

select deptno, ename, hiredate, sal + nvl(comm,0) pay
FROM emp
ORDER BY pay desc;

-- top 3
select rownum , e.*
from (
        select deptno, ename, hiredate, sal + nvl(comm,0) pay
        FROM emp
        ORDER BY pay desc
     )e
where rownum between 3 and 5; -- (����) �ȵ�! �߰��� �ȵ� �׻� top ���� n �����̴�.
where rownum <= 5;
where rownum <= 3;
where rownum = 1;
--------------------------------------------------------------------------------
-- [RANK ���� �Լ�]
-- 1)RANK()
-- 2)DENSE_RANK()
-- 3)PERCENT_RANK()
-- 4)FIRST(), LAST()
-- 5)ROW_NUMBER() ***
--------------------------------------------------------------------------------
select deptno, ename, sal + nvl(comm,0) pay
         , row_number() over( order by sal + nvl(comm,0) desc ) �޿�����
from emp
where �޿����� = 1;
-- ORA-00904: "�޿�����": invalid identifier : �߸��� �ĺ��� , alias �ν� ���� -> with�� ����
--------------------------------------------------------------------------------
-->with�� ����
select e.*
from(
    select deptno, ename, sal + nvl(comm,0) pay
         , row_number() over( order by sal + nvl(comm,0) desc ) �޿�����
    from emp
)e
where �޿����� between 3 and 5;
where �޿����� <= 3;
where �޿����� = 1;
--------------------------------------------------------------------------------
--[����] emp ���̺��� �� �μ��� �ְ�޿��� �޴� ����� ������ ��ȸ
-- (deptno, [dname], ename, pay, hiredate, grade)

select deptno, ename, sal + nvl(comm,0) pay
      , row_number() over (partition by deptno order by sal + nvl(comm,0) desc) �޿�����
from emp;
-----------------------------------

select e.*
from(
    select deptno, ename, sal + nvl(comm,0) pay
      , row_number() over (partition by deptno order by sal + nvl(comm,0) desc) �޿�����
from emp
)e
where �޿����� <= 2;
where �޿����� = 1;

-----------------------------------
--dname �߰�
select e.*
from(
    select d.deptno, dname, ename, sal + nvl(comm,0) pay
      , row_number() over (partition by d.deptno order by sal + nvl(comm,0) desc) �޿�����
from emp e, dept d
where e.deptno = d.deptno
)e
where �޿����� <= 2;
----------------------------------
--grade �߰�
select e.*
from(
    select d.deptno, dname, ename, sal + nvl(comm,0) pay, grade
      , row_number() over (partition by d.deptno order by sal + nvl(comm,0) desc) �޿�����
from emp e, dept d, salgrade s
where e.deptno = d.deptno AND sal between losal and hisal
)e
where �޿����� <= 2;
--------------------------------------------------------------------------------
-- emp ���̺��� �ְ�޿� �޴� ���
--dept : deptno, dname
--emp : deptno, ename, pay, hiredate
--salgrade : grade

select d.deptno, dname, ename, sal + nvl(comm, 0) pay, hiredate, grade
from dept d join emp e on d.deptno = e.deptno
            join salgrade s on e.sal between s.losal and s.hisal;
          --join ..
          --join ..
------------------------------------
select e.*
from(
     select d.deptno, dname, ename, sal + nvl(comm, 0) pay, hiredate, grade
            , row_number() over( order by sal + nvl(comm,0) desc ) �޿�����
     from dept d join emp e on d.deptno = e.deptno
                 join salgrade s on e.sal between s.losal and s.hisal
)e
where �޿����� = 1;
--------------------------------------------------------------------------------
-- ����(RANK) �Լ�
-- TOP - N �м�
-- ROW_NUMBER() OVER()

-- RANK(), DENSE_RANK() �ߺ����� ��� O/X
-- dense ������, ������

select empno, ename, sal
      , row_number() over(order by sal desc) rn_rank
      , rank() over (order by sal desc) r_rank --�ߺ��Ǵ� �� ���
      , dense_rank() over (order by sal desc) dr_rank --�ߺ��Ǵ� �� ��� X
from emp;
----------------------------------
--�μ��� ����
select empno, ename, sal
      , row_number() over(PARTITION BY DEPTNO order by sal desc) rn_rank
      , rank() over (PARTITION BY DEPTNO order by sal desc) r_rank --�ߺ��Ǵ� �� ���
      , dense_rank() over (PARTITION BY DEPTNO order by sal desc) dr_rank --�ߺ��Ǵ� �� ��� X
from emp;
--------------------------------------------------------------------------------
--[����] EMP ���̺��� �� ��� �޿��� �μ� �������� �޿� ����, ��� ��ü�� �޿� ���� ��ȸ

--�μ� �� �޿� ����
select empno, deptno, ename, sal + nvl(comm,0) pay
      ,rank() over (partition by deptno order by sal + nvl(comm,0) desc) r_rank    
from emp;

--��� ��ü �޿� ����
select empno, ename, sal + nvl(comm,0) pay
       ,row_number() over(order by sal + nvl(comm,0) desc) rn_rank
       ,rank() over(order by sal + nvl(comm,0) desc) rn_rank
from emp;
----------------------------------
select empno, deptno, ename, sal + nvl(comm,0) pay
      ,rank() over (partition by deptno order by sal + nvl(comm,0) desc) "�μ�"  
      ,row_number() over(order by sal + nvl(comm,0) desc) "��� ��ü" 
from emp
order by deptno;
--------------------------------------------------------------------------------
--[����] insa ���̺��� ����� ���
-- ���ڻ���� : 31
-- ���ڻ���� : 29
-- ��ü����� : 60

-- ù��° ���
select '���ڻ����', COUNT(*) 
from insa
WHERE MOD(SUBSTR(SSN,-7,1),2) = 1
UNION
select '���ڻ����', COUNT(*) 
from insa
WHERE MOD(SUBSTR(SSN,-7,1),2) = 0
UNION
select '��ü�����', COUNT(*) 
from insa;

-- �ι�° ���
select 
  decode (MOD(SUBSTR(SSN,-7,1),2),1, '����', '����') || '�����' gender
, count(*)
FROM insa
group by MOD(SUBSTR(SSN,-7,1),2)
union
select '��ü�����', count(*)
from insa;

--3��° ��� ROLLUP(), CUBE() �м��Լ� -- GROUP BY �� ����� �� �ִ� �Լ�
-- GROUPING SETS -- GROUP BY ���� ���.

-- ROLLUP�� GROUP BY ���� �׷� ���ǿ� ���� ��ü ���� �׷�ȭ �ϰ�, 
-- �� �׷쿡 ���� �κ����� ���ϴ� �������̴�.
-- CUBE�� ROLLUP�� ���� �׷� ����� GROUP BY ���� ����� ���ǿ� ���� �׷� ������ ����� �������̴�. 
-- ��, ROLLUP �����ڸ� ������ ����� ���� GROUP BY ���� ����� ���ǿ� ���� ��� ������ �׷��� ���տ� ���� ����� ����Ѵ�.



select  
      decode (MOD(SUBSTR(SSN,-7,1),2),1, '����', 0 , '����', '��ü') || '�����' gender
    , count(*)
FROM insa
GROUP BY CUBE(MOD(SUBSTR(SSN,-7,1),2));
GROUP BY ROLLUP(MOD(SUBSTR(SSN,-7,1),2));
-----------------------------------------
select buseo, jikwi, sum(basicpay) sum_pay
FROM insa
group by cube(buseo,jikwi)
-- group by buseo, rollup (jikwi) --������ ���� �κ��ո� ��ü������� x
-- group by rollup (buseo, jikwi) -- �κ���
order by buseo;
--------------------------------------------------------------------------------
--[����] emp ���̺��� ���� ���� �Ի��� ����� ���� �ʰ�(�ֱ�)�� �Ի��� ����� �ϼ� ���̴�?

select ename, hiredate
from emp
order by hiredate desc;

-- ��¥�� ���� �Űܼ� 1�� ��¥ - ������ ��¥ 

SMITH	80/12/17
MILLER	82/01/23

--row_number()
with a as (
    select hiredate
    from(
    select hiredate
    ,row_number() over(order by hiredate desc) h_rank
    from emp
    )e
    where h_rank = 1
),
b as (
    select hiredate
    from(
    select hiredate
    ,row_number() over(order by hiredate asc) h_rank
    from emp
    )e
    where h_rank = 1 
)
select a.hiredate - b.hiredate
from a, b;
------------------------------------
--max(),min() �Ἥ �����ϰ�
select max(hiredate) - min(hiredate)
from emp;
--------------------------------------------------------------------------------
--[����] �� 60���� ����Ѵٰ� ����, ����(�Ի����ڿ� ����)
-- insa ���̺��� �� ������� �����̸� ����ؼ� ���(��ȸ)
-- 1) ssn �ֹε�Ϲ�ȣ '770830-1022432'
--                           [1,2,3,4,5,6,7,8,9,0]   1900,2000,1800
--                      1,2,5,6    1900
--                      3,4,7,8    2000
--                          0,9    1800

-- ������ : ���س⵵ - ���ϳ⵵ => ���� ������ ���� ��쿡�� -1 
-- �̸�, �ֹι�ȣ, ������ ���(��ȸ)

select name, ssn
      , floor((sysdate - to_date (substr(ssn, 1, 6)))/365) "���� ����" 
      , nvl (floor (decode (sign (sysdate - to_date ( substr(ssn, 3, 4), 'mm-dd')), -1, ((sysdate - to_date (substr(ssn, 1, 6)))/365) - 1 )),floor((sysdate - to_date (substr(ssn, 1, 6)))/365)) "������"  
from insa;

select sysdate
from dual;
--------------------------------------
--1)
select sysdate, to_char(sysdate,'yyyy') -- ���س⵵
from dual;
--2)
select '770830-1022432'
      ,substr('770830-1022432', 0 , 2)
      ,case
         when  substr('770830-1022432', -7, 1) in (1,2,5,6) then 1900
         when  substr('770830-1022432', -7, 1) in (3,4,7,8) then 2000
         else  1800
       end + substr('770830-1022432', 0, 2) b_year
from dual;

--3)
select substr('770830-1022432', 3, 4) --b_md
      ,to_date(substr('770830-1022432', 3, 4),'mmdd')
      ,sign (trunc(sysdate) - to_date(substr('770830-1022432', 3, 4),'mmdd')) --�Ҽ��������� trunc(sysdate) �ð� ����
from dual;

--����)
select t.name, t.ssn
    --,t.now_year - t.birth_year
      ,t.now_year - t.birth_year + (case isBirthCheck
                                         when -1 then -1 -- ������ ������ ���� ���
                                         else    0       --���� ����, ������ ���� ���
                                    end) american_Age -- �� ����
      ,t.now_year - t.birth_year + 1 counting_age -- ���� ����
from(
    select name, ssn
         ,to_char(sysdate, 'yyyy') now_year
         ,case
              when  substr(ssn, -7, 1) in (1,2,5,6) then 1900
              when  substr(ssn, -7, 1) in (3,4,7,8) then 2000
              else  1800
           end + substr(ssn, 0, 2) birth_year
          ,sign (trunc(sysdate) - to_date(substr(ssn, 3, 4),'mmdd')) isBirthCheck
    from insa
)t ;
--------------------------------------------------------------------------------
--Java : ������ ��(����)  0.0 <= double Math.random() < 1.0     , Random Ŭ����
--Oracle : dbms_random ��Ű��    !=    �ڹ� ��Ű��

SELECT 
--SYS.dbms_random.value --0.0 <= SYS.dbms_random.value  < 1.0
--sys.dbms_random.value(0,100) -- 0 <= �Ǽ� < 100
--sys.dbms_random.string('U',5) -- UPPER ������ �빮�� 5����
--sys.dbms_random.string('L',5) --LOWER ������ �ҹ��� 5����
--sys.dbms_random.string('A',5) -- ������ ���ĺ� ��ҹ���
--sys.dbms_random.string('X',5) -- �빮�� + ���� 5����
sys.dbms_random.string('P',5) -- �빮�� + Ư������ 5����
from dual;

-- 0<= SCORE ���� <100
-- 1<= lotto ���� <45
-- 150<= v ���� <= 200
select  trunc(sys.dbms_random.value*101) -- 0 <= �Ǽ� < 101
       ,trunc(sys.dbms_random.value(0,45))+1 -- 0 + 1<= ���� < 45 +1
       ,trunc(sys.dbms_random.value(0,51))+150
from dual;
--------------------------------------------------------------------------------
-- [�Ǻ�(pivot) ����]

--��.
select job
from emp;

[���]
CLERK
SALESMAN
SALESMAN
MANAGER
SALESMAN
MANAGER
MANAGER
PRESIDENT
SALESMAN
CLERK
ANALYST

--��. �� job(����) �� �� ���� �ϰ� �ִ��� �ľ�.
select job, count(*)
from emp
group by job;

[���]
CLERK	    3 
SALESMAN	4
PRESIDENT	1
MANAGER	    3
ANALYST  	1

--��. ���� �������� ��ȸ�Ϸ��� ��.
-- decode, case, count

select count(*)
      ,count (decode(job, 'CLERK', '0')) "CLERK" 
      ,count (decode(job, 'SALESMAN', '0')) "SALESMAN" 
      ,count (decode(job, 'PRESIDENT', '0')) "PRESIDENT" 
      ,count (decode(job, 'MANAGER', '0')) "MANAGER"
      ,count (decode(job, 'ANALYST', '0')) "ANALYST"
from emp;

--��. PIVOT(�Ǻ�) �Լ�
--      �� ���� �߽����� (ȸ����Ű��.)
--      �� ����� ����/���� - �Ǻ� ���

SELECT * 
  FROM (�ǹ� ��� ������)
 PIVOT (�׷��Լ�(�����÷�) FOR �ǹ��÷� IN(�ǹ��÷� �� AS ��Ī...))
 
[��ó] [Oracle] ����Ŭ PIVOT(�ǹ�)�Լ�|�ۼ��� ����;


SELECT * 
  FROM (
        select job
        from emp
       )
 PIVOT (count(job) FOR job IN('CLERK','SALESMAN','PRESIDENT','MANAGER','ANALYST'));
------------------------------------
SELECT * 
  FROM (SELECT 
         job ,
         TO_CHAR(hiredate, 'FMMM') || '��' hire_month
         from emp
       )
   PIVOT(
         count(*)
          FOR hire_month IN ('1��', '2��')
        )
[��ó] [Oracle] ����Ŭ PIVOT(�ǹ�)�Լ�|�ۼ��� ����
------------------------------------
-- [����] emp ���̺��� (�� �μ����� )+ �� job���� �ο����� ���� ���(��ȸ)
--1) �Ǻ� ��� ã��
;
select *
from (
        select deptno, job
        from emp
     )
pivot(count(job) for job in ('CLERK','SALESMAN','PRESIDENT','MANAGER','ANALYST'))
order by deptno;
--           ��Į�� null �ƴϸ� ������� (������ �Ʒ� ����)
-----------------------------------------
select count(*), count(empno), count(comm)
from emp;
-----------------------------------------
-- ���� ��°���� 40  0 0 0 0 0 �߰� �Ϸ���?

select *
from(
select d.deptno, job
from emp e right outer join dept d on e.deptno = d.deptno
)
pivot (count(job)  for job in ( 'CLERK','SALESMAN','PRESIDENT','MANAGER','ANALYST'))
order by deptno;

--------------------------------------------------------------------------------
