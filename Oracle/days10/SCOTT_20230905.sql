--[��������]
--date integrity (������ ���Ἲ)?
--��������? �ŷڵǴ� �����͸� �ٷ�� ���� ��Ģ

--�μ� ���̺� ����
drop table dept;
--ORA-02449: unique/primary keys in table referenced by foreign keys
--foreign keys �����ϰ� �ִ� Ű�� �־ ����X
--�θ����̺� emp���� �����ϰ� �ִ� ����Ű�� �ֱ� ������ ���� �Ұ�.

INSERT INTO emp(empno) VALUES (7369);
--ORA-00001: unique constraint (SCOTT.PK_EMP) violated
-- = ��ü ���Ἲ�� ����ȴ�
-- �ϳ��ϳ��� ��ü (���ڵ�) emp������ �����

dept(deptno(����Ű)) -----  emp(deptno �ܷ�Ű(FK))


UPDATE emp
SET deptno = 50
WHERE empno = 7839; --KING 10���μ�
--ORA-02291: integrity constraint (SCOTT.FK_DEPTNO) violated - parent key not found
--50�� �μ�(����Ű)�� �������� �ʱ� ������ ����
--���� ���Ἲ�� ��Ģ�� ����ȴ�.


--king �� �μ��� null�� �����غ���
UPDATE emp
SET deptno = NULL
WHERE empno = 7839; --KING 10���μ�
-- �ܷ� Ű�� �ݵ�� ���� Ű�� ���� ��ġ�ϰų� null�� ������ �Ѵ�.
commit;

select *
from emp;

--
insert into emp(empno) values ('abc');
--SQL ����: ORA-01722: invalid number
--empno �� number�ε� ���ڸ� ���������ؼ� ����
--������ ���Ἲ ��Ģ�� ����ȴ�.

--tbl_score kor number(3)    0~100�� ���� ���� ����
-- 100�� �̻��� 111���� ���� ������ ���Ἲ ��Ģ�� ���� 


-- ���̺� pk nn fk ���������� ����Ǿ����� �ʾƵ� �������.
-- ��) emp���� �ߺ��Ǵ� �����ȣ�� ���� ����� ������ �����Ҷ��� �θ��� �����Ǿ������.
-- ��, ���̺��� ������ ��쿡 DML�� ���� ������ ������ ����ڰ� ���ϴ� ��� ���� ���� �� �ִ�.


--
������̺�
�����ȣ    ������Ű PK
�ֹε�Ϲ�ȣ ������ Ű == �ߺ����� �ʴ� Ű (���ϼ���������) UK 
��������    NUMBER(3) -999~+999�� 0~100�������� �������� �����ϰ� üũ�ϴ� Ű CK
        INSERT , UPDATE 101�� �ϸ� �����߻� --> ������ ���Ἲ ����
        
--------------------------------------------------------------------------------        
-- ���������� �����ϴ� ���
--1) �÷����� (in-line ���)
--2) ���̺��� (out-of-line ���)

-- ���������� �����ϴ� ����
--1) ���̺� ������ �� -CREATE TABLE��
--2) ���̺� ������ �� -ALTER TABLE��

CREATE TABLE sample(
    id varchar2(20) PK,NN,CK,UK ��� �������� -- Į�� �ϳ� ����ɶ����� �ڿ� �������� : Į������(IN-LIKE�� ���)
    ,pwd varchar2(20) PK,NN,CK,UK ��� ��������
    ,kor
    ,eng
    ,mat
    :
    :
    ,constraint �������Ǽ��� -- ���̺��� (out-of-line ���)
    ,constraint �������Ǽ���
    ,constraint �������Ǽ���
)

--------------------------------------------
CREATE TABLE sample(
    id varchar2(20) PK (NN ���������� �ݵ�� �÷� ���� ������θ� ������ �� �ִ�.)
    ,pwd varchar2(20) PK,NN,CK,UK ��� ��������
    -- id,pwd�� ������ ���� pk, ����Ű�� Į�������δ� �����Ҽ� ���� ���̺� ���� ������θ� ������ �� �ִ�. 
    ,kor
    ,eng
    ,mat
    :
    :
    ,constraint id (NN ���������� ���̺� ����������� �����Ҽ� ����.)
    ,constraint id + pwd ����Ű�� ����(���̺� ���� ������θ� �����Ҽ��ִ�.)
    ,constraint �������Ǽ���
)
--------------------------------------------
--���������� ���� 5����
 
