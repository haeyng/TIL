

-- ����Ŭ �ڷ���(Data Type)--
--1)CHAR
   -- ���� ����
   -- CHAR(size Byte | CHAR)
   -- CHAR == CHAR(1) == CHAR(1 BYTE)
   -- 2000byte
   -- �ѱ�(3����Ʈ) ���ĺ�(1����Ʈ)

--2)NCHAR == N(UNICODE) + CHAR
             -- ���� ����Ʈ�� ó��
  -- CHAR(size == ����)
  -- NCHAR�� ����� �÷��� ĳ���͸� ������ �� �ִ�, �����ڵ��̱� ������ ����Ʈ�δ� X �⺻ CHAR
  -- 1���� , 2000byte
  -- ���� ����
  -- ��) NCHAR(20) [A][��][][][][][][][][][][][][][][][][][][]
  -- NCHAR == NCHAR(1) 1����
  -- ����Ʈ ���X
  
  create table test (
  aa char(3) --char(3 byte)
  , bb char(3 char) --�� ����
  , cc nchar(3)); --�� ����
  
-- Table TEST��(��) �����Ǿ����ϴ�.
  
INSERT INTO test(aa, bb, cc) VALUES ('ȫ�浿','ȫ�浿','ȫ�浿');
--SQL ����: ORA-12899: value too large for column "SCOTT"."TEST"."AA" (actual: 9, maximum: 3)
-- �ڷ��� ũ�⺸�� ū���� ���� ����

INSERT INTO test(aa, bb, cc) VALUES ('ȫ','ȫ�浿','ȫ�浿');
--1 �� ��(��) ���ԵǾ����ϴ�.
commit;


INSERT INTO test(aa, bb, cc) VALUES ('ȫ','ȫ�浿','ȫ�浿');


-- ���� ���̸� ��Ÿ���� �ڷ��� CHAR , NCHAR
-- (�ϴ� �޸𸮸� �Ҵ��ϰ� ���� ���� ������ ������ �����ִ�.)
  
  
-- �������� �ڷ���
-- 3) VARCHAR2            VAR (����)
-- ��������
-- �ִ�ũ�� 4000Byte

-- ��) ��������/��������
     name CHAR(10 CHAR)      [m][b][c][][][][][][][����]   -- mbc�� �ִ��� 10���ڷ� ������ ����
     name VARCHAR2(10 CHAR)  [m][b][c] // [][][][][][][]  -- mbc�� ������ 3���ڷ� ������ ���� ������ ������ �޸𸮸� �Ҵ����� �ʴ´�.
                             -- �ִ� �̸� ���ڿ��� ���� == size
     VARCHAR2(10) == VARCHAR2(10 Byte)
     VARCHAR2 == VARCHAR2(1) == VARCHAR2(1 Byte)
  
  
--4) CHAR, NCHAR, VARCHAR2, [NVARCHAR2]
-- N + VAR + CHAR2 �����ڵ� ������ ���ڸ� �����ϴ� �ڷ���

--5) LONG : ���� ���� �ڷ���, 2GB
 --JAVA : long ������ ��Ÿ���� �ڷ��� -- -900�� ~ +900��
 --Oracle : long ���� ���ڸ� �����ϴ� �ڷ���, 2GB���� ���� ����
  
--6) NUMBER  ���ڸ� ��Ÿ���� �ڷ��� (���� == ���� + �Ǽ�)
-- NUMBER
-- NUMBER (p)    p�� precision ��Ȯ�� == ��ü �ڸ���  1 ~ 38������ �� , 
-- NUMBER (p,s)  s�� scale �Ը� == �Ҽ��� ���� �ڸ���  -83~ 127������ ��
    NUMBER(4) S(�Ҽ���)�� ���� ������ ������ ����
    
    NUMBER(5,2) �Ǽ�(��ü �ڸ��� 5�ڸ��� �Ҽ��� 2�ڸ�����)
    
    ��) NUMBER(3,7) ===> 0.0000[][][] ������ ������ ����. 
    -- ��ü �ڸ����� �Ҽ��� �ڸ������� �ݵ�� Ŭ �ʿ�� ����.
    -- NUMBER(4,5)ó�� scale�� precision���� ũ�ٸ�, �̴� ù�ڸ��� 0�� ���̰� �ȴ�.

    kor NUMBER; == kor NUMBER(38,127) NUMBER�� ���� ū �ڷᰪ�� ��Ÿ���ٴ� �ǹ�
   
    kor NUMBER(3) == kor NUMBER(3,0) -- 0 ����

    
    ��)
    CREATE TABLE tbl_number(
          kor NUMBER(3,0) -- ������ 0~100 �̴ϱ� ���ڸ� 3        
         ,eng NUMBER(3,0)
         ,mat NUMBER(3,0)
         ,tot NUMBER(3,0)
         ,avg NUMBER(5,2)
         
    );

