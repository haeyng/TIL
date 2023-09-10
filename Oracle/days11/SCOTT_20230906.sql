
--JOIN : �� �� �̻��� ���̺��� ���� -> ��ȸ
--JOIN ���� : EJ, NEJ, IJ, OJ(L,R,F), SJ, CJ, AJ, SJ

--����) åID, å����, �ܰ�, �Ǹż���, ����(��), �Ǹűݾ� ��ȸ

-- BOOK : [B_ID], TITLE
-- DANGA : [B_ID], PRICE
-- PANMAI : [B_ID], [G_ID] FK , P_SU   �ڽ����̺�
-- GOGAEK :         [G_ID] PK , G_NAME �θ����̺�
-- �Ǹűݾ� : PRICE * P_SU

SELECT B.B_ID, TITLE, PRICE , P_SU , G_NAME, PRICE * P_SU "�Ǹűݾ�"
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
            JOIN PANMAI P ON B.B_ID = P.B_ID
            JOIN GOGAEK G ON P.G_ID = G.G_ID;

--------------------------------------------------------------------------------
--[����] ���ǵ� å���� ���� �� �� ���� �ǸŵǾ����� ��ȸ
-- (åID, å����, ���ǸűǼ�, �ܰ�)

--BOOK : B_ID, TITLE
--DANGA : PRICE
--�� �Ǹ� �Ǽ� P_SU �� ��


SELECT B.B_ID, TITLE     
     , PRICE
--   , SUM(P_SU) "���ǸűǼ�" ORA-00979: not a GROUP BY expression
     , SUM(P_SU) "���ǸűǼ�"
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
            JOIN PANMAI P ON B.B_ID = P.B_ID
GROUP BY b.b_id, TITLE, PRICE
ORDER BY b.b_id;
--------------------------------------------
--�ߺ��� �����͵� ��ȸ�ȴ�.
select b.b_id, title, price, p_su
    ,(select sum(p_su) from panmai where b_id = b.b_id) ���ǸűǼ�
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
            JOIN PANMAI P ON B.B_ID = P.B_ID;
--------------------------------------------------------------------------------
--[����] å �Ǹŵ� ���� �ִ� åID, ���� ��ȸ
-- �Ǹ����̺� ��ȸ

SELECT B.B_ID, TITLE, PRICE
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
WHERE B.B_ID IN(
SELECT DISTINCT B_ID
FROM PANMAI);


--[����] å�� �ѹ��� �Ǹŵ� ���� ���� åID, ���� ��ȸ
--[ANTI JOIN]
SELECT B.B_ID, TITLE, PRICE
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
WHERE B.B_ID NOT IN(
SELECT DISTINCT B_ID
FROM PANMAI);
----------------------------------
WITH E AS (
SELECT b.B_ID as b_id, title, price 
,SUM(p_su) ���Ǹż�
FROM book b  
LEFT JOIN danga d ON b.b_id = d.b_id
LEFT JOIN PANMAI p ON b.b_id = p.b_id
GROUP BY b.B_ID, title, price)
SELECT E.b_id, E.title
FROM E
WHERE E.���Ǹż� IS NULL;
--------------------------------------------------------------------------------
--[����] ���ǵ� å���� ���� �� �� ���� �ǸŵǾ����� ��ȸ
-- (åID, å����, ���ǸűǼ�, �ܰ�)
-- �Ǹŵ� ���� ���� å�� 0���� �����ؼ� ���
-- INNER JOIN�� ���� ���̺��� �������ΰ͸� ��ȸ��
-- �Ǹ������� ������� ý ������ ��� ��µǰ� �ؾ��� -> OUTER JOIN ����ؾ���
SELECT B.B_ID, TITLE , PRICE, NVL( SUM(P_SU), 0 ) "���ǸűǼ�"   
FROM BOOK B LEFT OUTER JOIN DANGA D ON B.B_ID = D.B_ID
            LEFT OUTER JOIN PANMAI P ON B.B_ID = P.B_ID
GROUP BY b.b_id, TITLE, PRICE
ORDER BY b.b_id;
-- BOOK�� DANGA ���̺� IJ/L OJ
SELECT B.B_ID, TITLE, PRICE
FROM BOOK B LEFT OUTER JOIN DANGA D ON B.B_ID = D.B_ID;
--------------------------------------------------------------------------------
--[����] ���� �ǸűǼ��� ���� å�� ���� ������ ���
--(B_ID, TITLE, ���ǸűǼ�)