1) PRIMARY KEY(PK)  �ش� �÷� ���� �ݵ�� �����ؾ� �ϸ�, �����ؾ� ��
                    (NOT NULL�� UNIQUE ���������� ������ ����) 
                    
2) FOREIGN KEY(FK)  �ش� �÷� ���� �����Ǵ� ���̺��� �÷� �� ���� �ϳ��� ��ġ�ϰų� NULL�� ���� 

3) UNIQUE KEY(UK)   ���̺����� �ش� �÷� ���� �׻� �����ؾ� �� 

4) NOT NULL(NN)     �÷��� NULL ���� ������ �� ����. (�ʼ� �Է� ����, �ݵ�� �Է��ؾ��Ѵ�.)

5) CHECK(CK)        �ش� �÷��� ���� ������ ������ ���� ������ ���� ���� 

--------------------------------------------------------------------------------
--�������� �ǽ�
-- tbl_constraint

1) Į�� ���� ������� ���������� ����.

CREATE TABLE tbl_constraint1(
    --empno NUMBER(4) NOT NULL PRIMARY KEY -- �ڵ����� �������� �̸��� sys_xxx
    
    --empno NUMBER(4) NOT NULL constraint �������Ǹ�(PK_���̺��_�÷���) PRIMARY KEY -- ���� ���ϴ� �������� �̸��� �ְ� ���������� ����
    empno NUMBER(4) NOT NULL constraint PK_tblconstraint1_empno PRIMARY KEY
);
--Table TBL_CONSTRAINT1��(��) �����Ǿ����ϴ�.

select *
FROM user_constraints
WHERE table_name = upper('TBL_CONSTRAINT1');

--�������� �̸�
SYS_C007028 C NN ���� ����
SYS_C007029 P PK ���� ����
--

tbl_constraint1 ���� pk ���������� ���� �Ϸ���?
ALTER TABLE ���̺�� 
DROP [CONSTRAINT constraint�� | PRIMARY KEY | UNIQUE(�÷���)]
[CASCADE];

1- ù��° ���) -- �������� �̸��� �˾ƿͼ� �Է� �� ����
alter table TBL_CONSTRAINT1
drop constraint SYS_C007029;
--Table TBL_CONSTRAINT1��(��) ����Ǿ����ϴ�.

drop table TBL_CONSTRAINT1;
--Table TBL_CONSTRAINT1��(��) �����Ǿ����ϴ�.

------------------------------------------------
--���� ���ϴ� �������� �̸��� �ְ� ���������� ������ ����
CREATE TABLE tbl_constraint1(
    --empno NUMBER(4) NOT NULL PRIMARY KEY -- �ڵ����� �������� �̸��� sys_xxx
    
    --empno NUMBER(4) NOT NULL constraint �������Ǹ�(PK_���̺��_�÷���) PRIMARY KEY -- ���� ���ϴ� �������� �̸��� �ְ� ���������� ����
    empno NUMBER(4) NOT NULL constraint PK_tblconstraint1_empno PRIMARY KEY
);
-------------------------------------
alter table TBL_CONSTRAINT1
drop constraint PK_tblconstraint1_empno;
--Table TBL_CONSTRAINT1��(��) ����Ǿ����ϴ�.

drop table TBL_CONSTRAINT1;
--Table TBL_CONSTRAINT1��(��) �����Ǿ����ϴ�.
---------------------------------------------------
1- �ι�° ���) PK���������� �������Ǹ��� ���� ������ �� �ִ�.
alter table tbl_constraint1
drop primary key;