INSERT INTO tbl_number(kor, eng, mat, tot, avg) VALUES(90.89, 85, 100);
-- ����: ORA-00947: not enough values ���� ������ ������� �ʴ�. tot�� avg�� ����.


-- �ְ��� �ϴ� Į�� ���� �� ��
INSERT INTO tbl_number(kor, eng, mat) VALUES(90.89, 85, 100); 
-- ����� kor NUMBER(3,0)���� �ڷ����� ��Ƴ��µ� �Ҽ����� ������ ������ �߻����� ���� ��?
-- 90.89 -> 91 �Ҽ��� ù°�ڸ����� �ݿø��Ǿ �ö�����.


select *
from tbl_number;
[���]
91	85	100		

commit;


INSERT INTO tbl_number(kor, eng, mat) VALUES(90, 85, 300); 
--1 �� ��(��) ���ԵǾ����ϴ�.

select *
from tbl_number;
[���]
90	85	300
  
-- 999�� ���ڸ��̱� ������ ������.
  
  
  INSERT INTO tbl_number(kor, eng, mat) VALUES(90, 85, -999); 
  
  select *
  from tbl_number;
  
  --,mat NUMBER(3,0)
  --- 999~999���� ���� �ְڴٴ� �ǹ�
  -- ������������ 0 ~ 100�� ���� �ְڴٰ� �߰��ϸ� �ȴ�. --�ڷ����� number 3�ڸ��� ��ƾ��Ѵ�.
  
  rollback;
  
  select *
  from tbl_number;
  
  [���]
  91	85	100
  
  
  INSERT INTO tbl_number(kor, eng, mat) VALUES(80, 75, 30); 
  
  commit;
  
  select *
  from tbl_number;
  [���]
  91	85	100
  80	75	30
  
  
  
  -- java���� for/while �ݺ��� kor, eng, mat ������ ���� ���� �߻����Ѽ� ����־���.
  -- oracle���� PL/SQL
  
  INSERT INTO tbl_number(kor, eng, mat) VALUES(trunc(dbms_random.value(0,101))
                                              ,trunc(dbms_random.value(0,101))
                                              ,trunc(dbms_random.value(0,101)));
  
  -- �� ������ �����Ѱ� �߻�
  select trunc(dbms_random.value(0,101))
  from dual;
  
  commit;
  
  select *
  from tbl_number;
  
  
  -- ��� �л��� ����, ��� ��� (UPDATE)
  UPDATE tbl_number
  set tot = kor + eng + mat , avg = (kor+eng+mat)/3;
  
  --where �����ϸ� ��� ���ڵ�
  
  commit;
  
  
  
  
  -- ù��° �л��� ���� �����Ϸ��� ��
  select *
  from tbl_number;
  -- �����Ϸ��� �ϳ��ϳ��� �л����� ������ �� �ִ� ������ Ű�� �ʿ��ϴ�.
  -- 
  UPDATE tbl_number
    set avg = 999.12345665
  where avg = 92; -- ������ Ű�� primary key ��� �Ѵ�. ��)�й� ����
  �Ҽ��� ��° �ڸ����� �ݿø�
  91	85	100	276	999.12
  80	75	30	185	61.67
  3	    55	87	145	48.33
  38	8	66	112	37.33
  
  
  rollback;
  
  select *
  from tbl_number;
  
  
  
  UPDATE tbl_number
  set avg = 99999
  where avg = 92;
  
  -- ORA-01438: value larger than specified precision allowed for this column
  -- ������ precision���� ū ���� ���� ����
  
  drop table tbl_number;
  
  
  -- char, nchar        varchar2, nvarchar2
  -- long 
  -- number(p,s)
     number == number(38,127) --�����ϸ� �ִ� �ذͰ� ����.
     number(p) == number(p,0) ����
     number(p,s) == �Ǽ�
     
     desc emp;
  

desc dept;
  
  
--7) FLOAT(p) == NUMBER ���������� NUMBER�� ó���ȴ�.
    -- �� ������ ����
    
