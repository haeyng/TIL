-- 1. emp ���̺��� sal�� ���� 20% ��� ���� ��ȸ.
-- �����Լ� ���
---------------------------
select count(*)--�ѻ���� 12
from emp;
---------------------------
select 12*20/100 --20% �ο���
from dual;
---------------------------
select t.*
from(
select deptno, ename, sal
     , rank() over( order by sal desc) sal_rank
from emp
) t
where sal_rank <= (select count(*) from emp) * 20/100;
--------------------------------------------------------------------------------
--2. emp ���� �� ����� �޿��� ��ü�޿��� �� %�� �Ǵ� �� ��ȸ.
       ( % �Ҽ��� 3�ڸ����� �ݿø��ϼ��� )
           ������ �Ҽ��� 2�ڸ������� ���.. 7.00%,  3.50%     
           
ENAME             PAY   TOTALPAY ����     
---------- ---------- ---------- -------
SMITH             800      27125   2.95%
ALLEN            1900      27125   7.00%
WARD             1750      27125   6.45%
JONES            2975      27125  10.97%
MARTIN           2650      27125   9.77%
BLAKE            2850      27125  10.51%
CLARK            2450      27125   9.03%
KING             5000      27125  18.43%
TURNER           1500      27125   5.53%
JAMES             950      27125   3.50%
FORD             3000      27125  11.06%
MILLER           1300      27125   4.79%
;
-- �� �޿���
select sum(sal + nvl(comm,0))
from emp;
-----------------------------------
select ename, sal + nvl(comm,0) pay 
      ,round( (sal + nvl(comm,0))/(select sum(sal + nvl(comm,0))from emp)*100, 2) || '%' "TOTALPAY ����"
from emp;

-----------------------------------
SELECT T.*, TO_CHAR ( ROUND(PAY/TOTALPAY*100,2), '999.00') || '%' ����
FROM(
select ename, sal + nvl(comm,0) pay 
      ,(select sum(sal + nvl(comm,0))from emp) "TOTALPAY"
from emp
)T;
--------------------------------------------------------------------------------
-- 3. insa ���� ������� ������ ����ؼ� ���
-- ( ������ = ���س⵵ - ����⵵          - 1( ������������ ������) )

���س⵵ SYSDATE TO_CHAR()
����⵵ ���� SUBSTR(ssn,-7,1) CASE 1,2 END 1900, 1800, 2000
        + �⵵ SUBSTR(ssn,0,2)
���³��� = ���س⵵ - ����⵵ + 1
������ = ���س⵵ - ����⵵ -1 .. ���Ͽ��ο� ����

�ֹε�Ϲ�ȣ TO_DATE(SUBSTR(SSN,3,4),'MMDD') '23/04/23'
���ó�¥                               TRUNC('23/09/01')
SIGN(���, 0 , ����) 1 0 -1 ..
--------------------------------------------------------------------------------
4. insa ���̺��� �Ʒ��� ���� ����� ������
 [�ѻ����]  [���ڻ����] [���ڻ����] [��������� �ѱ޿���][��������� �ѱ޿���][����-max(�޿�)] [����-max(�޿�)]
---------- ---------- ---------- ---------- ---------- ---------- ----------
     60         31         29      51961200             41430400         2650000          2550000

select ���� �����Լ�
from insa
group by ����;
--------------
select decode ( mod(substr(ssn,-7,1),2),1,'����',0,'����','��ü') || '�����', count(*) 
from insa
group by rollup(mod(substr(ssn,-7,1),2))
union   ------------------------------------------------------------------------
select decode ( mod(substr(ssn,-7,1),2),1,'����',0,'����','��ü') || '�޿���', sum(basicpay) 
from insa
group by cube(mod(substr(ssn,-7,1),2));
---------------------------------------
select count(*) --�ѻ����
      ,count(decode(mod(substr(ssn,-7,1),2),1,0)) "���ڻ����"
      ,count(decode(mod(substr(ssn,-7,1),2),0,0)) "���ڻ����"
      ,sum(decode(mod(substr(ssn,-7,1),2),1,basicpay+sudang)) "�����ѱ޿���"
      ,sum(decode(mod(substr(ssn,-7,1),2),0,basicpay+sudang)) "�����ѱ޿���"
      ,max(decode(mod(substr(ssn,-7,1),2),1,basicpay+sudang)) "�����ְ�޿�"
      ,max(decode(mod(substr(ssn,-7,1),2),0,basicpay+sudang)) "�����ְ�޿�"