--------------------------------------------------------------------------------
CREATE TABLE tbl_constraint1(
    --empno NUMBER(4) NOT NULL PRIMARY KEY -- �ڵ����� �������� �̸��� sys_xxx
    
    --empno NUMBER(4) NOT NULL constraint �������Ǹ�(PK_���̺��_�÷���) PRIMARY KEY -- ���� ���ϴ� �������� �̸��� �ְ� ���������� ����
    empno NUMBER(4) NOT NULL constraint PK_tblconstraint1_empno PRIMARY KEY
    ,ename VARCHAR2(20)
    ,deptno NUMBER(2) constraint FK_tblconstraint1_deptno REFERENCES dept (deptno)-- dept(deptno) �ܷ�Ű�� ���� Į������ �������
                                                         -- �����ϴ� ���̺��(�����ϴ� Į����)
);
--Table TBL_CONSTRAINT1��(��) �����Ǿ����ϴ�.

select *
FROM user_constraints
WHERE table_name = upper('TBL_CONSTRAINT1');

--PK(P) NN(C) FK(R)
---------------------------------------------
CREATE TABLE tbl_constraint1(
    --empno NUMBER(4) NOT NULL PRIMARY KEY -- �ڵ����� �������� �̸��� sys_xxx
    
    --empno NUMBER(4) NOT NULL constraint �������Ǹ�(PK_���̺��_�÷���) PRIMARY KEY -- ���� ���ϴ� �������� �̸��� �ְ� ���������� ����
    empno NUMBER(4) NOT NULL constraint PK_tblconstraint1_empno PRIMARY KEY
    ,ename VARCHAR2(20)
    ,deptno NUMBER(2) constraint FK_tblconstraint1_deptno REFERENCES dept (deptno)-- dept(deptno) �ܷ�Ű�� ���� Į������ �������
                                                         -- �����ϴ� ���̺��(�����ϴ� Į����)
    --,kor number(3) constraint CK_tblconstraint1_kor CHECK(���ǽ�)-- -999~+999 X 0~100���� �ִ� �������� üũ��������
    ,kor number(3) constraint CK_tblconstraint1_kor CHECK(kor between 0 and 100)
);


select *
FROM user_constraints
WHERE table_name = upper('TBL_CONSTRAINT1');

-----------------
CREATE TABLE tbl_constraint1(
    --empno NUMBER(4) NOT NULL PRIMARY KEY -- �ڵ����� �������� �̸��� sys_xxx
    
    --empno NUMBER(4) NOT NULL constraint �������Ǹ�(PK_���̺��_�÷���) PRIMARY KEY -- ���� ���ϴ� �������� �̸��� �ְ� ���������� ����
    empno NUMBER(4) NOT NULL constraint PK_tblconstraint1_empno PRIMARY KEY
    ,ename VARCHAR2(20)
    ,deptno NUMBER(2) constraint FK_tblconstraint1_deptno REFERENCES dept (deptno)-- dept(deptno) �ܷ�Ű�� ���� Į������ �������
                                                         -- �����ϴ� ���̺��(�����ϴ� Į����)
    --,kor number(3) constraint CK_tblconstraint1_kor CHECK(���ǽ�)-- -999~+999 X 0~100���� �ִ� �������� üũ��������
    ,kor number(3) constraint CK_tblconstraint1_kor CHECK(kor between 0 and 100)
    ,email varchar2 (250) constraint UK_tblconstraint1_email UNIQUE-- �ߺ����� �ʴ� ������ �� , ���ϼ� ���� ����(UK)
);

-----------------------------
CREATE TABLE tbl_constraint1(
    --empno NUMBER(4) NOT NULL PRIMARY KEY -- �ڵ����� �������� �̸��� sys_xxx
    
    --empno NUMBER(4) NOT NULL constraint �������Ǹ�(PK_���̺��_�÷���) PRIMARY KEY -- ���� ���ϴ� �������� �̸��� �ְ� ���������� ����
    empno NUMBER(4) NOT NULL constraint PK_tblconstraint1_empno PRIMARY KEY
    ,ename VARCHAR2(20)
    ,deptno NUMBER(2) constraint FK_tblconstraint1_deptno REFERENCES dept (deptno)-- dept(deptno) �ܷ�Ű�� ���� Į������ �������
                                                         -- �����ϴ� ���̺��(�����ϴ� Į����)
    --,kor number(3) constraint CK_tblconstraint1_kor CHECK(���ǽ�)-- -999~+999 X 0~100���� �ִ� �������� üũ��������
    ,kor number(3) constraint CK_tblconstraint1_kor CHECK(kor between 0 and 100)
    ,email varchar2 (250) constraint UK_tblconstraint1_email UNIQUE-- �ߺ����� �ʴ� ������ �� , ���ϼ� ���� ����(UK)
    ,city varchar2(20) constraint CK_tblconstraint1_city CHECK(city in('����','�λ�','�뱸','����')) -- ����, �λ�, �뱸, ���� �߿� �ϳ��� ����ϵ��� ���� -- üũ���� ����
);





