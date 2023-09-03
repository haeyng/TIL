-- 1. insa ���̺��� �� �μ��� ����� ��ȸ
-- ���� Ǯ�� ����
1)
select *
from insa;
2) �μ� Ȯ��
select distinct buseo
from insa;
3) union ����ؼ� ������ �μ� �־ ��ȸ
select '�ѹ���', count(*) from insa where buseo = '�ѹ���'
union
select '���ߺ�', count(*) from insa where buseo = '���ߺ�';
4) group by �� ����ؼ� ��ȸ
select buseo, count(*)
from insa
group by buseo; -- group by ���� ����ϴ� ���� ���踦 ��Ÿ���ڴٴ� �ǵ��� �ִ�.
-----------------------------------------------------
-- group by�� ����ϰ� �̸��� ����Ϸ��� �� �� ���� ����
-- ORA-00979: not a GROUP BY expression 
-- : group by���� ���� Į���� select ���� ���� �Լ��� �����ϰ�� �� �� ����. -- �ܿ��
select buseo, name, count(*)
from insa
group by buseo;
-----------------------------------------------------
5) ��� ���� ������ ����ؼ� ��ȸ (s �������� m �������� cnt �����)
select buseo
    , (select count (*) 
       from insa s 
       where s.buseo = m.buseo) cnt
from insa m;
-- �ߺ��� �����Ͱ� ��µ� �ߺ��� ������ �ʰ� �����ؾ� �� 
-- distinct �߰�
select distinct buseo
    , (select count (*) 
       from insa s 
       where s.buseo = m.buseo) cnt
from insa m;
-----------------------------------------------------
-- �� �ڵ� with�� , ����������� ���
with m AS (
select distinct buseo
from insa m
)
select buseo,(select count (*) 
       from insa s 
       where s.buseo = m.buseo) cnt
FROM M
;
--------------------------------------------------------------------------------

-- [����������� ����] emp ���̺��� �� �μ��� ����� ��ȸ.
-- [����������� ����] emp ���̺��� �޿�(pay)�� ��� ��ȸ.
select ename, sal + nvl(comm,0) pay
      , ( select count(*) + 1
          from emp 
          where sal + nvl(comm,0) > e.sal + nvl(e.comm,0) ) pay_rank 
          -- ��� ���� ���� �ȿ� �ִ� �͸��� ���� �ȵ�, 
          -- ���������� �����Ǿ� �־ ���������� �Բ� �����ؾ� �Ѵ�.
from emp e;
-----------------------------------------------------
-- [�߰� ����] insa ���̺��� ���� ��� ��, ���� ��� �� �� ��ȸ.
(���� Ǭ ��)
select e.*
from(
     select name
     , decode( mod(substr(ssn, -7, 1),2), '1' , '����', '����') 
     from insa
     )e;
-----------------------------------------------------
(�����)
1)
select ����, count(*)
from insa
group by ������ �׷�
2)
select mod(substr(ssn, -7, 1),2) , count(*)
from insa
group by mod(substr(ssn, -7, 1),2);
3)nullif(), nvl2(), 1,0 -> '���ڻ����','���ڻ����'
-----------------------------------------------------
decode() ����� Ǯ��
select decode (mod(substr(ssn, -7, 1),2),1,'���ڻ����','���ڻ����'), count(*)
from insa
group by mod(substr(ssn, -7, 1),2);
-----------------------------------------------------
decode() ����� Ǯ��-2)
select count(*) '��ü�����' -- ORA-00923: FROM keyword not found where expected
                           -- alias ���� '��ü�����' �� �ƴ� "��ü�����" �ֵ���ǥ�� ���δ�.
from insa;
--------------------------
select count(*) "��ü�����"
      ,count(decode(mod(substr(ssn, -7, 1),2),1, '���ڻ����')) "���ڻ����"
      ,count(decode(mod(substr(ssn, -7, 1),2),0, '���ڻ����')) "���ڻ����"