--[����] �ǸűǼ��� TOP 3�� å�� ���� ������ ���
--(B_ID, TITLE, ���ǸűǼ�)

--1)TOP-N �м� ���

SELECT T.*
FROM(
    SELECT B.B_ID, TITLE     
         , PRICE
         , SUM(P_SU) "���ǸűǼ�"
    FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
                JOIN PANMAI P ON B.B_ID = P.B_ID
    GROUP BY b.b_id, TITLE, PRICE
    ORDER BY ���ǸűǼ� DESC
)T
WHERE ROWNUM <= 3;
WHERE ROWNUM = 1;
--WHERE ROWNUM BETWEEN 3 AND 5; XX

--2) RANK ���� �Լ�
WITH T AS(
SELECT B.B_ID, TITLE     
         , PRICE
         , SUM(P_SU) "���ǸűǼ�"
         , RANK() OVER(ORDER BY SUM(P_SU)DESC) "�Ǹż���"
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
            JOIN PANMAI P ON B.B_ID = P.B_ID
GROUP BY b.b_id, TITLE, PRICE
)
SELECT *
FROM T
WHERE �Ǹż��� <= 3;
WHERE �Ǹż��� = 1;
--------------------------------------------------------------------------------
--[����] �⵵�� ���� �Ǹ� ��Ȳ ��ȸ.
-- �Ǹų⵵, �Ǹſ�, �Ǹűݾ�(P_SU * PRICE)
--PANMAI : P_DATE (�Ǹų⵵, �Ǹſ�), P_SU
--DANGA : PRICE
--GROUP BY �Ǹų⵵ + �Ǹűݾ� ����

SELECT TO_CHAR(P.P_DATE,'YYYY') "�Ǹų⵵"
      ,TO_CHAR(P.P_DATE,'MM') "�Ǹſ�"
      ,SUM(P.P_SU * D.PRICE) "�Ǹűݾ�"
FROM PANMAI P JOIN DANGA D ON P.B_ID = D.B_ID
GROUP BY TO_CHAR(P_DATE,'YYYY'), TO_CHAR(P.P_DATE,'MM')
ORDER BY �Ǹų⵵, �Ǹſ�;

[���]
2000	03	6000
2000	07	1600
2000	10	10500
2023	09	41661
--------------------------------------------------------------------------------
--[����] �⵵��, ������(��) �Ǹ���Ȳ ��ȸ
-- �⵵/����ID/������/���Ǹűݾ�

--PANMAI : P_DATE, P_SU
--GOGAEK : G_ID, G_NAME
--DANGA : PRICE
--�Ǹűݾ�(P_SU * PRICE)

SELECT TO_CHAR(P.P_DATE,'YYYY') "�Ǹų⵵"
     , G.G_ID
     , G.G_NAME
     , SUM(P.P_SU * PRICE) "�Ǹűݾ�"
FROM PANMAI P JOIN GOGAEK G ON P.G_ID = G.G_ID
              JOIN DANGA D ON P.B_ID = D.B_ID
GROUP BY TO_CHAR(P_DATE,'YYYY'), G.G_ID, G.G_NAME
ORDER BY TO_CHAR(P_DATE,'YYYY'), G.G_NAME;
--------------------------------------------------------------------------------
--[����] ���� ������ �Ǹ���Ȳ

--1) ���� - G_ID, g_NAME, ���Ǹűݾ���(SUM(P_SU,PRICE))
SELECT  G.G_ID "�����ڵ�"
      , G_NAME "������"
      , SUM(P.P_SU * D.PRICE) "���ؼ������Ǹűݾ�"
      ,(SELECT SUM(P.P_SU * PRICE) "�������Ǹž�"
        FROM PANMAI P JOIN DANGA D ON P.B_ID = D.B_ID
        WHERE TO_CHAR(P_DATE,'YYYY') = TO_CHAR(SYSDATE,'YYYY')
        ) "�������Ǹž�"
FROM PANMAI P JOIN GOGAEK G ON P.G_ID = G.G_ID
              JOIN DANGA D ON P.B_ID = D.B_ID