--------------------------------------------------------------------------------
2) ���̺� ���� ������� ���������� ����.

drop table tbl_constraint2;

CREATE TABLE tbl_constraint2(
    empno NUMBER(4) NOT NULL

    ,CONSTRAINT PK_tbl_constraint2_empno PRIMARY KEY -- � ���ڵ尡 PK�� ������ ��õǾ� ���� ����
)
--ORA-00906: missing left parenthesis

CREATE TABLE tbl_constraint2(
    empno NUMBER(4) NOT NULL

    ,CONSTRAINT PK_tbl_constraint2_empno PRIMARY KEY (empno) --(empno,���) �ϸ� ����Ű
)


select *
FROM user_constraints
WHERE table_name = upper('TBL_CONSTRAINT2');


---------------------------------------------
CREATE TABLE tbl_constraint2(
    empno NUMBER(4) NOT NULL
    ,enmae VARCHAR2 (20)
    ,deptno number(2)

    ,CONSTRAINT PK_tbl_constraint2_empno PRIMARY KEY(empno) -- � ���ڵ尡 PK�� ������ ��õǾ� ���� ����
    --,constraint FK_tblconstraint2_deptno REFERENCES dept (deptno) --FK Į������ ����
    ,constraint FK_tbl_constraint2_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
);
------------

CREATE TABLE tbl_constraint2(
    empno NUMBER(4) NOT NULL
    ,enmae VARCHAR2 (20)
    ,deptno number(2)
    ,kor number(3)

    ,CONSTRAINT PK_tbl_constraint2_empno PRIMARY KEY(empno) -- � ���ڵ尡 PK�� ������ ��õǾ� ���� ����
    --,constraint FK_tblconstraint2_deptno REFERENCES dept (deptno) --FK Į������ ����
    ,constraint FK_tbl_constraint2_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
    --,constraint CK_tblconstraint1_kor CHECK(kor between 0 and 100) -- ��� Į���� ���� -- KOR�� ���ԵǾ� �־ Į�� ���� ��İ� �Ȱ���
    ,constraint CK_tblconstraint1_kor CHECK(kor between 0 and 100) 
);
--------------------


CREATE TABLE tbl_constraint2(
    empno NUMBER(4) NOT NULL
    ,enmae VARCHAR2 (20)
    ,deptno number(2)
    ,kor number(3)
    ,email varchar2(250)

    ,CONSTRAINT PK_tbl_constraint2_empno PRIMARY KEY(empno) -- � ���ڵ尡 PK�� ������ ��õǾ� ���� ����
    --,constraint FK_tblconstraint2_deptno REFERENCES dept (deptno) --FK Į������ ����
    ,constraint FK_tbl_constraint2_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
    --,constraint CK_tblconstraint1_kor CHECK(kor between 0 and 100) -- ��� Į���� ���� -- KOR�� ���ԵǾ� �־ Į�� ���� ��İ� �Ȱ���
    ,constraint CK_tblconstraint2_kor CHECK(kor between 0 and 100)
    ,constraint UK_tblconstraint2_email UNIQUE (email)-- Į������ ��������(email)
);