from insa;
--------------------------
--[�߿�]
--count(decode(mod(substr(ssn, -7, 1),2),1, '���ڻ����')) "���ڻ����" �� 31�� ������ ����
--count �Լ��� null�� ���� ���� counting �Ѵ�.
--count(*) null�� ������ counting.
--COUNT(*)�� ������ ��� �׷��Լ��� NULL�� �����ϱ� ������ NVL �Լ��� �̿��Ͽ� NULL���� �ٸ� ������ ġ�ѽ��� �־�� �Ѵ�.
select count(comm), count(sal), count(mgr), count(*)  
from emp;

select sum(comm) , count(comm)
     , sum(comm)/count(comm) 
     , sum(comm)/count(*) -- sum(comm)�� null�� ������ �͵��� �� ��.
     , avg(comm) -- avg() null�� ������ ����� ����.
from emp;

select decode(mod(substr(ssn, -7, 1),2), 1, 'O', 'X')
--select decode(mod(substr(ssn, -7, 1),2), 1, 'O') 'X'�� ���� ���ڴ� NULL�� ������. 'O'�� NULL�� ������ �ʰڴٴ� �ǵ��� ����Ѵ�.
select count (decode(mod(substr(ssn, -7, 1),2), 1, 'O')) -- COUNT�� NULL�� ���� COUNTING �ϱ� ������ 31�� ��µȴ�.
from insa;
-----------------------------------------------------
union set ������ ��� Ǯ��
select '��ü�����', count(*)
from insa
union
select '���ڻ����', count(*)
from insa
where mod(substr(ssn, -7, 1),2) = 1
union
select '���ڻ����', count(*)
from insa
where mod(substr(ssn, -7, 1),2) = 0;
-----------------------------------------------------
--[�߰� Ǯ��] EMP ���̺��� �� �μ��� ����� + �� �ο��� ������ ���
--ORA-01789: query block has incorrect number of result columns
--��� ���� ���� �߸� �Ǿ��ٴ� ����
--union ����� �� ������ �� : ���� ���� �����

select deptno, count(*)
from emp
group by deptno
union
select null, count(*)
from emp
order by deptno;
--------------------------
--[���� ����] ����� �������� �ʴ� 40�� �μ��� 0���� ��� ��ü�� ���� �ʴµ�
-- �Ʒ�ó�� ����ϱ⸦ ���ϸ� ���?
10	3
20	3
30	6
40  0
	12
    
--ORA-00937: not a single-group group function
select
    count(*)
    , COUNT (decode(deptno, 10, 'O') )"10�� �����"
    , COUNT (decode(deptno, 20, 'O') )"20�� �����"
    , COUNT (decode(deptno, 30, 'O') )"30�� �����"
    , COUNT (decode(deptno, 40, 'O') )"40�� �����" 
from emp;

-- �Ǻ�(pivot) ��� : [1]ó�� ���η� ��� �� ���� [2]ó�� ���η� �ٲٴ� ��
--[1]
20
30
30
20
30
30
10
10
30
30
20
--
--[2]
  COUNT(*)    10�� �����    20�� �����    30�� �����    40�� �����
---------- ---------- ---------- ---------- ----------
        12          3          3          6          0
-----------------------------------------------------
-- 2. insa ���̺��� �� �μ��� �޿��� ���� ���� �޴� ����� pay�� ���
-- 1) UNION ALL ����ؼ� Ǯ��

select name, basicpay + sudang
from insa
where buseo = '�ѹ���' 
and basicpay + sudang >= all(select basicpay + sudang
                          from insa 
                          where buseo = '�ѹ���');
                          
and basicpay + sudang >= (select max(basicpay + sudang) 
                          from insa 
                          where buseo = '�ѹ���');
union
:
:
-----------------------------------------------------
-- 2) GROUP BY  ����ؼ� Ǯ��
--ORA-00979: not a GROUP BY expression
--basicpay + sudang �� max �����Լ� �ȽἭ ����
select buseo, max(basicpay + sudang)
from insa
group by buseo;
-----------------------------------------------------
-- 3) ��� �������� ����ؼ� Ǯ��
select buseo, basicpay + sudang
from insa
where basicpay + sudang = �� �ش�μ� �ְ� �޿���;
---------------
select buseo, basicpay + sudang
from insa m
where basicpay + sudang = (select max(basicpay + sudang)
                           from insa 
                           where buseo = m.buseo);