--8)DATE  ��¥���� + �ð����� (�ʱ��� ������ �ִ�.) 7byte
    TIMESTAMP                             , + ms , ns
    
    ��) �л������� �����ϰ� �����ϴ� ���̺� ����
        �й��� �ڷ��� : NUMBER(7) , VAR X,  [CHAR] �й��� ���� �����̰�, �ѱ��� ���Ե��� �ʱ� ������
        �̸��� �ڷ��� : ���� ���� NVARCHAR2() �̸��� 3���� �̻� ����, �ѱ� 10���� �̸����� ����.
                                           �̸��� 10���� �̻��̸�? ���̺� ���� (�÷��� ũ�� ����) 
        ����, ����, ����, ���� : NUMBER(3) + üũ��������( 0~100 ����)
                              -999~+999
        ��� : 100.00 NUMBER(5,2)
        ��� : NUMBER(3) -- 999�����
        ���� : ��¥    [DATE], TIMESTAMP x ms, ns �ʿ���� 
        �ֹε�Ϲ�ȣ : [CHAR(14)], NCHAR X ���� 2����Ʈ �����ڵ�� ������ �ʿ� ����  
        

--9)TIMESTAMP : DATE Ȯ��
    TIMESTAMP(6) == TIMESTAMP (���� ���ָ� 6) --> .000000
    TIMESTAMP(0)
    TIMESTAMP(9)
    
    
--10) 2�� ������(0,1)
      ��) �̹��� ����, ���� ����  --> 2�� �����ͷ� ��ȯ --> DB�� ���� �� �� ����ϴ� �ڷ����� RAW(SIZE) 2000byte, LONG RAW 2GB

--11) RAW(2000byte���� ���� ����)
      LONGRAW (2GB���� ���� ����)
      BLOB (B �� Binary 2�� LOB�� Large Object ū ��ü�� ����) 4GB���� ������ �����ϴ�.
      BFILE (Binary �����͸� �ܺο� file���·� (264 -1����Ʈ)���� ����)
  
--12) CHAR, NCHAR (2000byte)
      VARCHAR2, NVARCHAR2 (4000byte)
      LONG(2GB)
      CLOB(4BG)  -- �Խ��� �� ������ CLOB �ƴϸ� NCLOB�� �ڷ����� ����Ѵ�.
      N+CLOB(4GB)
      
--------------------------------------------------------------------------------
--COUNT OVER() ������ ���� ������ ������� ��ȯ�ϴ� �Լ��̴�.

SELECT name, basicpay
    ,COUNT(*)
FROM insa;
--GROUP BY �� �ʿ�      
--ORA-00937: not a single-group group function      


-- ������ ���� counting ��
SELECT buseo, name, basicpay
    --,COUNT (*) OVER(ORDER BY basicpay asc)
    ,COUNT (*) OVER(PARTITION BY buseo ORDER BY basicpay asc) --�μ� �ȿ����� ������ �� counting
FROM insa;




SELECT buseo, name, basicpay
    --,SUM(basicpay) OVER(ORDER BY basicpay asc) -- sum ����
    ,SUM(basicpay) OVER(PARTITION BY buseo ORDER BY basicpay asc) -- �μ� �ȿ����� ������ ��
FROM insa;

      
      
-- �� ������ �޿� ��հ� �� ����� ���� �޿����� ���� ��ȸ

select city, name, basicpay
    ,avg(basicpay) over(partition by city order by city)
    ,basicpay - avg(basicpay) over(partition by city order by city)
from insa;      
  
--------------------------------------------------------------------------------
-- [���̺��� �����ϰ� ����, ����]
-- ���̺� ���� ���ڵ�(��,row)�� �߰�, ����, �����ϴ� �۾�

--1) ���̺� : �����͸� �����ϴ� �����
--2) ***DB �𵨸�*** -> ���̺� ����
  ��) �Խ����� �Խñ��� ������ ���̺� ����
     1) ���̺�� : tbl_board
     2)              �÷���         �ڷ���               ũ��                   ����뿩��                                               ����          
        �۹�ȣ(����PK)  seq         ����(����)          NUMBER(38)                  NOT NULL                                     �Խñ��� ��ȣ
        �ۼ���         writer       ����              VARCHAR2(20 byte)           NOT NULL
        ��й�ȣ       passwd        ����             VARCHAR2(15)                NOT NULL
        ����          title         ����             VARCHAR2(100)               NOT NULL
        ����          content        ����            CLOB                (����Ŭ�� NULL�϶��� �ƹ��͵� X NULL�� �ϸ� ��������.)
        �ۼ���        regdate        ��¥             DATE                        DEFAULT SYSDATE(�ڵ��Է�)
        :
        :
        
     3) �Խñ��� ������ �� �ִ� ������ Ű : �۹�ȣ
     4) �ʼ� �Է� ���� :  == NOT NULL(NN) (NOT NULL�� ���� ���� �߿� �ϳ�)
     5) �ۼ����� ���� �ý����� ��¥�� �ڵ� �Է� : 
  
  