from insa;
--------------------------------------------------------------------------------
-- 5. ����(RANK) �Լ� ����ؼ� Ǯ�� 
   emp ���� �� �μ��� �ְ�޿��� �޴� ����� ���� ���
   
    DEPTNO ENAME             PAY DEPTNO_RANK
---------- ---------- ---------- -----------
        10 KING             5000           1
        20 FORD             3000           1
        30 BLAKE            2850           1
        
        
-- ù��° ���:�����Լ�X)
-- ORA-00979: not a GROUP BY expression : GROUP BY �� ���� �Լ� �ܿ� X
select deptno, ename, MAX(sal + nvl(comm,0)) MAX_pay --ENAME ����
from emp
GROUP BY deptno;
----------------
select deptno, MAX(sal + nvl(comm,0)) MAX_pay
from emp
GROUP BY deptno;
----------------
--JOIN
select e.deptno, e.ename, (e.sal + nvl(comm,0)) pay -- ,t.deptno, t.max_pay
FROM(
    select deptno, MAX(sal + nvl(comm,0)) MAX_pay
    from emp
    GROUP BY deptno
)t, emp e
where t.deptno = e.deptno --join ����
      AND e.sal + nvl(comm,0) = t.max_pay;

--�ι�° ���:�����Լ�O) - �μ�����
select t.deptno, t.ename, t.pay, t.pay_deptno_rank AS deptno_rank
from(
select deptno, ename, sal + nvl(comm,0) pay
      , rank() over(order by sal + nvl(comm,0) desc) pay_rank
      , rank() over(partition by deptno order by sal + nvl(comm,0) desc) pay_deptno_rank
from emp 
order by deptno
)t
where pay_deptno_rank = 1; 
--------------------------------------------------------------------------------
-- 6. emp���̺��� �� �μ��� �����, �μ��ѱ޿���, �μ������ �Ʒ��� ���� ����ϴ� ���� �ۼ�.
���)
    DEPTNO       �μ�����       �ѱ޿���    	     ���
---------- ---------- 		---------- 	----------
        10          3      	 8750    	2916.67
        20          3     	  6775    	2258.33
        30          6     	 11600    	1933.33   

select deptno
     , count(*) "�μ�����"
     , sum(sal) "�ѱ޿���"
     , round(avg(sal),2) "��ձ޿�"
from emp
group by deptno
order by deptno;
--------------------------------------------------------------------------------
--7.  insa ���̺��� 
[������]
                                           �μ������/��ü����� == ��/�� ����
                                           �μ��� �ش缺�������/��ü����� == �μ�/��%
                                           �μ��� �ش缺�������/�μ������ == ��/��%
                                           
�μ���     �ѻ���� �μ������ ����  ���������  ��/��%   �μ�/��%   ��/��%
���ߺ�	    60	    14	      F	    8	    23.3%	  13.3%	    57.1%
���ߺ�	    60	    14	      M	    6	    23.3%	  10%	    42.9%
��ȹ��	    60	    7	      F	    3	    11.7%	    5%	    42.9%
��ȹ��	    60	    7	      M	    4	    11.7%	6.7%	    57.1%
������	    60	    16	      F	    8	    26.7%	13.3%	    50%
������	    60	    16	      M	    8	    26.7%	13.3%	    50%
�λ��	    60	    4	      M	    4	    6.7%	6.7%	    100%
�����	    60	    6	      F	    4	    10%	    6.7%	    66.7%
�����	    60	    6	      M	    2	    10%	    3.3%	    33.3%
�ѹ���	    60	    7	      F	    3	    11.7%	5%	        42.9%
�ѹ���	    60	    7	      M 	4	    11.7%	6.7%	    57.1%
ȫ����	    60	    6	      F	    3	    10%	    5%	        50%
ȫ����	    60	    6	      M	    3	    10%	    5%	        50%    

SELECT 
     temp.*
    ,round(�μ������/�ѻ����*100,1) || '%' "��/��%"
    ,round(���������/�ѻ����*100,1) || '%' "�μ�/��%"
    ,round(���������/�μ������*100,1) || '%' "��/��%"