-----------------------------------------------------
--3. �̹� ����  �� �ϱ��� �ִ� �� ����ϼ���. 
-- �ش� ��¥�� ������ ��¥�� �������� �Լ� : last_day()
-- ������ ��¥(��) : to_char() ��¥ -> ��,��,[��],�ð�,��,�� �������·� ��ȯ
--                 extract() ���� ���·� ��ȯ
select sysdate
      , last_day(sysdate)
      , to_char(last_day(sysdate), 'dd')
      , to_extract(day from last_day(sysdate)) -- ������
from dual;
-----------------------------------------------------
-- 4. ���� �� �������� �ް����̴�.. �� ���ΰ��� ? 
select sysdate
       , next_day(sysdate, '������')
from dual;
-----------------------------------------------------
--5. emp ���̺��� �� ������� �Ի����ڸ� �������� 10�� 5���� 20��° �Ǵ� �� ? 

select ename, hiredate
     , hiredate + 20
     , add_months(hiredate, 10*12 +5) + 20 -- 10�� 5���� 20��°
from emp;

��¥ - ��¥ = �ϼ�
��¥ + ���� = ��¥
��¥ - ���� = ��¥
��¥ + �ð� = ��¥
      ����/24
-----------------------------------------------------
--6.  insa���̺��� 1001, 1002 ����� �Ի����� ��/�� �� ���� ��¥�� �����ϴ� ������ �ۼ�   
--1001�� 1002�� �Ի����� Ȯ��
select num, name, ibsadate
from insa
where num in ( 1001, 1002 );
--
select num, name
     , ibsadate
     , to_char (ibsadate, 'yy')
     , substr (ibsadate, 1, 2)
from insa
where num in ( 1001, 1002 );
-- to_char() , extract() �� �� �ϳ� ���
select sysdate
      , to_char (sysdate, 'mm') �� --�� --'08'
      , to_char (sysdate, 'dd') �� --�� --'30'
from dual;
-- ��¥ �����ϴ� ����
update insa  
set ibsadate =  '98/08/30'
where num in ( 1001, 1002 );
commit;
--
update insa  
set ibsadate =  to_char (ibsadate, 'yy') || '/' || to_char (sysdate, 'mm') || '/' ||to_char (sysdate, 'dd') --'98/08/30'
where num in ( 1001, 1002 );
--2�� �� ��(��) ������Ʈ�Ǿ����ϴ�.
commit;
--Ŀ�� �Ϸ�.
-----------------------------------------------------
--[������� �����ϱ�]
update insa  
set ssn = substr(ssn,0,2) || to_char(sysdate, 'mmdd')||substr(ssn,7)
where num in ( 1001, 1002 );
--2�� �� ��(��) ������Ʈ�Ǿ����ϴ�.
commit;
--Ŀ�� �Ϸ�.


-----------------------------------------------------
--6-2.  insa���̺��� ����('2023.08.30')�� �������� �Ʒ��� ���� ����ϴ� ���� �ۼ�.  
-- ���� ��¥ ���� 0830 - ���Ͽ���  =  ���(���� ����) or 0(���� ����) or ����(���� ��)
select num, name, ssn
--      ,to_char (sysdate, 'mmdd') t_md
--      ,substr(ssn,3,4) b_md
--      ,to_char (sysdate, 'mmdd') - substr(ssn,3,4)
      ,sign(to_char (sysdate, 'mmdd') - substr(ssn,3,4)) s
      ,decode ( sign(to_char (sysdate, 'mmdd') - substr(ssn,3,4))
                , -1 , '���� ��' , 1 , '���� ��', '���� ����') d
from insa;

-- sign()�� ����� -1�̸� ���� ������ ���� ��, 0�̸� ���� ����, 1�̸� ���� ���� ��
-----------------------------------------------------
-- 6-3. insa���̺��� ����('2023.08.30')�������� �� ���� ������ �����,���� �����, �� ���� ������� ����ϴ� ���� �ۼ�. 