�����������ġ�
    CREATE [GLOBAL TEMPORARY] TABLE [schema.] table
      ( 
        ���̸�  ������Ÿ�� [DEFAULT ǥ����] [��������] 
       [,���̸�  ������Ÿ�� [DEFAULT ǥ����] [��������] ] 
       [,...]  
      ); 

  
�����������ġ�
    CREATE TABLE tbl_board
( 
        seq        NUMBER(38)                                  NOT NULL PRIMARY KEY
        ,writer    VARCHAR2(20 byte)                           NOT NULL
        ,passwd    VARCHAR2(15)                                NOT NULL
        ,title     VARCHAR2(100)                               NOT NULL
        ,content   CLOB                
        ,regdate   DATE                        DEFAULT SYSDATE
); 

-- ���̺� ���� �Ϸ�
  
DESC tbl_board;
[���]  
�̸�      ��?       ����            
------- -------- ------------- 
SEQ     NOT NULL NUMBER(38)    
WRITER  NOT NULL VARCHAR2(20)  
PASSWD  NOT NULL VARCHAR2(15)  
TITLE   NOT NULL VARCHAR2(100) 
CONTENT          CLOB          
REGDATE          DATE  
  
-- ��ȸ�� �÷��� ��� �߰��Ϸ��� ��. - ���̺� ���� �Ŀ� ���ο� �÷� �߰�(���̺� �����Ѵٴ� �ǹ�)

--CREATE TABLE (DDL)
--DROP TABLE (DDL)
--ALTER TABLE (DDL)

? alter table ... add �÷� �Ǵ� ��������        -- ���ο� �÷��� ���̺� �߰��� ��
? alter table ... modify �÷�                 -- �÷��� ���̺��� ������ ��
? alter table ... drop[constraint] ��������    -- ���������� ���̺��� ������ ��
? alter table ... drop column �÷�            -- �÷��� ���̺��� ������ ��


select *
from tbl_board;  
-- ���� �ϳ��� ���ڵ嵵 �������� ����

-- �÷� �߰��� ���̺��� ���� �����Ѵٸ�, ���� �߰��Ǵ� �÷��� �̹� �����ϴ� ��� ���� ���� NULL�� �ʱ�ȭ�Ѵ�.



INSERT into tbl_board(seq, writer, passwd, title, content, regdate)
               values(1, 'admin','1234','test-1','test-1', sysdate);
 
 1 �� ��(��) ���ԵǾ����ϴ�.
 
commit;
 
select *
from tbl_board;
  
  
  
INSERT into tbl_board(seq, writer, passwd, title, content, regdate)
               values(1, 'hong','1234','test-2','test-2');   -- �⺻���� �� �־ sysdate�� ������
--SQL ����: ORA-00947: not enough values ������ ���� ���� 


INSERT into tbl_board(seq, writer, passwd, title, content)
               values(1, 'hong','1234','test-2','test-2');
--ORA-00001: unique constraint (SCOTT.SYS_C007021) violated : 
--              ���ϼ� �������ǿ�       �������Ǹ�        ����ȴ�



--tbl_board ���̺� �������� ��� Ȯ��(��ȸ)
select *
from user_constraints
where table_name LIKE UPPER('%board%'); 
  
-- �۹�ȣ ����Ű�� 2�� ����  
  
INSERT into tbl_board(seq, writer, passwd, title, content)
               values(2, 'hong','1234','test-2','test-2');  
  
commit;

select *
from tbl_board;
  

-- ���̺��� �÷� ������� values() �ڵ�.
INSERT into tbl_board  --Į������ ������� �ԷµǾ��� �ֱ� ������ ���� ����
               values(3, 'song','1234','test-3','test-3', sysdate);
               

--�÷� �߰��� ���̺��� ���� �����Ѵٸ�, ���� �߰��Ǵ� �÷��� �̹� �����ϴ� ��� ���� ���� NULL�� �ʱ�ȭ�Ѵ�.               
-- ��ȸ�� �÷��� ��� �߰��Ϸ��� ��      
-- readed NUMBER  
  
ALTER table tbl_board
--add (�������� Į���� �߰� �� ��)
add readed number default 0;
--Table TBL_BOARD��(��) ����Ǿ����ϴ�.  

select *
from tbl_board;
[���]
1	admin	1234	test-1	test-1	23/09/04	0
2	hong	1234	test-2	test-2	23/09/04	0
3	song	1234	test-3	test-3	23/09/04	0


--�÷��� ���� �߰��� �� ������ �Խñ�(��)�� null�� �ʱ�ȭ�� �Ǵµ�,
-- default ���� �����ߴٸ� �� �⺻������ ������ �Խñ�(��)�� �ʱ�ȭ�ȴ�. ==> 0���� �ʱ�ȭ �Ǿ��� ����.