-----------------------------------
 
 
 CREATE TABLE tbl_constraint2(
    empno NUMBER(4) NOT NULL
    ,enmae VARCHAR2 (20)
    ,deptno number(2)
    ,kor number(3)
    ,email varchar2(250)

    ,CONSTRAINT PK_tbl_constraint2_empno PRIMARY KEY(empno) -- � ���ڵ尡 PK�� ������ ��õǾ� ���� ����
    --,constraint FK_tblconstraint2_deptno REFERENCES dept (deptno) --FK Į������ ����
    ,constraint FK_tbl_constraint2_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
    --,constraint CK_tblconstraint1_kor CHECK(kor between 0 and 100) -- ��� Į���� ���� -- KOR�� ���ԵǾ� �־ Į�� ���� ��İ� �Ȱ���
    ,constraint CK_tblconstraint2_kor CHECK(kor between 0 and 100)
    ,constraint UK_tblconstraint2_email UNIQUE (email)-- Į������ ��������(email)
    ,constraint CK_tblconstraint2_city CHECK(city in('����','�λ�','�뱸','����'))
);

--------------------------------------------------------------------------------
3) ���̺� ���� �Ŀ� pk ���������� �����Ϸ��� �� (���̺��� �����Ѵٴ� �ǹ�)------�ڡڡڡڡڡڡڡ�
CREATE TABLE tbl_constraint3(
    empno NUMBER(4)
    ,ename varchar2(20)
    ,deptno number(2)
)
--
alter table tbl_constraint3
--add(�÷���,... )
add constraint PK_tbl_constraint3_empno PRIMARY KEY (empno);
--
select *
FROM user_constraints
WHERE table_name = upper('TBL_CONSTRAINT3');

drop table tbl_constraint3;

--------------------------------------------------------------------------------
-- �������� ��Ȱ��ȭ/Ȱ��ȭ
--Ȱ��
alter table ���̺��
enable constraint �������Ǹ�;
--��Ȱ��
alter table ���̺��
disable constraint �������Ǹ�;

--
drop table ���̺��; -- ���̺� �����뿡 ����(���� ����)
drop table ���̺�� cascade constraints; -- ���̺�� �� ���̺��� �����ϴ� ����Ű�� ���ÿ� �����Ѵ�.
drop table ���̺�� purge; -- �����뿡 ���� �ʰ� ���� ����

��)
drop table dept; -- �����Ұ� emp(deptno fk �ܷ�Ű, ����)
drop table dept cascade constraints; --dept ���̺�ΰ� emp ���̺� �ȿ� �ִ� deptno(����Ű)(Į��)�� �����Ѵ�.

--
alter table ���̺��
add (Į��,...)
add (��������,..) ������ �߰� ����? Ȯ���ϱ�
--

--
���÷������� ���ġ�
        �÷��� ������Ÿ�� CONSTRAINT constraint��
	REFERENCES �������̺�� (�����÷���) 
             [ON DELETE CASCADE | ON DELETE SET NULL]

--emp ���̺�� ����
emp,
    deptno NUMBER(2) constraint FK_EMP_DEPTNO  
           REFERENCES dept(deptno)
           1) --ON DELETE CASCADE; -- �ǹ�? on delete cascade�� �ָ� emp ���̺� 30�� ����鵵 ���� �����ȴ�.
           2) ON DELETE SET NULL; --�ǹ�? emp ���̺� 30�� ������� deptno = null�� �����ȴ�.
--
DELETE FROM dept
where deptno = 30;
--ORA-02292: integrity constraint (SCOTT.FK_DEPTNO) violated - child record found
-- ���� ���Ἲ �������� ���� --�����ϰ� �ִ� �ڽ� ���̺� ������� �ֱ� ������ ���� �Ұ� emp ��� ���̺� 30�� ����� �����ϰ� �ִ�


update emp
set deptno = null
where deptno = 30;

select *
from emp;

rollback;

--------------------------------------------------------------------------------
ON DELETE CASCADE
ON DELETE SET NULL
-- �ǽ�

emp -> tbl_emp ����
dept -> tbl_dept ����

create table tbl_emp as(select * from emp)
create table tbl_dept as(select * from dept)
--Table TBL_EMP��(��) �����Ǿ����ϴ�.
--Table TBL_DEPT��(��) �����Ǿ����ϴ�.