with temp as (
      select  num, name, ssn
             ,sign(to_char (sysdate, 'mmdd') - substr(ssn,3,4)) s      
      from insa
)
select  count (decode (s, -1, 'O')) "���� �� ��� ��"
       ,count (decode (s, 1, 'O')) "���� �� ��� ��"
       ,count (decode (s, 0, 'O')) "���� ���� ��� ��"
       ,count(*)
from temp;
-----------------------------------------------------
--9. ������ ���Ϸκ��� ���ñ��� ��ƿ� �ϼ�, ������, ����� ����ϼ���.
--'1994.03.14'
select ceil(abs(sysdate - to_date('1994.03.14'))) -- ��ƿ� �� ��
      ,round (months_between(sysdate, to_date('1994.03.14')),2) -- ��ƿ� ���� ��
      ,round (months_between(sysdate, to_date('1994.03.14'))/12,2) -- ��ƿ� ���
from dual;
-----------------------------------------------------
-- 10. IW�� WW �� ������. (����صα�)
-- ���� ���� : w
select sysdate
      , to_char(sysdate, 'w')
from dual;
-- ���� ���� : ww, iw
ww : 7�ϸ��� ���� ������ �Ѿ��
iw : �Ͽ��Ͽ��� �����Ϸ� �Ѿ�� ���� ������ �Ѿ��.


select to_char(to_date('2022.1.1'), 'iw') --52����
      ,to_char(to_date('2022.1.1'), 'ww') -- 1����
      ,to_char(to_date('2022.1.2'), 'iw') --52����
      ,to_char(to_date('2022.1.2'), 'ww') -- 1����
      ,to_char(to_date('2022.1.3'), 'iw') -- 1����
      ,to_char(to_date('2022.1.3'), 'ww') -- 1����
      ,to_char(to_date('2022.1.8'), 'iw') -- 1����
      ,to_char(to_date('2022.1.8'), 'ww') -- 2����
from dual;
-----------------------------------------------------
--11-1. �̹� ���� �� �ϱ��� �ִ� Ȯ��.
select sysdate
      ,last_day(sysdate)
      ,to_char(last_day(sysdate), 'dd') --31
      ,add_months(sysdate, 1) 
      ,trunc(add_months(sysdate, 1) , 'year') --2023/01/01
      ,trunc(add_months(sysdate, 1) , 'month') --2023/09/01
      ,trunc(add_months(sysdate, 1) , 'mm')-1 --2023/09/01
from dual;
-----------------------------------------------------
-- [����]
-- ORA-01861: literal does not match format string : ���� ���� ������ ��ġ�ϴ� ���� ����.
select to_date('2022', 'yyyy') --22/08/01
      ,to_date('2022.02', 'yyyy.mm') --22/02/01
      ,to_date('03', 'mm') --23/03/01
from dual;
-----------------------------------------------------
-- 11-2. ������ ���� �� ° ��, ���� �� °������ Ȯ��.
select sysdate
,to_char(sysdate, 'w')
,to_char(sysdate, 'iw')
,to_char(sysdate, 'ww')
from dual;
-----------------------------------------------------
-- 12. emp ����  pay �� NVL(), NVL2(), COALESCE()�Լ��� ����ؼ� ����ϼ���.
select ename
      ,sal + nvl(comm, 0) pay
      ,sal + nvl2(comm,comm,0) pay
      ,coalesce(sal + comm, sal, 0) pay
from emp;
-----------------------------------------------------
--12-2. emp���̺��� mgr�� null �� ��� -1 �� ����ϴ� ���� �ۼ�
      ��. nvl()
      ��. nvl2()
      ��. COALESCE()
select ename
      , nvl(comm, -1) pay
      , nvl2(comm,comm,-1) pay
      ,coalesce(mgr, -1) pay
from emp;
-----------------------------------------------------
--13. insa ����  �̸�,�ֹι�ȣ, ����( ����/���� ), ����( ����/���� ) ��� ���� �ۼ�
    ��. DECODE()
    ��. CASE()
    select name, ssn
          ,decode(mod(substr(ssn, -7,1),2),1,'����','����') ����
          -- case()����
--          ,case �÷��� �Ǵ� ǥ����
--                when ���� then ��
--                when ���� then ��
--                :
--                :
--                else ��
--        [case ���� ù��°]
          ,case mod(substr(ssn, -7,1),2)
                 when 1 then '����'
                 --when 0 then '����'
                 else        '����'
           end gender
--        [case ���� �ι�°]           
         ,case 
                 when mod(substr(ssn, -7,1),2) = 1 then '����'
                 else '����'
          end gender
    from insa;
--decode() �� Ȯ��� �Լ��� case() �Լ��̴�.
-----------------------------------------------------
--6-2. case() ��� 
--insa���̺��� ����('2023.08.30')�� �������� �Ʒ��� ���� ����ϴ� ���� �ۼ�.  
--���� ��¥ ���� 0830 - ���Ͽ���  =  ���(���� ����) or 0(���� ����) or ����(���� ��)

select num, name, ssn
      ,to_char (sysdate, 'mmdd') - substr(ssn,3,4)
      ,case
            when (to_char (sysdate, 'mmdd') - substr(ssn,3,4)) > 0 then '���� ��'
            when (to_char (sysdate, 'mmdd') - substr(ssn,3,4)) < 0 then '���� ��'
            else '���� ����'
       end 
from insa;
-----------------------------------------------------
--14. emp ���� ���PAY ���� ���ų� ū ����鸸�� �޿����� ���.
--��ü ������� �� �޿��� �� : 27,125
select to_char (sum (sal + nvl(comm, 0)), 'L999,999') sum_pay
from emp;

--��� �޿�(PAY) :2260.42
select to_char(avg (sal + nvl(comm, 0)), '9999.00' ) avg_pay
from emp;

--decode() ���

with a as (
    select to_char(avg (sal + nvl(comm, 0)), '9999.00' ) avg_pay
    from emp
),
b as (
    select empno, ename, sal + nvl(comm, 0) pay
    from emp
)
select *
from b , a -- join �ϰڴٴ� ��
where b.pay >= a.avg_pay ; -- ORA-00904: "A"."AVG_PAY": invalid identifier : join ���ؼ� �ν����� ����
-----------------------------------------------------
--14. emp ���� ���PAY ���� ���ų� ū ����鸸�� �޿����� ���.
--��ü ������� �޿� : 18925
select sum(t.pay)
from(
select empno, ename, sal + nvl(comm, 0) pay
from emp
where sal + nvl(comm, 0) >= (select avg (sal + nvl(comm, 0)) avg_pay
                             from emp
                             )
) t;
-----------------------------------------------------
--14. emp ���� ���PAY ���� ���ų� ū ����鸸�� �޿����� ���. --18925
--decode() ���

-- ORA-00937: not a single-group group function
with temp as (
select empno, ename
      , sal + nvl(comm, 0) pay
      , (select avg(sal + nvl(comm, 0)) from emp) avg_pay
from emp
)
select sum (decode (sign(t.pay - t.avg_pay), -1 ,null, t.pay ))
from temp  t;
-----------------------------------------------------
--case() ���
with temp as (
select empno, ename
      , sal + nvl(comm, 0) pay
      , (select avg(sal + nvl(comm, 0)) from emp) avg_pay
from emp
)
select sum (decode (sign(t.pay - t.avg_pay), -1 ,null, t.pay ))
      ,sum (
          case 
                when t.pay - t.avg_pay >= 0 then t.pay 
                else                              NULL
          end
           )
from temp  t;
-----------------------------------------------------
--15. emp ����  ����� �����ϴ� �μ��� �μ���ȣ�� ���

--����� �����ϴ� �μ��� �μ���ȣ ��ȸ. 
select *
FROM dept;
--[���]
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON

-- ��� ����� �ݵ�� 1���� �μ��� �Ҽ��̴�.
select deptno
from emp;

-- ���� ����� �μ��߷� ������ �Ҽӵ� �μ��� ���� ���� �ִ�.
-- 7839 king�� ���Ի������ ����
update emp
set deptno = null
where empno = 7839;