desc tbl_board;


--1) �Խñ� �ۼ�(insert��) content �� null ����̶� ����, readed 0�̶� ����, regdate�� sysdate
insert into tbl_board(writer, seq, title, passwd)
values('kenik',(select nvl(max(seq),0)+1 from tbl_board) ,'test-4',  '1234');
  
commit; 
  
select *
from tbl_board;  
  
--2) content�� null�� ��� => '�ù�'�� �Խñ��� ����.  
  
update tbl_board
set content = '�ù�'
where content = null; -- where �������� ������ ��� ���ڵ�(�Խñ�)�� �����Ѵٴ� �ǹ�.
-- ORA-00932: inconsistent datatypes: expected - got CLOB
-- ORA-00904: "null": invalid identifier  

  
update tbl_board
set content = '�ù�'
where content is null;
--1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

commit;

select *
from tbl_board;  


--3) kenik �ۼ����� ��� �Խñ��� ����

delete from tbl_board
where writer = 'song';

commit;

select *
from tbl_board;

--4) �÷��� �ڷ����� ũ�� ����
desc tbl_board;
--WRITER  NOT NULL VARCHAR2(20)       ->       VARCHAR2(40)���� �ڷ����� ũ�⸦ �����Ϸ��� ��.

select max(vsize(writer))   --5,4             5������ ���� �� �ִ�.
from tbl_board;

--

alter table tbl_board
modify (writer varchar2(40)not null);
--ORA-01442: column to be modified to NOT NULL is already NOT NULL
 
 
alter table tbl_board
modify (writer varchar2(40)); 
--Table TBL_BOARD��(��) ����Ǿ����ϴ�.
  
desc tbl_board; 

[���] -- 40���� ������.
�̸�      ��?       ����            
------- -------- ------------- 
SEQ     NOT NULL NUMBER(38)    
WRITER  NOT NULL VARCHAR2(40)  
PASSWD  NOT NULL VARCHAR2(15)  
TITLE   NOT NULL VARCHAR2(100) 
CONTENT          CLOB          
REGDATE          DATE          
READED           NUMBER  
  
  
--5) title �÷��� ���� : subject �÷������� �����Ϸ��� ��

alter table tbl_board
rename column title to subject;
--Table TBL_BOARD��(��) ����Ǿ����ϴ�.

select *
from tbl_board;

--6)bigo -- Į���� �߰�(��Ÿ ������ �����ϱ� ����)

alter table tbl_board
add bigo varchar2(100);

desc tbl_board;

select *
from tbl_board;
-- bigo�� null���� ���� �ִ�.

-- bigo Į�� ����

alter table tbl_board
drop column bigo;
--Table TBL_BOARD��(��) ����Ǿ����ϴ�.

desc tbl_board;


-- ���̺� ����
drop table tbl_board;
--Table TBL_BOARD��(��) �����Ǿ����ϴ�.
  
--7) ���̺���� �����Ϸ���
rename ���̺��1 to ���̺��2;
--------------------------------------------------------------------------------
--2) ���̺��� �����ϴ� ��� : ��������(subquery)�� �̿��� ���̺� ����
-- ��. ���� ���̺� ���ϴ� �����Ͱ� �̹� ���� + ���ڵ�(��) ����
-- ��. subquery ����ؼ� ���̺��� ����
-- ��.          (1) ���̺� ���� + (2) ������ ���� + (3) ���������� ������� �ʴ´�.(not null ���� ������ ���� �ȴ�.)
-- ��.

create table tbl_emp (empno, ename, job, hiredate, mgr, pay, deptno)
as 
(
select empno, ename, job, hiredate, mgr, sal + nvl(comm,0) pay, deptno
from emp
);
--Table TBL_EMP��(��) �����Ǿ����ϴ�.
desc tbl_emp;
�̸�       ��? ����           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
HIREDATE    DATE         
MGR         NUMBER(4)    
PAY         NUMBER    ---> �ý����� �ڵ����� number ����   
DEPTNO      NUMBER(2)    

select *
from tbl_emp;
-- ���������� ������� �ʴ´�.
-- �������� Ȯ��
select *
from user_constraints
where table_name = 'TBL_EMP'; -- '�빮��'��

--����

DROP TABLE tbl_emp;
--Table TBL_EMP��(��) �����Ǿ����ϴ�.

--���������� �̿��ؼ� ���̺� ���� + �����Ͱ� �ʿ� ���� ��(������ ����X ���̺��� ������ ����)

CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP
WHERE 1 = 0; --��ȸ�� �����Ͱ� �ƹ��͵� ���� --WHERE ���� ������ �������� ����� �����ͺ��� ���� ������ ����ȴ�.