WHERE TO_CHAR(P_DATE,'YYYY') = TO_CHAR(SYSDATE,'YYYY')
GROUP BY G.G_ID, G_NAME ;

--2) �������Ǹž�
SELECT SUM(P.P_SU * PRICE) "�������Ǹž�"
FROM PANMAI P JOIN DANGA D ON P.B_ID = D.B_ID
WHERE TO_CHAR(P_DATE,'YYYY') = TO_CHAR(SYSDATE,'YYYY');

--3)

WITH T AS(
SELECT  G.G_ID "�����ڵ�"
      , G_NAME "������"
      , SUM(P.P_SU * D.PRICE) "���ؼ������Ǹűݾ�"
      ,(SELECT SUM(P.P_SU * PRICE) 
        FROM PANMAI P JOIN DANGA D ON P.B_ID = D.B_ID
        WHERE TO_CHAR(P_DATE,'YYYY') = TO_CHAR(SYSDATE,'YYYY')
        ) "�������Ǹűݾ�"
FROM PANMAI P JOIN GOGAEK G ON P.G_ID = G.G_ID
              JOIN DANGA D ON P.B_ID = D.B_ID
WHERE TO_CHAR(P_DATE,'YYYY') = TO_CHAR(SYSDATE,'YYYY')
GROUP BY G.G_ID, G_NAME 
)
SELECT �����ڵ�, ������, ���ؼ������Ǹűݾ�
      ,ROUND(���ؼ������Ǹűݾ�/�������Ǹűݾ�*100) || '%'
FROM T;

--------------------------------------------------------------------------------
--[����] å�� �� �Ǹűݾ��� 15000�� �̻� �ȸ� å�� ������ ��ȸ
--(åID, ����, �ܰ�, ���ǸűǼ�, ���Ǹűݾ�)
--BOOK : B_ID, TITLE
--DANGA : PRICE
--PANMAI : P_SU , ���Ǹűݾ�(P_SU*PRICE)
SELECT B.B_ID, TITLE, PRICE
      ,SUM(P_SU) "���ǸűǼ�"
      ,SUM(P_SU*PRICE) "���Ǹűݾ�"
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
            JOIN PANMAI P ON B.B_ID = P.B_ID
GROUP BY B.B_ID, TITLE, PRICE
HAVING SUM(P_SU*PRICE) >= 15000;


--[����] �� �ǸűǼ��� 10�� �̻� �Ǹŵ� å�� ���� ��ȸ(-HAVING ��)--------------�ڡڡڡڡڡڡ�
--(åID, ����, ����, ���Ǹŷ�)
--BOOK : B_ID, TITLE
--DANGA : PRICE
--PANMAI : P_SU
SELECT B.B_ID, TITLE, PRICE
      ,SUM(P_SU) "���Ǹŷ�"
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
            JOIN PANMAI P ON B.B_ID = P.B_ID
GROUP BY B.B_ID, TITLE, PRICE
HAVING SUM(P_SU)) >= 10;
--------------------------------------------------------------------------------
--VIEW ��
-- FROM ���̺� �Ǵ� ��
-- USER_TABLES, USER_CONSTRAINTS, USER_USERS --> ��
--1) �������̺� : �Ѱ� �̻��� ���̺� �Ǵ� �並 ���ؼ� ��������� ���� ���̺�
--2) ��ü ������ �߿��� �Ϻθ� ������ �� �ֵ��� �����ϱ� ���� ���.
--3) ��� ������ ���� ���̺� �信 ���� ����.

--���� Ȯ��
SELECT *
FROM USER_SYS_PRIVS;


--�� ����
--�Ź� ���� ��ȸ�ϴ� ���� ���.

SELECT B.B_ID, TITLE, PRICE , P_SU , G_NAME, PRICE * P_SU
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
            JOIN PANMAI P ON B.B_ID = P.B_ID
            JOIN GOGAEK G ON P.G_ID = G.G_ID;

--��
CREATE TABLE
CREATE USER
CREATE TABLESPACE
-- �ܼ���(X), ���պ�(O) DML���� ����� �� ������ �������̴�.
CREATE OR REPLACE VIEW panView --OR REPLACE ������ �並 �����ϰ� ������ ����
AS
--(
SELECT B.B_ID, TITLE, PRICE ,G.G_ID, G_NAME ,P_DATE, P_SU
       ,P_SU * PRICE amt
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
            JOIN PANMAI P ON B.B_ID = P.B_ID
            JOIN GOGAEK G ON P.G_ID = G.G_ID
order by p_date desc
--ORA-00907: missing right parenthesis
--)
;
--View PANVIEW��(��) �����Ǿ����ϴ�.
-- ����, ���ȼ��� �����̴�.
SELECT *
FROM PANVIEW;