select distinct deptno
from emp
order by deptno;

rollback;
-----------------------------------------------------
--15-2. emp ����  ����� �������� �ʴ�  �μ��� �μ���ȣ�� ���
--10,20,30,[40]
select deptno
from dept
minus 
select distinct deptno
from emp;
-----------------------------------------------------
--����(JOIN)--
--��) emp ���̺��� �μ���ȣ, �μ���, �����ȣ, �����, �Ի����� ��ȸ 

--ORA-00904: "DNAME": invalid identifier
select deptno, dname, empno, ename, hiredate -- dname �� �߰��ؼ� ����ϰ� ������.
from emp;

desc emp; --emp ���̺� dname Į���� �������� �ʴ´�.

desc dept;-- dept���̺� dname Į�� ����.

-- [�ǹ���] ���ʿ� ���̺� �����Ҷ� 
-- emp���̺� empno, ename, job, hiredate,... , deptno, dname,loc �� ��������� �ƴµ� �� �ɰ�����

-- [RDBMS] 
-- [���]    <----   �ҼӰ���   ---->     [�μ�]


-- �̻����� ���Ÿ� '����ȭ' ��� �Ѵ�. (���� �𵨸�)
-- �����ͺ��̽� �𵨸��Ҷ� �̻����� ������ ���̺��� �ɰ���.

-- ����Ű(�����ȣ)     dname�� loc�� ����Ű�� �������� �ʰ� �μ���ȣ(deptno)�� ������(����ȭ�� �����) -- �׷��� dept�� �߶� �Ʒ�ó�� dept ����
                                                                                            dept   ������  �λ�
                                                                                             10           �λ�
                                                                                             10           �λ�                                                                                            
                                                                                             10           �λ�                                                                                            
                                                                                             
--                   ����Ű(dept ����Űpk�� �����Ѵ�.)
-- empno  ename  ... deptno, dname, loc
1                     10     ������  ����  -- �������� ������ �ٸ�����(�뱸, ���)�� �ٲ�� �����Ҷ� �ȹٲ�� �͵��� �ִ� �̻������� ���� 
2                     10     ������  ����
3                     10     ������  ����
4                     10     ������  ����
5                     10     ������  ����
6
7
8
:
:
��� ��õ������ ����

-----------------------------------------------------
-- 1) join �Ҷ� ó���� ���̺��� ���谡 �ξ��� �ִ� ���� Ȯ���ؾ� ��.
select
from emp, dept -- �� ���̺� join
where ���� ������; --�� ���̺��� � �������� join
-----------------------------------------------------
--2)
-- ORA-00918: column ambiguously defined : �÷��� ��ȣ�ϰ� ����Ǿ���.
select deptno, dname, empno, ename, hiredate --deptno�� emp���� �ְ� dept���� �־ �������� ��Ű���� �־����.
from emp, dept
where dept.deptno = emp.deptno;
-----------------------------------------------------
--3)
select dept.deptno, dname, empno, ename, hiredate --dept.deptno(d.deptno)�� emp.deptno�� �ص� �ȴ�.
from emp e, dept d  -- e, d alias
where d.deptno = e.deptno;
-----------------------------------------------------
-- 3)�� JOIN ON �������� ������.
select d.deptno, dname, empno, ename, hiredate
from emp e join dept d
ON d.deptno = e.deptno;
-----------------------------------------------------
--emp ���̺��� model Ŭ���ؼ� ���� Ȯ��
--15-2. emp ����  ����� �������� �ʴ�  �μ��� �μ���ȣ�� ���
--join ����ؼ� �ٽ� Ǯ��
select d.deptno --join�� �ǹ̰� ���� emp�ε� ��ȸ�� �����ؼ�
from dept d join emp e ON d.deptno = e.deptno;
-----------------------------------------------------
select d.deptno , count(*)
from dept d join emp e ON d.deptno = e.deptno
group by d.deptno;
----------------- inner �߰�
select d.deptno , count(*)
from dept d inner join emp e ON d.deptno = e.deptno
group by d.deptno;
-----------------------------------------------------
select deptno, count(*)
from emp
group by deptno;
[���]
30	6
20	3
10	3