DESC TBL_EMP;


SELECT *
FROM TBL_EMP;

--

--[����] deptno, dname, empno, ename, hiredate, pay, grade ���� ���̺� ����
-- tbl_empgrade ���̺��

CREATE TABLE tbl_empgrade
AS
(
select d.deptno, dname, empno, ename, hiredate, sal+nvl(comm,0) pay, grade
FROM dept d , emp e , salgrade s
where d.deptno = d.deptno and e.sal between losal and hisal
);
select *
from tbl_empgrade;
--------------------------------------------------------------------------------
--insert��
insert into ���̺�� [(�÷���...)] values (Į����..);
dml ===> commit(�Ϸ�), rollback(���;)
--
-- Multi + table insert ��
1)unconditional insert all 

Unconditional insert all ���� ���ǰ� ������� ����Ǿ��� ���� ���� ���̺� �����͸� �Է��Ѵ�.

? ���������κ��� �ѹ��� �ϳ��� ���� ��ȯ�޾� ���� insert ���� �����Ѵ�.
? into ���� values ���� ����� �÷��� ������ ������ Ÿ���� �����ؾ� �Ѵ�.

    (��)INSERT INTO ���̺�� VALUES();

�����ġ�
	INSERT ALL | FIRST
	  [INTO ���̺�1 VALUES (�÷�1,�÷�2,...)]
	  [INTO ���̺�2 VALUES (�÷�1,�÷�2,...)]
	  .......
	Subquery;

���⼭ 
 ALL : ���������� ��� ������ �ش��ϴ� insert ���� ��� �Է�
 FIRST : ���������� ��� ������ �ش��ϴ� ù ��° insert ���� �Է�
 subquery : �Է� ������ ������ �����ϱ� ���� ���������� �� ���� �ϳ��� ���� ��ȯ�Ͽ� �� insert �� ����

--��)
create table dept_10 as (select * from dept where 1 = 0);
create table dept_20 as (select * from dept where 1 = 0);
create table dept_30 as (select * from dept where 1 = 0);
create table dept_40 as (select * from dept where 1 = 0);
--Table DEPT_40��(��) �����Ǿ����ϴ�.
--
insert ALL -- ���ǿ� ������� ��� ���̺� �� insert �Ѵٴ� �ǹ�
    into dept_10 values (deptno, dname, loc)
    into dept_20 values (deptno, dname, loc)
    into dept_30 values (deptno, dname, loc)
    into dept_40 values (deptno, dname, loc)
select deptno, dname, loc from dept; -- ���������� �о�ͼ�

16�� �� ��(��) ���ԵǾ����ϴ�.

select *
from dept_40;

rollback;

drop table dept_10;
drop table dept_20;
drop table dept_30;
drop table dept_40;


2)conditional insert all 

emp_10, emp_20, emp_30, emp_40 ���̺� ���� ��
emp ���̺��� select ��ȸ�ϴ� ������������ �� �μ�����
4���� emp_10, emp_20, emp_30, emp_40 ������ ���̺� insert �۾�

create table emp_10 as(select * from emp where 1 = 0);
create table emp_20 as(select * from emp where 1 = 0);
create table emp_30 as(select * from emp where 1 = 0);
create table emp_40 as(select * from emp where 1 = 0);
--Table EMP_40��(��) �����Ǿ����ϴ�.


select *
from emp;

insert all
    when deptno = 10 then -- ������ �ִ� �������̺� insert��
     into emp_10 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
    when deptno = 20 then 
     into emp_20 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
    when deptno = 30 then 
     into emp_30 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
    else
     into emp_40 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
 select *
 from emp;

--12�� �� ��(��) ���ԵǾ����ϴ�.
--���μ���ȣ�� �ִ� �����͸� ��ȣ�� ���缭 insert��
select *
from emp_40;

rollback;
-----------------------------
3)conditional insert first

insert first
    when deptno = 10 then -- ������ �ִ� �������̺� insert��
     into emp_10 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
    when deptno = 20 then 
     into emp_20 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
    when deptno = 30 then 
     into emp_30 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
    else
     into emp_40 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
 select *
 from emp;

select *
from emp_10;
select *
from emp_20;
select *
from emp_30;
select *
from emp_40;

rollback;
--

--insert all �� insert first�� ������?
--���� �����ϴ� ù��° frist insert
--���� �����ϴ� ��� insert all
insert all 
    when deptno = 10 then
        into emp_10 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
    when job = 'CLERK' then
        into emp_20 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
    else 
        into emp_40 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
select *
from emp;
--13�� �� ��(��) ���ԵǾ����ϴ�.
select *
from emp
where job = 'CLERK' AND deptno = 10;

rollback;