DESC PANVIEW;


-- �並 �̿��� ���Ǹűݾ�
select sum(amt)
FROM panview;

--�� : DB ��ü, ���� ��ü�� ����ȴ�.
--�� �ҽ� Ȯ���ϱ�
SELECT TEXT
FROM USER_VIEWS; --������ Ȯ���� �� ����

--�� ������ ���� CREATE OR REPLACE VIEW �ٽ� �����ϸ� ������.
--�� ����
DROP VIEW panview;
--View PANVIEW��(��) �����Ǿ����ϴ�.
--------------------------------------------------------------------------------
--[����] �⵵, ��, ���ڵ�, ����, �Ǹűݾ���(�⵵�� ����)�� ��� �ۼ�.
--(�⵵, �� ��������)
panmai - p_date
gogaek - g_id, g_name
danga - price

select to_char(p_date,'yyyy') �Ǹų⵵
      ,to_char(p_date,'mm') �Ǹſ�
      ,g.g_id
      ,g_name
      --,p_su ,price
      ,sum(p_su * price) ���Ǹűݾ�
from panmai p join gogaek g on p.g_id = g.g_id
              join danga d on p.b_id = d.b_id
group by to_char(p_date,'yyyy') 
        ,to_char(p_date,'mm')
        ,g.g_id
        ,g_name
order by 1,2;
-------------------------------------
CREATE OR REPLACE FORCE VIEW gogaekView
AS
select to_char(p_date,'yyyy') �Ǹų⵵
      ,to_char(p_date,'mm') �Ǹſ�
      ,g.g_id
      ,g_name
      --,p_su ,price
      ,sum(p_su * price) ���Ǹűݾ�
from panmai p join gogaek g on p.g_id = g.g_id
              join danga d on p.b_id = d.b_id
group by to_char(p_date,'yyyy') 
        ,to_char(p_date,'mm')
        ,g.g_id
        ,g_name
order by 1,2    
;

select *
from gogaekView;
--------------------------------------------------------------------------------
--�� ����� �˻��� ��
select *
from tab --user_talbes
where tabtype = 'VIEW';

--��(view) : DML �۾� ���� (�ǽ�)
--      �� ���ú� -> ���� ���� ���̺� ����.
--      �� ���պ� x

CREATE TABLE testa (
     aid   NUMBER                      PRIMARY KEY
    ,name  VARCHAR2(20) NOT NULL
    ,tel   VARCHAR2(20) NOT NULL
    ,memo  VARCHAR2(100)
);
--Table TESTA��(��) �����Ǿ����ϴ�.

CREATE TABLE testb (
     bid NUMBER PRIMARY KEY
    ,aid NUMBER CONSTRAINT fk_testb_aid
        REFERENCES testa(aid)
        ON DELETE CASCADE
    ,score NUMBER(3)
);
--Table TESTB��(��) �����Ǿ����ϴ�.

INSERT INTO testa (aid, NAME, tel) VALUES (1, 'a', '1');
INSERT INTO testa (aid, name, tel) VALUES (2, 'b', '2');
INSERT INTO testa (aid, name, tel) VALUES (3, 'c', '3');
INSERT INTO testa (aid, name, tel) VALUES (4, 'd', '4');

INSERT INTO testb (bid, aid, score) VALUES (1, 1, 80);
INSERT INTO testb (bid, aid, score) VALUES (2, 2, 70);
INSERT INTO testb (bid, aid, score) VALUES (3, 3, 90);
INSERT INTO testb (bid, aid, score) VALUES (4, 4, 100);

COMMIT;


SELECT *
from testa;

SELECT *
from testb;

-- �ܼ��� ���� + DML �۾�
desc testa;
TEL  NOT NULL VARCHAR2(20) 

create or replace view aView
as
SELECT aid, name, memo
FROM testa;
--View AVIEW��(��) �����Ǿ����ϴ�.