FROM(
    SELECT buseo "�μ���"
         , (SELECT COUNT(*) FROM INSA) "�ѻ����"
         , (SELECT COUNT(*) FROM INSA WHERE buseo = t.buseo) "�μ������" -------------�ڡڡڡ�
         , gender "����" -- GROUP BY���� �־��ֱ�
         , COUNT(*) "���������" -- �� �μ��� ���� �����
    FROM(
         select buseo, name, ssn
        ,decode(mod(substr(ssn,-7,1),2),1,'M','F') gender
         from insa
    ) t
    group by buseo, gender
    order by buseo, gender

) temp;
--------------------------------------------------------------------------------
--8. PATITION  OUTER JOIN ���� ( �μ����� ����� ���� ��������� ��� ~ ) -------------�ڡڡڡ�
--  insa���̺��� �� �μ��� ��������� �ο��� ���

���ߺ�	����	1
���ߺ�	���	3
���ߺ�	�泲	1
���ߺ�	���	1
���ߺ�	�λ�	1
���ߺ�	����	2
���ߺ�	��õ	6
���ߺ�	����	1
���ߺ�	����	1
���ߺ�	����	1
���ߺ�	�泲	1

��ȹ��	����	1
��ȹ��	���	2
��ȹ��	�泲	1
��ȹ��	���	1
��ȹ��	�λ�	1
��ȹ��	����	3
��ȹ��	��õ	1
��ȹ��	����	1
��ȹ��	����	1
��ȹ��	����	1
��ȹ��	�泲	1
������	����	1 
 :
-- �� �μ��� �����
select buseo, count(*)
from insa
group by buseo;
---------------------------
select buseo, city, count(*)
from insa
group by buseo, city  --city �߰�
order by buseo, city; --city �߰�


select distinct city
from insa;

--[����] emp ���̺��� job�� ����� ��ȸ.
select deptno, job, count(*)
from emp
group by deptno, job
order by deptno, job;
-----------------------------
select deptno, j.job, count(empno)
from emp e partition by (deptno) right outer join (select distinct job from emp) job j on j.job=e.job -- right ������ Į���� ���� �ְų� ���ų� ��µǰ�
group by deptno, j.job
order by deptno, j.job;
--------------------------------------------------------------------------------
--9-1.  COUNT(), DECODE() ���.
  [������]
       CLERK   SALESMAN  PRESIDENT    MANAGER    ANALYST
---------- ---------- ---------- ---------- ----------
         3          4          1          3          1
select 
     count (decode (job, 'CLERK', 0)) CLERK
    ,count (decode (job, 'SALESMAN', 0)) SALESMAN
    ,count (decode (job, 'PRESIDENT', 0)) PRESIDENT
    ,count (decode (job, 'MANAGER', 0)) MANAGER
    ,count (decode (job, 'ANALYST', 0)) ANALYST   
from emp;
--------------------------------------------------------------------------------
-- 9-2.  PIVOT() ���.
  [������]
       CLERK   SALESMAN  PRESIDENT    MANAGER    ANALYST
---------- ---------- ---------- ---------- ----------
         3          4          1          3          1

-- �Ǻ� ��� ����
select job
from emp;

--
select *
from (
    select job
    from emp
    )
pivot( count(job) for job in ('CLERK','SALESMAN','PRESIDENT','MANAGER','ANALYST'
));
--------------------------------------------------------------------------------
--10. emp ���̺��� �� JOB�� �Ի�⵵�� 1��~ 12�� �Ի��ο��� ���.  ( PIVOT() �Լ� ��� ) 
    [������]
    ANALYST		1981	0	0	0	0	0	0	0	0	0	0	0	1
    CLERK		1980	0	0	0	0	0	0	0	0	0	0	0	1
    CLERK		1981	0	0	0	0	0	0	0	0	0	0	0	1
    CLERK		1982	1	0	0	0	0	0	0	0	0	0	0	0
    MANAGER		1981	0	0	0	1	1	1	0	0	0	0	0	0
    PRESIDENT	1981	0	0	0	0	0	0	0	0	0	0	1	0
    SALESMAN	1981	0	2	0	0	0	0	0	0   0	0	0	0	              

select *
from (
     SELECT job, 
       , to_char(hiredate,'yyyy') h_year
       , extract(month from hiredate) h_month
       ,
       
    FROM EMP
)
pivot (count(*) for h_month in(1,2,3,4,5,6,7,8,9,10,11,12));
--------------------------------------------------------------------------------
-- 11. SMS ������ȣ  ������  6�ڸ� ���� ��� ( dbms_random  ��Ű�� ��� )