insert first 
    when deptno = 10 then
        into emp_10 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
    when job = 'CLERK' then
        into emp_20 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
    else 
        into emp_40 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
select *
from emp;

rollback;

4)pivoting insert
--���� ���� �ٲ�

create table sales(
employee_id       number(6),
week_id            number(2),
sales_mon          number(8,2),
sales_tue          number(8,2),
sales_wed          number(8,2),
sales_thu          number(8,2),
sales_fri          number(8,2)
);


insert into sales values(1101,4,100,150,80,60,120);

insert into sales values(1102,5,300,300,230,120,150);

commit;

select *
from sales;



create table sales_data(
employee_id        number(6),
week_id            number(2),
sales              number(8,2)
);


insert all
into sales_data values(employee_id, week_id, sales_mon)
into sales_data values(employee_id, week_id, sales_tue)
into sales_data values(employee_id, week_id, sales_wed)
into sales_data values(employee_id, week_id, sales_thu)
into sales_data values(employee_id, week_id, sales_fri)
select employee_id, week_id, sales_mon, sales_tue, sales_wed,
      sales_thu, sales_fri
from sales;


select * 
from sales_data;
-------------------
--1) delete  emp_10 ���̺��� ��� ���ڵ�(��) ���� + commit, rollback(�����ؾ���)
delete from emp_10;

select *
from emp_10;
------------
--2) truncate emp_20 ���̺��� ��� ���ڵ�(��) ���� + �ڵ� Ŀ��
truncate table emp_20;

select *
from emp_20;
------------
--3) drop table ���̺� ��ü�� �����Ѵ�.
drop table emp_30;
--------------------------------------------------------------------------------
--[����] insa ���̺��� num, name Į������ �����ؼ�
        ���ο� tbl_score ���̺� ����
        ( num <= 1005 )
----> ���������� ����ؼ� ���̺��� ����

create table tbl_score
as
(
select num, name
from insa
where num <= 1005
)
--Table TBL_SCORE��(��) �����Ǿ����ϴ�.

select *
from tbl_score;

--------------------------------------------------------------------------------
--[����] tbl_score ���̺� kor, eng, mat, tot, avg, grade, rank �÷� �߰�
(���� ��,��,��,������ �⺻�� 0)
grade ��� char (1 char)

-- ���̺� ���� (DDL)
create table
drop table

alter table tbl_score
add (
     kor number (3) default 0
    ,eng number (3) default 0
    ,mat number (3) default 0
    ,tot number (3) default 0
    ,avg number (5,2)
    ,grade char (1 char)
    ,rank number(3)
);

--Table TBL_SCORE��(��) ����Ǿ����ϴ�.
select *
from tbl_score;

--[����] 1001~1005 5�� �л��� kor, eng, mat ������ ������ ������
        �����ϴ� ���� �ۼ�.

update tbl_score
set kor = trunc(dbms_random.value(0,101)), -- �������� ������ 100.5xx�� �Ǿ����� �ݿø��Ǿ 101���� �� �� �ִ�.
    eng = trunc(dbms_random.value(0,101)),
    mat = trunc(dbms_random.value(0,101))
;
--where num between 1001 and 1005; 5�� �ܿ��� ������ where ���� ����

commit;

select *
from tbl_score;
  
--[����] 1005�� �л��� ����, ����, ���� ���� 1001�� �л��� ������ ����.

update tbl_score
set kor = (select kor from tbl_score where num = 1005), 
    eng = (select eng from tbl_score where num = 1005),
    mat = (select mat from tbl_score where num = 1005)
where num = 1001;

 select *
from tbl_score; 

update tbl_score
set kor = trunc(dbms_random.value(0,101)),
    eng = trunc(dbms_random.value(0,101)),
    mat = trunc(dbms_random.value(0,101))
;

-- ���� ���ܰ� �� �ʿ���� ���ٷ� �����ϴ�! --- ����ϱ�
update tbl_score 
set (kor,eng,mat) = (select kor,eng,mat from tbl_score where num = 1005)
where num = 1001;

 select *
from tbl_score; 

--[����] ��� �л��� ����, ����� ����(����:����� �Ҽ��� 2�ڸ�)

update tbl_score
set tot = kor + eng + mat
  , avg = (kor + eng + mat)/3;

--������ ����� �Ҽ��� ���ڸ����� ����Ϸ��� �� ��
 select t.*, to_char(t.avg, '999.00')
from tbl_score t; 

  
 --[����] ���(grade) char(1 char) 'A','B','C','D','F'
 --90�� �̻� A
 --80�� �̻� B
 --70�� �̻� C
 --0~59�� F
 
  select *