--dept ���̺��� ���������� Ȯ�� -> PK ��������-> tbl_dept PK �������� �߰�
alter table tbl_dept
add(constraint pk_tbldept_deptno primary key (deptno));
--emp ���̺��� ���������� Ȯ�� -> PK , FK�������� -> tbl_dept PK , FK �������� �߰�
alter table tbl_emp
add(constraint pk_tbldept_empno primary key (empno));
--FK �߰��� �� ON DELETE CASCADE �ɼ��� �߰�
alter table tbl_emp
add constraint fk_tbldept_empno foreign key (deptno)
    references tbl_dept(deptno)
    on delete cascade;
    
--
select * from tbl_emp;

select * from tbl_dept;

delete from tbl_dept
where deptno = 30; --30�� �μ� ����

rollback;
----------------------------------------------------

    
--�������� ���� �� ���� ����
alter table tbl_emp
drop constraint fk_tbldept_empno;

--�������� �߰�
alter table tbl_emp
add constraint fk_tbldept_empno foreign key (deptno)
    references tbl_dept(deptno)
    on delete set null;

delete from tbl_dept
where deptno = 30; --30�� �μ��� null�� �� ����

select * from tbl_emp;

select * from tbl_dept;

--------------------------------------------------------------------------------
--����(JOIN)--
CREATE TABLE book(
       b_id     VARCHAR2(10)    NOT NULL PRIMARY KEY   -- åID
      ,title      VARCHAR2(100) NOT NULL  -- å ����
      ,c_name  VARCHAR2(100)    NOT NULL     -- c �̸�
     -- ,  price  NUMBER(7) NOT NULL
 );
-- Table BOOK��(��) �����Ǿ����ϴ�.
INSERT INTO book (b_id, title, c_name) VALUES ('a-1', '�����ͺ��̽�', '����');
INSERT INTO book (b_id, title, c_name) VALUES ('a-2', '�����ͺ��̽�', '���');
INSERT INTO book (b_id, title, c_name) VALUES ('b-1', '�ü��', '�λ�');
INSERT INTO book (b_id, title, c_name) VALUES ('b-2', '�ü��', '��õ');
INSERT INTO book (b_id, title, c_name) VALUES ('c-1', '����', '���');
INSERT INTO book (b_id, title, c_name) VALUES ('d-1', '����', '�뱸');
INSERT INTO book (b_id, title, c_name) VALUES ('e-1', '�Ŀ�����Ʈ', '�λ�');
INSERT INTO book (b_id, title, c_name) VALUES ('f-1', '������', '��õ');
INSERT INTO book (b_id, title, c_name) VALUES ('f-2', '������', '����');

COMMIT;

SELECT *
FROM book;

-- �ܰ����̺�(å�� ����)
  CREATE TABLE danga(
      b_id  VARCHAR2(10)  NOT NULL  -- ���ÿ� PK , FK (�ĺ����� : �θ����̺��� b_id �ܰ� ���̺� fkŰ�� ������ �Ǵµ� pk�� �Ǹ� �ĺ������� �Ѵ�.)
      ,price  NUMBER(7) NOT NULL    -- å ����
      
      ,CONSTRAINT PK_dangga_id PRIMARY KEY(b_id)
      ,CONSTRAINT FK_dangga_id FOREIGN KEY (b_id)
              REFERENCES book(b_id)
              ON DELETE CASCADE
);
--Table DANGA��(��) �����Ǿ����ϴ�.

-- book - b_id(pk), title, c_name
-- danga - b_id(pk,fk), price


INSERT INTO danga (b_id, price) VALUES ('a-1', 300);
INSERT INTO danga (b_id, price) VALUES ('a-2', 500);
INSERT INTO danga (b_id, price) VALUES ('b-1', 450);
INSERT INTO danga (b_id, price) VALUES ('b-2', 440);
INSERT INTO danga (b_id, price) VALUES ('c-1', 320);
INSERT INTO danga (b_id, price) VALUES ('d-1', 321);
INSERT INTO danga (b_id, price) VALUES ('e-1', 250);
INSERT INTO danga (b_id, price) VALUES ('f-1', 510);
INSERT INTO danga (b_id, price) VALUES ('f-2', 400);

COMMIT;

select *
from danga;