-- sys.dbms_random() ����Ŭ ��Ű�� != �ڹ� ��Ű��
-- PL/SQL 5���� ���� �߿� �ϳ�.
select   trunc(sys.dbms_random.value(100000, 1000000))
       , sys.dbms_random.string('L',5)
from dual;
--------------------------------------------------------------------------------
-- 12. �Ʒ��� ���� ����ϼ��� .  ( LISTAGG �Լ� ��� ) 
[������]
10	CLARK/MILLER/KING
20	FORD/JONES/SMITH
30	ALLEN/BLAKE/JAMES/MARTIN/TURNER/WARD
40  �������

SELECT deptno, ename
FROM emp
order by deptno;

--LISTAGG( �÷���, ������ ) 
select deptno
    --,LISTAGG(�÷���, ������) CLARK/MILLER/KING
    --,LISTAGG(ename, '/') --ORA-02000: missing WITHIN keyword
    --,LISTAGG(ename, '/') WITHIN --ORA-00952: missing GROUP keyword
      ,LISTAGG(ename, '/') WITHIN group (order by ename asc)
FROM emp
group by deptno;

[���]
10	CLARK/KING/MILLER
20	FORD/JONES/SMITH
30	ALLEN/BLAKE/JAMES/MARTIN/TURNER/WARD

select d.deptno
      ,nvl( LISTAGG(ename, '/') WITHIN group (order by ename asc), '�������')
FROM emp e right outer join dept d on d.deptno = e.deptno
group by d.deptno;
--------------------------------------------------------------------------------
-- 13.  emp ���̺��� 30���� �μ��� �ְ�, ���� SAL�� ����ϴ� ���� �ۼ�.
-- ����� �߿� �ְ�, ���� �޿� sal
select max(sal), min(sal)
from emp;

-- 30�� �μ����� �߿� max, min sal
select max(sal), min(sal)
from emp
where deptno = 30;
--------------------------------------------------------------------------------
--13-2. emp ���̺��� 30���� �μ��� �ְ�, ���� SAL�� �޴� ����� ���� ����ϴ� ���� �ۼ�.
(deptno, ename, hiredate, sal);

select 
       max (sal)
     , min (sal)
from emp
where deptno = 30;
-------------------
select deptno
     , max (sal)
     , min (sal)
from emp
group by deptno
having deptno = 30;
-------------------
-- ��� ã��
select deptno, ename, hiredate, sal
from emp
--where deptno = 30 AND sal in(max (sal), min (sal));
--where deptno = 30 AND sal in(select max (sal), min (sal) from emp where deptno = 30); --ORA-00913: too many values
where deptno = 30 AND sal = (select max (sal) from emp where deptno = 30)
 or sal = (select min (sal) from emp where deptno = 30);

-- IN�� ����Ϸ���
select deptno, ename, hiredate, sal
from emp
where deptno = 30 AND sal IN ( (select max (sal) from emp where deptno = 30),
                               (select min (sal) from emp where deptno = 30)
                              );

--UNION ���
select deptno, ename, hiredate, sal , '�ְ�޿���'
from emp
where deptno = 30 
    AND sal = (select max (sal) from emp where deptno = 30)

UNION ALL

select deptno, ename, hiredate, sal , '�����޿���'
from emp
where deptno = 30 
    AND sal = (select min (sal) from emp where deptno = 30);

--
WITH temp AS (
SELECT MAX(sal) maxsal, MIN(sal) minsal
FROM emp
WHERE deptno = 30
)
select empno, ename, hiredate, sal
from temp t , emp e 
where e.deptno = 30 AND e.sal = t.maxsal OR e.sal = t.minsal;
--where e.deptno = 30 AND e.sal in (t.maxsal , t.minsal);
--------------------------------------------------------------------------------
-- 14. emp ���̺��� ������� �������� �μ���� �����, ���� ���� �μ���� ����� ���

select *
from(
select d.deptno, count(e.empno) cnt
       , rank() over( order by count(e.empno) desc ) cnt_rank
from emp e right outer join dept d on e.deptno = d.deptno
group by d.deptno
order by d.deptno
) t 
where t.cnt_rank = 1;
-------------------------------------------
select *
from(
select d.deptno, count(e.empno) cnt
       , rank() over( order by count(e.empno) desc ) cnt_rank
from emp e right outer join dept d on e.deptno = d.deptno
group by d.deptno
order by d.deptno
) t 
where t.cnt_rank in (1, ( select count(*) from dept));
--------------------------------------------------------------------------------
-- ������ (�ְ�� �����µ� ������ �ȳ���)
select *
from(
select deptno, count(empno) cnt
       , rank() over( order by count(empno) desc ) cnt_rank
from emp 
group by deptno
order by deptno
) t 
where t.cnt_rank in (1, ( select count(*) from dept));
--------------------------------------------------------------------------------
-- ù��°)
with temp as (
    select d.deptno, dname, count(empno) cnt
    from emp e, dept d
    where e.deptno(+) = d.deptno
    group by d.deptno, dname 
)
select *
from temp
where cnt in ( (select max(cnt) from temp)
              ,(select min(cnt) from temp) );
-- �ι�°)
with a as (
    select d.deptno, dname, count(empno) cnt
    from emp e, dept d
    where e.deptno(+) = d.deptno
    group by d.deptno, dname 
), b AS (
 SELECT MIN(cnt) mincnt, max(cnt) maxcnt --0, 6
 FROM a

)
select a.deptno, a.cnt
from a , b
where a.cnt in ( b.mincnt , b.maxcnt);
where a.cnt = b.mincnt or a.cnt = b.maxcnt;

-- ����°) �м� �Լ� : first, last
--                   ? �����Լ�(count, sum, max, min, avg)�� �Բ� ���Ǿ�
--                     �־��� �׷쿡 ���� ���������� ������ �Ű� ����� �����ϴ� �Լ��̴�.
with a as (
    select d.deptno, dname, count(empno) cnt
    from emp e, dept d
    where e.deptno(+) = d.deptno
    group by d.deptno, dname 
)
select
     min(deptno) keep(dense_rank first order by cnt asc) "deptno" --cnt���� ������ ������ �Űܼ� ù��°�� deptno�� �����´�
   , min(cnt) 
   , max(deptno) keep(dense_rank last order by cnt asc) "deptno" 
   , max(cnt)
  
from a;
--------------------------------------------------------------------------------
-- [�м��Լ�] ? ���̺� �ִ� �࿡ ���� Ư�� �׷캰�� ���谪�� ������ �� ����ϴ� �Լ�.
1)ROW_NUMBER()
2)RANK()
3)DENSE_RANK()
4)CUME_DIST() : �־��� �׷쿡 ���� ������� ������������ ���� ��ȯ�ϴ� �Լ��̴�.
                ��������(����) : 0 < ������ �� <= 1
    ��) �μ��� �޿��� ���� ������ ������ �� ��ȸ
    
    SELECT deptno, ename, sal
          ,cume_dist() over( partition by deptno order by sal ) dept_dist
    FROM emp;

5)PERCENT_RANK() : �ش� �׷� ���� ����� ����
                   0 <=   ������ �� <= 1
                   ��������� ? �׷� �ȿ��� �ش� �ο�(��)�� ������ [���� ���� ����] 
                    
    SELECT deptno, ename, sal
          ,percent_rank() over( partition by deptno order by sal ) "percent"
    FROM emp;

-- 
 SELECT deptno, ename, sal
    ,cume_dist() over( partition by deptno order by sal ) dept_dist
    ,percent_rank() over( partition by deptno order by sal ) "percent"
 FROM emp
 where deptno = 30;
 
                    CUME_DIST() ���������� ��                             PERCENT_RANK() ���������
30	JAMES	950  	0.1666666666666666666666666666666666666667(1��/6��)	0
30	WARD	1250	0.5(3/6)                                            0.2 (1/5)
30	MARTIN	1250	0.5(3/6)                                            0.2 (1/5)
30	TURNER	1500	0.6666666666666666666666666666666666666667(4/6)     0.6 (3/5)
30	ALLEN	1600	0.8333333333333333333333333333333333333333(5/6)     0.8 (4/5)
30	BLAKE	2850	1 (6/6)                                              1  (5/5)


6) NTILE(expr 3) : ��Ƽ�Ǻ��� expr�� ��õ� ��ŭ ������ ����� ��ȯ�ϴ� �Լ�
   �����ϴ� ���� ��Ŷ(bucket)�̶�� �Ѵ�.
   
   select deptno, ename, sal
         ,NTILE(4) OVER(ORDER BY sal) ntiles
   from emp;  
   
   
   select buseo, name, basicpay
         ,NTILE(2) OVER(PARTITION BY buseo ORDER BY basicpay )
   from insa;