from tbl_score; 
 
 
 update tbl_score
 set grade = CASE
                WHEN  avg>=90 THEN 'A' 
                WHEN  avg>=80 THEN 'B'
                WHEN  avg>=70 THEN 'C'
                WHEN  avg>=60 THEN 'D'
                ELSE 'F'
             END
             ;
             DECODE(TRUNC(AVG/10),10,'A',9,'A',8,'B',7,'C',6,'D','F')

--------------------------------------------------------------------------------
--[����] tbl_score ���̺��� ��� ó��(update)
select empno, ename, sal
    ,row_number() over(order by sal desc) rn
    ,rank() over(order by sal desc) r
    ,dense_rank() over(order by sal desc) dr
from emp;

-- ��� ���������� update ���� ���
update tbl_score p
-- set rank = (select count(*) + 1 from tbl_score where p.tot < tot)
set rank = (
        select t.r
        from(
            select num, tot, rank() over ( order by tot desc )r
            from tbl_score
            )t
            where t.num = p.num
            );

commit;

select *
from tbl_score;

-- [����] ��� �л����� ���� ������ 20�� ����

update tbl_score
set eng = eng + 20; -- 80�� �̻��� ������ 100�� �Ѿ ������ ����� ���´�.

update tbl_score
set eng = case
            when eng >= 80 then 100
            else eng + 20
           end;
           
commit;
 
 select *
from tbl_score;
 

--[����] ��, ��, ��, ������ �� �ٽ� ������ �Ǹ�
--      ������ �� �л����� ����, ���, ��ü�л����� ����� �޶�����.
-- PL/SQL 5���� �� ���� : ��Ű��(package) , Ʈ���� (Trigger)
update tbl_score
set  eng = eng + 10
where num = 1001;

commit;

-- [����] ���л��鸸 ���� ������ 5���� ���� ��Ű�� ���� �ۼ�.
-- tbl_score ���̺��� ���� �÷�. x
-- insa ���̺� ���� ssn �ֹε�Ϲ�ȣ
-- (insa ���̺� ����)
select *
from tbl_score;


update tbl_score
set kor = case
            when kor>=95 then 100
            else              kor + 5

          end
--where num in (1001,1002,1004,1005);
where num = any( select num
                 from insa
                 where num <= 1005 and mod(substr(ssn,-7,1),2) = 1
                );
 
        -- �����������
        
        commit;
        
--
select num
    --, name
    --,mod(substr(ssn,-7,1),2)
from insa
where num <= 1005 and mod(substr(ssn,-7,1),2) = 1; 
--------------------------------------------------------------------------------
(���� merge)

create table tbl_emp(
    id number not null primary key, -- primary key ���� ������ �ָ� �ڵ����� nn + un ���� ���ǵ� ���������.
    name varchar2(10) not null,
    salary  number,
    bonus number default 100
);
-- Table TBL_EMP��(��) �����Ǿ����ϴ�.

DESC tbl_emp;
[���]
�̸�     ��?       ����           
------ -------- ------------ 
ID     NOT NULL NUMBER       
NAME   NOT NULL VARCHAR2(10) 
SALARY          NUMBER       
BONUS           NUMBER   

insert into tbl_emp(id,name,salary) values(1001,'jijoe',150);
insert into tbl_emp(id,name,salary) values(1002,'cho',130);
insert into tbl_emp(id,name,salary) values(1003,'kim',140);

commit;

select *
from tbl_emp;

create table tbl_bonus(
     id number
    , bonus number default 100
);
-- Table TBL_BONUS��(��) �����Ǿ����ϴ�.

insert into tbl_bonus(id)
  (select e.id from tbl_emp e);

commit;

select *
from tbl_bonus;

insert into tbl_bonus values (1004, 50);
commit;

tbl_emp ���̺��� 1004 ID ���� ����� ����x

1001
1002
1003

tbl_bonus
1001
1002
1003
1004

-- ����(merge)�۾� tbl_emp�� tbl_bonus �� ���̺� ����
merge into tbl_bonus b --tbl_bonus b�� (select id, salary from tbl_emp) ���� ���յǾ���.
--using ���̺��, ���, ��������
using (select id, salary from tbl_emp) e --emp ���̺��� ������ �ٸ��� ������ ������ �Ȱ��� �����ش�.
on (b.id = e.id) 
WHEN MATCHED THEN 
    UPDATE SET b.bonus = b.bonus + e.salary * 0.01 
WHEN NOT MATCHED THEN 
    INSERT (b.id, b.bonus) VALUES (e.id, e.salary*0.01)
--WHERE condition
;
-- 3�� �� ��(��) ���յǾ����ϴ�.

select *
from tbl_emp;

select *
from tbl_bonus;