[���ϴ� ���] -- 40�� ��ȸ�ϰ� ����
40  0
30	6
20	3
10	3

select d.deptno , count(*)
from dept d left outer join emp e ON d.deptno = e.deptno
group by d.deptno;
[���]
10	3
20	3
30	6
40	1 ...? --count(*)�� ���ؼ� null���� 1�� counting �Ǿ���.
-----------------------------------------------------count ����
select d.deptno , count(e.empno)
from dept d left outer join emp e ON d.deptno = e.deptno
group by d.deptno
order by d.deptno;
-----------------------------------------------------
--0�� ��  ã��
select d.deptno , count(e.empno)
from dept d left outer join emp e ON d.deptno = e.deptno
-- where count(e.empno)=0 ������ ��������
group by d.deptno
HAVING count(e.empno) = 0 --GROUP BY�� �ϰ� �� ���� ������.
order by d.deptno;
----------------------------------------------------- dname �߰� �Ϸ��� group by��!
-- ���� ��ü �ϱ��ϱ� -����...
select d.deptno , dname -- , count(e.empno)
from dept d left outer join emp e ON d.deptno = e.deptno
-- where count(e.empno)=0 ������ ��������
group by d.deptno, dname
HAVING count(e.empno) = 0 --GROUP BY���� ������.(group by�� ������� ���� ������)
order by d.deptno;
-----------------------------------------------------
--ORA-00979: not a GROUP BY expression
select buseo, jikwi, count(*) -- name x �����Լ��� ������ �Ϲ� �Լ��� �ݵ�� group by���� �־�� �Ѵ�.
from insa
group by buseo --, jikwi
order by buseo, jikwi;
-----------------------------------------------------
-- 16. �Ʒ� �ڵ���  DECODE()�� ����ؼ� ǥ���ϼ���.
    ��. [�ڹ�]
        if( A == B ){
           return X;
        }
    
    decode(a,b,x)
    
    ��. [�ڹ�]
        if( A==B){
           return S;
        }else if( A == C){
           return T;
        }else{
           return U;
        }
    
    decode(a,b,s,c,t,u)
      
    
    ��.  [�ڹ�]
        if( A==B){
           return XXX;
        }else{
           return YYY;
        }
        
        decode(a,b,xxx,yyy)
-----------------------------------------------------
-- 17. emp ���̺��� 10�� �μ�������  �޿� 15% �λ�
--                20�� �μ������� �޿� 10% �λ�
--                30�� �μ������� �޿� 5% �λ�
--                40�� �μ������� �޿� 20% �λ�
--  �ϴ� ���� �ۼ�. 

select deptno, ename, sal + nvl(comm, 0)
      ,decode(deptno, 10, 15, 20, 10, 30, 5, 40, 20) || '%' "�λ��"
      --,-- decode
      ,(sal + nvl(comm, 0)) * ( decode ( deptno, 10, 0.15, 20, 0.1, 30, 0.05, 40, 0.2 )) "�λ��"
      --,-- case
      ,(sal + nvl(comm, 0)) * (case deptno
                                when  10 then 0.15 
                                when  20 then 0.1
                                when  30 then 0.05
                                when  40 then 0.2
                                --else           
                                end) "�λ��"
from emp;
-----------------------------------------------------
--18. emp ���̺��� �� �μ��� ������� ��ȸ�ϴ� ����
--( ��Ʈ :  DECODE, COUNT �Լ� ��� )  

select count(decode(deptno,10,0)) "10�� �μ�"
     , count(decode(deptno,20,0)) "20�� �μ�"
     , count(decode(deptno,30,0)) "30�� �μ�"
     , count(*) "�� �����"
from emp;
--------------------------------------------------------------------------------
    select deptno, count(deptno)
    from emp
    group by deptno
    order by deptno;
--------------------------------------------------------------------------------
    select 
    from (select deptno 
          from emp 
          where deptno = 10)e;
    