7)WIDTH_BUCKET(expr, min_value,max_value,num_buckets)
    NTILE() �Լ��� ������ �Լ�
    ������ (�ּҰ�, �ִ밪 ���� ����)
    
    ��)
    SELECT deptno, ename, sal
    , NTILE(4) OVER(ORDER BY sal ASC) ntiles
    , WIDTH_BUCKET(sal, 0, 5000, 4) widthbuckets
    FROM emp;
    
8)LAG(expr,offset,default_value)
    : �־��� �׷�� ������ ���� �ٸ� �࿡ �ִ� ���� ������ �� ����ϴ� �Լ�
    �� (���� ��)
  LEAD(expr,offset,default_value)
    : �־��� �׷�� ������ ���� �ٸ� �࿡ �ִ� ���� ������ �� ����ϴ� �Լ�
    �� (���� ��)
    
    select ename, hiredate, sal 
          ,LAG( sal, 1, 0 ) OVER(ORDER BY hiredate ) AS prev_sal
          ,LAG( sal, 2, -1) OVER(ORDER BY hiredate ) AS prev_sal
          ,LEAD(sal, 1, -1) OVER(ORDER BY hiredate ) AS next_sal
    from emp
    where deptno = 30;
--------------------------------------------------------------------------------

select '***ADMIN***'
      ,REPLACE('***ADMIN***','*','')
      ,REPLACE('***AD**MIN***','*','') --������[��� ���� ���ŵ�]
      ,TRIM( '*' FROM '***AD**MIN***') -- ��� ���� ���� �ȵ�
      ,TRIM( ' ' FROM '   AD**MIN   ')
from dual;

--------------------------------------------------------------------------------
-- ����Ŭ�� �ڷ��� --
1)CHAR[size[BYTE|CHAR]]
  CHAR == CHAR(1)
  CHAR(10)
  CHAR(10 byte)
  CHAR(10 char)
  �⺻�� : 1
  size ũ���� ���� ���� ���� ������
  ( 1 ����Ʈ ~ 2000 ����Ʈ )
  
  �̸� ���ڿ� : ename CHAR    'A'  'ȫ'           Vsize('ȫ') = 3����Ʈ
              ename CHAR(10) == CHAR(10byte)    ȫ�浿(9����Ʈ)
              ['k']['e']['n'][][][][][][][] 10����Ʈ
              �ֹε�Ϲ�ȣ 14�ڸ� �����ȣ 5,6�ڸ�
              ��ȭ��ȣ 010-1234-1234 
              �� ���� ������ Ʋ�� ���� �͵鿡 ����Ѵ�.
              ename CHAR (10 CHAR)
              
              DESC emp;
              
              ENAME             VARCHAR2(10) 

create table test (
   aa char -- aa char(1 byte)
 , bb char(3)  --bb char(e byte)
 , cc char(3 char)
);

select *
from tabs;
from user_tables;

drop table test;

desc test;

--DML ������ ����
insert into test (aa, bb, cc) values('a','aaaa','aaaa');
-- ORA-12899: 
-- value too large for column "SCOTT"."TEST"."BB" (actual: 4, maximum: 3)

insert into test (aa, bb, cc) values('a','aaa','aaaa');
-- ORA-12899: value too large for column "SCOTT"."TEST"."CC" (actual: 4, maximum: 3)

insert into test (aa, bb, cc) values('a','aaa','aaa');
-- 1 �� ��(��) ���ԵǾ����ϴ�.

COMMIT;

SELECT *
FROM test;


insert into test values('b','��','�츮');
--1 �� ��(��) ���ԵǾ����ϴ�.

COMMIT;

SELECT *
FROM test;


insert into test values('c','�츮','�츮');
--ORA-12899: value too large for column "SCOTT"."TEST"."BB" (actual: 6, maximum: 3)

COMMIT;

SELECT *
FROM test;


---------
CHAR ������ ������ ���ڸ� �����ϴ� �ڷ���(���� ��ġ�� ����, ���� ������ ���� ����Ʈ�� ) 
     2000����Ʈ���� ������ �����ϴ�. 
     ����Ʈ ���� 1�̴�.
ename CHAR == CHAR(1) == CHAR(1byte)