--[�ܼ��並 ����ؼ� INSERT ]
INSERT INTO aView (aid, name, memo) VALUES (5, 'f', '5');
--ORA-01400: cannot insert NULL into ("SCOTT"."TESTA"."TEL")
INSERT INTO testa (aid, name, memo) VALUES (5, 'f', '5');
--ORA-01400: cannot insert NULL into ("SCOTT"."TESTA"."TEL")
-- ������ ����? tel �� not null ���������� ������ �ֱ� ������ �������ǿ� �´� ��ȿ�� ���� �־�� �Ѵ�.


--�� ����
--memo Į���� ������ ���������� not null�� �ƴϾ ����
create or replace view aView
as
SELECT aid, name, tel
FROM testa;
--View AVIEW��(��) �����Ǿ����ϴ�.

INSERT INTO aView (aid, name, tel) VALUES (5, 'f', '5');
--1 �� ��(��) ���ԵǾ����ϴ�.

commit;

delete from aView
where aid = 5;
--1 �� ��(��) �����Ǿ����ϴ�.

commit;

drop view aView;
--View AVIEW��(��) �����Ǿ����ϴ�.



--���պ� ����
create or replace view abView
as
    select 
         a.aid, name, tel --testa
       , bid, score       --testb
    from testa a join testb b on a.aid = b.aid
;
--View ABVIEW��(��) �����Ǿ����ϴ�.

insert into abView (aid, name, tel, bid, score)
            values (10,  'x' , 55 ,20  ,70);
--ORA-01779: cannot modify a column which maps to a non key-preserved table
-- �ϳ��� insert������ ���ÿ� �� ���̺��� ������ ���� insert �� �� ����.

insert into abView(aid, name, tel) values (5, 'f', '5');
--ORA-01779: cannot modify a column which maps to a non key-preserved table


--���պ並 ����ؼ� ���� : �� ���̺��� ���븸 ���� ����.
update abView
set score = 99
where bid = 1;
--1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

rollback;

--���պ並 ����ؼ� ���� : �� ���̺��� ������ ������ �� ����.


--����
delete from abView 
where aid = 1;
--1 �� ��(��) �����Ǿ����ϴ�.


select *
from testa;
select *
from testb;

-- DELETE CASCADE �ɼǿ� ���ؼ� �������ϴ� ���̺��� ������ �Ǿ�����.

rollback;



--������ 90�� �̻��� �� ����
create or replace view bView
as
    select bid, aid, score
    from testb
    where score >= 90
;
--View BVIEW��(��) �����Ǿ����ϴ�.


--bid �� 3�� ���� score = 70������ ����
update bview -- bview�� score >= 90 ���Ǹ� �������� ���� ���̺��̴�.
set score = 70 
where bid = 3;

select *
from bview;

rollback;


--������ 90�� �̻��� �� ���� + with check option constraint
create or replace view bView
as
    select bid, aid, score
    from testb
    where score >= 90
    with check option constraint ck_bView
    ;
--View BVIEW��(��) �����Ǿ����ϴ�.


select *
from bview;

--bid �� 3�� ���� score = 70������ ����
update bview
set score = 70 
where bid = 3;
--ORA-01402: view WITH CHECK OPTION where-clause violation
--üũ �������� ���� ����ȴ�.  --90�� ���Ϸδ� update �Ұ���.


--
drop view aView;
drop view bView;
drop view abView;

select *
from tab
where tabtype = 'VIEW';

drop view gogaekView;


--[MATERIALIZED VIEW (������ ��)]
--���� �����͸� ������ �ִ� ���̴�.

--[������ ����]
SELECT LEVEL
FROM dual;
--LEVEL �÷�?
--ORA-01788: CONNECT BY clause required in this query block
--CONNECT BY���� �ʿ��ϴ�.

SELECT LEVEL
FROM dual
CONNECT BY LEVEL <= 31; -- ������


SELECT *
FROM EMP;

LEVEL -> CONNECT BY -> LEVEL ���� �˻� -> [������ ����]
 LEVEL�� ������ ����(����)�� ��Ÿ�� �� ����ϴ� �ǻ� Į���̴�. CONNECT BY ���� �ݵ�� �־�� �Ѵ�.