-- å�� ���� �������̺�
 CREATE TABLE au_book(
       id   number(5)  NOT NULL PRIMARY KEY
      ,b_id VARCHAR2(10)  NOT NULL  CONSTRAINT FK_AUBOOK_BID
            REFERENCES book(b_id) ON DELETE CASCADE
      ,name VARCHAR2(20)  NOT NULL
);

INSERT INTO au_book (id, b_id, name) VALUES (1, 'a-1', '���Ȱ�');
INSERT INTO au_book (id, b_id, name) VALUES (2, 'b-1', '�տ���');
INSERT INTO au_book (id, b_id, name) VALUES (3, 'a-1', '�����');
INSERT INTO au_book (id, b_id, name) VALUES (4, 'b-1', '������');
INSERT INTO au_book (id, b_id, name) VALUES (5, 'c-1', '������');
INSERT INTO au_book (id, b_id, name) VALUES (6, 'd-1', '���ϴ�');
INSERT INTO au_book (id, b_id, name) VALUES (7, 'a-1', '�ɽ���');
INSERT INTO au_book (id, b_id, name) VALUES (8, 'd-1', '��÷');
INSERT INTO au_book (id, b_id, name) VALUES (9, 'e-1', '���ѳ�');
INSERT INTO au_book (id, b_id, name) VALUES (10, 'f-1', '������');
INSERT INTO au_book (id, b_id, name) VALUES (11, 'f-2', '�̿���');

COMMIT;

SELECT * 
FROM au_book;

--�Ǹ� ���̺� -- ���ǻ� --> å �Ǹ� ���� --> ����
-- �� ���̺�(����)
 CREATE TABLE gogaek(
      g_id       NUMBER(5) NOT NULL PRIMARY KEY 
      ,g_name   VARCHAR2(20) NOT NULL
      ,g_tel      VARCHAR2(20)
);
          

 INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (1, '�츮����', '111-1111');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (2, '���ü���', '111-1111');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (3, '��������', '333-3333');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (4, '���Ｍ��', '444-4444');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (5, '��������', '555-5555');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (6, '��������', '666-6666');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (7, '���ϼ���', '777-7777');

COMMIT;

SELECT *
FROM gogaek;

CREATE TABLE panmai(
       id         NUMBER(5) NOT NULL PRIMARY KEY
      ,g_id       NUMBER(5) NOT NULL CONSTRAINT FK_PANMAI_GID
                     REFERENCES gogaek(g_id) ON DELETE CASCADE
      ,b_id       VARCHAR2(10)  NOT NULL CONSTRAINT FK_PANMAI_BID
                     REFERENCES book(b_id) ON DELETE CASCADE
      ,p_date     DATE DEFAULT SYSDATE
      ,p_su       NUMBER(5)  NOT NULL
);

INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (1, 1, 'a-1', '2000-10-10', 10);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (2, 2, 'a-1', '2000-03-04', 20);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (3, 1, 'b-1', DEFAULT, 13);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (4, 4, 'c-1', '2000-07-07', 5);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (5, 4, 'd-1', DEFAULT, 31);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (6, 6, 'f-1', DEFAULT, 21);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (7, 7, 'a-1', DEFAULT, 26);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (8, 6, 'a-1', DEFAULT, 17);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (9, 6, 'b-1', DEFAULT, 5);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (10, 7, 'a-2', '2000-10-10', 15);

COMMIT;

SELECT *
FROM panmai;   


-- JOIN ����
1) EQUI JOIN
    - WHERE �������� ���� ���� (=)
                        ��.PK = ��.PK
    - ����Ŭ������ natural join�� ����
    - USING ���� ���


--[����] åID, å����, ���ǻ�(c_name), �ܰ� ���
    book : b_id, title, c_name
    danga : b_id, price

1)��ü��.�÷���
SELECT book.b_id, book.title, book.c_name, danga.price
from book, danga
where book.b_id = danga.b_id; -- ���� ���� = EQUI JOIN

2)��Ī(ailas).�÷���
SELECT b.b_id, b.title, c_name, price
from book b, danga d
where b.b_id = d.b_id; -- ���� ���� = EQUI JOIN

3)JOIN ~ ON ����
SELECT b.b_id, b.title, c_name, price
from book b JOIN danga d
ON b.b_id = d.b_id; -- ���� ���� = EQUI JOIN

4)USING �� ��� - ��ü��.�÷��� �Ǵ� ��Ī��.�÷��� �� ������� �ʴ´�.
SELECT b_id, title, c_name, price
from book JOIN danga USING (b_id);

5)
SELECT b_id, title, c_name, price
from book natural JOIN danga;


--[����] åID, å����, �Ǹż���, �ܰ�, ������, �Ǹűݾ� ���
    book : b_id, title
    danga : b_id, price
    * panmai : b_id, p_su
    * gogaek : g_name

1) , ���� JOIN ���
-- �Ǹűݾ� = �Ǹż���(p_su) * �ܰ�(price)
select b.b_id, title, p_su, price,g_name, p_su*price �Ǹűݾ�
from book b, panmai p, danga d, gogaek g
where b.b_id = p.b_id and b.b_id = d.d_id and p.g_id = g.g_id;


2) JOIN ~ ON ���
select b.b_id, title, p_su, price,g_name, p_su*price �Ǹűݾ�
from book b join panmai p on b.b_id = p.b_id
            JOIN danga d ON b.b_id = d.b_id
            JOIN gogaek g ON p.g_id = g.g_id;

3) USING ���

select b_id, title, p_su, price,g_name, p_su*price �Ǹűݾ�
from book   join panmai  using (b_id)
            JOIN danga   using (b_id)
            JOIN gogaek  using (g_id);

--------------------------------------------------------------------------------
--NON EQUI JOIN
--     = X     BETWEEN ~ AND
emp sal grade ?        salgrade losal, hisal

select deptno, ename, sal, losal ||' ~ ' || hisal, grade 
from emp e join salgrade s 
on e.sal between s.losal and s.hisal;
-- where e.sal = s.sal;

select *
from salgrade;

select *
from emp;

--INNER JOIN : �� �̻��� ���̺��� ���������� �����ϴ� �ุ ��ȯ�Ѵ�. (���ʿ� �������ΰ͸� ��ȸ��)
--emp / dept JOIN

select d.deptno, ename, sal -- king�� ������ �ʴ´�. --����� �ȳ��� //null�ΰ͵� �ȳ����� 40���� �ȳ�����
from emp e, dept d
where d.deptno = e.deptno; --EQUI JOIN, INNER JOIN, INNER JOIN 10/20/30

--emp deptno = null (king)
--dept 40 (���ʿ� �� �ִ� deptno�� ��ȸ�ȴ�.)
select deptno
from dept;
from emp;

----------------------------------------------------------------
select d.deptno, ename, sal 
from emp e, dept d
where e.deptno = d.deptno(+); --left outer join --king�� ��ȸ �ȴ�.

--���� ���� �ڵ� left outer join
select d.deptno, ename, sal 
from emp e left outer join dept d
on e.deptno = d.deptno;


-- right outer join
select d.deptno, ename, sal 
from emp e, dept d
where e.deptno(+) = d.deptno; -- 40�� ���� ��ȸ�ȴ�.
--���� ���� �ڵ� right outer join
select d.deptno, ename, sal 
from emp e right outer join dept d
on e.deptno = d.deptno;


--���� ���� �� �� ��ȸ�ϰ� ������
--FULL OUTER JOIN
select d.deptno, ename, sal 
from emp e FULL outer join dept d
on e.deptno = d.deptno;


--SELF JOIN : ���� ���̺��� ����
--deptno/empno/ename     ���ӻ���� �μ���ȣ/�����ȣ/�����

select e1.deptno, e1.empno, e1.ename, e2.deptno, e1.mgr, e2.ename
from emp e1 , emp e2 -- self join
where e1.mgr = e2.empno;
--
select e1.deptno, e1.empno, e1.ename, e2.deptno, e1.mgr, e2.ename
from emp e1 join emp e2 -- inner join (inner ����)
on e1.mgr = e2.empno; --equi join



-- cross join ��� ����� �� ��ȸ
-- 12 * 4 = 48
select d.deptno, dname, empno, ename
from emp e , dept d; --join ������ ���� cross join
-- ���� ���� �ڵ�
select d.deptno, dname, empno, ename
from emp e cross join dept d;