-- 2���� ������� ���̺� <-- ������ ���� ǥ��(����, ��ȸ)
-- �ǹ� ������, ���� ������ ����
--1) ���̺� : �θ�-�ڽ� �÷� �߰�.
--2) SELECT : START WITH, CONNECT BY ������ ����ϸ� ������ ����


-- 7698�� ���Ӻ��������� ��ȸ
-- ó�� ������ start with��, connect by�� ó���ǰ� where mgr = 7698 ó�� ��
SELECT empno, ename, sal, LEVEL
FROM emp
WHERE mgr = 7698
START WITH mgr is null --������-- ��𼭺��� ����?
CONNECT BY PRIOR empno = mgr; -- empno�ڽ� = mgr�θ�  -- top-down ������� 
--         top-down ������� 


--------------------------------------------------------------------------------
create table tbl_test(
  deptno number(3) not null primary key,
  dname varchar2(24) not null,
  college number(3),
  loc varchar2(10)
  );
--Table TBL_TEST��(��) �����Ǿ����ϴ�.



                                            -- deptno / college �θ�/�ڽ� ���� �÷�
                                            -- emp / mgr �θ�/�ڽ� ���� �÷�
INSERT INTO tbl_test VALUES        ( 101,  '��ǻ�Ͱ��а�', 100,  '1ȣ��');
INSERT INTO tbl_test VALUES        (102,  '��Ƽ�̵���а�', 100,  '2ȣ��');
INSERT INTO tbl_test VALUES        (201,  '���ڰ��а� ',   200,  '3ȣ��');
INSERT INTO tbl_test VALUES        (202,  '�����а�',    200,  '4ȣ��');
INSERT INTO tbl_test VALUES        (100,  '�����̵���к�', 10 , null );
INSERT INTO tbl_test VALUES        (200,  '��īƮ�δн��к�',10 , null);
INSERT INTO tbl_test VALUES        (10,  '��������',null , null);
COMMIT;

select *
from tbl_test;
--
select deptno, dname, college, LEVEL
from tbl_test
start with deptno = 10
connect by prior deptno = college;


--
select LPAD('��',(LEVEL-1)*3) || dname 
from tbl_test
start with dname = '��������'
connect by prior deptno = college;
--------------------------------------------------------------------------------
--[������������ ���� ���� ���]

--WHERE ���� ����� ������ ������ ��� 
SELECT deptno,college,dname,loc,LEVEL
  FROM tbl_test
  WHERE dname != '�����̵���к�' -- �ڽ�(�ڽĳ��)�� ���ŵ��� �ʴ´�. 
  START WITH college IS NULL
  CONNECT BY PRIOR deptno=college;
--
SELECT deptno,college,dname,loc,LEVEL
  FROM tbl_test
  START WITH college IS NULL
  CONNECT BY PRIOR deptno=college
  AND dname != '�����̵���к�'; -- �ڽ� ���(����)���� ���ŵȴ�.

--------------------------------------------------------------------------------
1. START WITH �ֻ������� : ������ �������� �ֻ��� ������ ���� �ĺ��ϴ� ����
2. CONNECT BY ���� : ������ ������ � ������ ����Ǵ����� ����ϴ� ����.
   PRIOR : ������ ���������� ����� �� �ִ� ������, '�ռ���, ������'
   
   ��)   
   select empno
        , lpad(' ',4*(level-1)) || ename
        , level
        , sys_connect_by_path(ename,'/') ��ü���--��ü ��θ� ��Ÿ���� �Լ�
        , connect_by_root ename --�ֻ��� ��Ʈ ��带 ��Ÿ����. --KING
        , connect_by_isleaf --0, 1(���̻� �ڽ��� ������ �ʴ� ������ ����� 1)
   from emp
   start with mgr is null
   connect by prior empno = mgr; -- t-d ���
   
   
3. ORDER [SIBLINGS] BY : �μ������� ���ĵʰ� ���ÿ� ������ �������� ����
4. CONNECT_BY_ROOT : ������ �������� �ֻ��� �ο츦 ��ȯ�ϴ� ������.
5. CONNECT_BY_ISLEAF : CONNECT BY ���ǿ� ���ǵ� ���迡 ���� 
   �ش� ���� ������ �ڽ����̸� 1, �׷��� ������ 0 �� ��ȯ�ϴ� �ǻ��÷�
6. SYS_CONNECT_BY_PATH(column, char)  : ��Ʈ ��忡�� �����ؼ� �ڽ��� ����� 
   ����� ��� ������ ��ȯ�ϴ� �Լ�.
7. CONNECT_BY_ISCYCLE : ����Ŭ�� ������ ������ ����(�ݺ�) �˰����� ����Ѵ�. 
  �׷���, �θ�-�ڽ� ���� �߸� �����ϸ� ���ѷ����� Ÿ�� ���� �߻��Ѵ�.   
  �̶��� ������ �߻��ϴ� ������ ã�� �߸��� �����͸� �����ؾ� �ϴ� ��, 
  �̸� ���ؼ��� 
    ����  CONNECT BY���� NOCYCLE �߰�
    SELECT ���� CONNECT_BY_ISCYCLE �ǻ� �÷��� ����� ã�� �� �ִ�. 
  ��, ���� �ο찡 �ڽ��� ���� �ִ� �� ���ÿ� �� �ڽ� �ο찡 �θ�ο� �̸� 1,
     �׷��� ������ 0 ��ȯ.
--------------------------------------------------------------------------------
-- 1) 7566 JONES�� mgr�� 7839���� 7369��  ����
-- ���ѷ���
UPDATE emp
SET mgr = 7369
WHERE empno = 7566;
-- 2)
SELECT  deptno, empno, LPAD(' ', 3*(LEVEL-1)) ||  ename
, LEVEL
, SYS_CONNECT_BY_PATH(ename, '/')
FROM emp   
START WITH  mgr IS NULL
CONNECT BY PRIOR  empno =  mgr   ;
-- 3)
ROLLBACK;
-- 4)
SELECT  deptno, empno, LPAD(' ', 3*(LEVEL-1)) ||  ename
, LEVEL
, SYS_CONNECT_BY_PATH(ename, '/')
, CONNECT_BY_ISCYCLE IsLoop
FROM emp   
START WITH  mgr IS NULL
CONNECT BY NOCYCLE PRIOR  empno =  mgr   ;
--------------------------------------------------------------------------------
-- ������ ���̽� �𵨸�
1. ������ ���̽� �𵨸� ���� + �����ۼ�(SQL + PL/SQL)
   - ���� ������ �������� ���μ����� ���������� �����ͺ��̽�ȭ ��Ű�� ������ ������ ���̽� �𵨸��̶�� �Ѵ�.
   - 1)~4) ������ �ݺ���.
   
   ��) �� --- �ֹ�, ����, ���  ---  ��ǰ
   
     1) ���Ǽ���
     ���Ǽ����� ���� ���μ����� �ľ��ؾߵȴ�.
     (�����м���(�䱸�м���)) -- ���� �߿��� �۾�!
     
     2) ������ DB �𵨸��� �Ѵ�.
     ��������� ������� entity  , (ER-Diagram)

     3) ���� �𵨸��� �Ѵ�.
     ER-Diagram�� ���� ����ȭ �ϴ� �۾�.
     
     4) ������ �𵨸�(������ȭ)
     DBMS�� ������ ������� ����, �ڷ���, ũ��.. ���� ���Ѵ�.
     ������ȭ�� ������ ���ؼ� �Ѵ�.
     
     
----------------------------
UPDATE emp
set deptno = 10
where empno = 7839; -- king
commit;
-----------------------------


2. �����ͺ��̽� �𵨸� �ܰ�
 1) ***�����м�***(�߿�)
    ��. ���� ������ ���� �⺻ ���İ� ����� �ʿ��ϴ�.
       ��)�������� ����Ʈ + ��
          ���, ���� X
          ȸ�� ���� ���, ����(��������ǥ, �ս�, �ڻ� ��..)
    ��. ���Ի������ ���� ó�� ���õ� ��� ���μ����� �м��ؾ� �Ѵ�.
    ��. ����� ���ͺ�
    ��. ȸ�翡�� ���Ǵ� ��� ����(����, ��ǥ, ����)�� �ľ��� �����ͷ� �����Ǿ����� �׸���� ��Ȯ�ϰ� �ľ��ؾ��Ѵ�.
    ��. ��׶��� ���μ��� �ľ��Ѵ�. �پ��� ������ �پ��� ����� ���� �ľ��� �ʿ䰡 ����.
    ��. ������� [�䱸 �м���]�� �ۼ��Ѵ�.






