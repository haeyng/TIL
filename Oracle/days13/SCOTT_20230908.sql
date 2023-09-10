
CREATE TABLE tbl_dept
as(
    select *
    from dept
    where 1 = 0
)


-- deptno PK ����
ALTER TABLE tbl_dept
ADD constraint PK_TBLDEPT_DEPTNO PRIMARY KEY(deptno);

select *
from tbl_dept;

drop table tbl_dept;

--------------------------------------------------------------------------------
������̺�
 �� ������ ���
 �� �������� ���
 (1) ���� Ÿ�� : ��ü�� �ϳ��� ���̺�� ����.
  ����Ӽ�(�÷�)
  [][][][][][][][][������][������][������][��������][��������]
  
 (2) ���� Ÿ�� : ������, �������� ��� ���� ���� Ÿ���� ������ŭ ���̺�� ����
  ��������� ���̺�
  [][][][][][][][][������][������][������][������]
  
  ����������� ���̺�
  [][][][][][][][][��������][��������][��������][��������]
  
 (3)
  ������̺�                     ��       ��
  1. [ȫ�浿][][][][][][][]     1       NULL
  2. [ȫ�浿2][][][][][][][]    NULL     2
  
  ������ ���̺�
  1(PK) 1(F).[������][������][������][������]
  [������][������][������][������]
  [������][������][������][������]
  
  �������� ���̺�
  1 [��������][��������][��������][��������]
  2 [��������][��������][��������][��������]
  3 [��������][��������][��������][��������]
 
-- * �������翡 �ʿ��� ���� �����ϱ� 
--   -> JDBC�� �غ��� -> html, css, js�� �ۼ� -> JSP/Servlet ó��
 
--------------------------------------------------------------------------------
--������(SEQUENCE)
--�ڵ� �Ϸù�ȣ ����
--dept ���̺��� deptno�� �������� �����ؼ� ���.
;
select MAX(deptno) + 10
from dept;

desc dept;
-------------------------------
    DROP SEQUENCE seq_deptno;
    --Sequence SEQ_DEPTNO��(��) �����Ǿ����ϴ�.
    
    CREATE SEQUENCE seq_deptno
    INCREMENT BY 10
    START WITH 50
    MAXVALUE 90
    NOCYCLE
    NOCACHE;
    --Sequence SEQ_DEPTNO��(��) �����Ǿ����ϴ�.
    
    -- INSERT INTO dept VALUES (  select MAX(deptno) + 10 from dept  );
    INSERT INTO dept VALUES (  seq_deptno.NEXTVAL, 'QC', NULL  );
    
    SELECT *
    FROM user_sequences;
    
    SELECT seq_deptno.CURRVAL
    FROM dual;
    
    ROLLBACK;
    
    SELECT *
    FROM dept;
-------------------------------
    CREATE SEQUENCE seq_deptno;

	CREATE SEQUENCE ��������
	INCREMENT BY 1   10
	START WITH 1     50
	MAXVALUE 9999999999999999999999999999   90
	MINVALUE 1
	                         NOCYCLE
	CACHE 20                 NOCACHE; 
   
-------------------------------
    CREATE USER
    CREATE TABLE
    CREATE OR REPLACE VIEW
    CREATE SEQUENCE seq_deptno; 
-------------------------------
SELECT *
FROM user_sequences;
from seq;  -- user tables == tabs

--------------------------------------------------------------------------------
--Pseudo �÷��� �̿��� �������� ���
--CURRVAL�� �����Ǳ� ���� NEXTVAL�� ���� ���Ǿ�� �Ѵ�.

create sequence seq_test;

select seq_test.currval
from dual;
--ORA-08002: sequence SEQ_TEST.CURRVAL is not yet defined in this session
--currval �� ����Ϸ��� NEXTVAL�� �ּ��� �ѹ��� ����ؾ��Ѵ�.

rollback;

drop sequence seq_test;
drop sequence seq_deptno;

--------------------------------------------------------------------------------
--PL/SQL ( Procedural Language extensions to SQL )
--������ ���(����,���) + Ȯ��� SQL
--��� ������ �� ���
--����
[DECLARE]
 1) ���� ��
BEGIN
 2) ���� ��
 /*
 SELECT
 INSERT
 UPDATE
 SELECT
 DELETE
 */
[EXCEPTION]
 3) ���� ó�� ��
END
--------------------------------------------------------------------------------
--PS/SQL�� 6���� ����
    1)anonymous procedure  (�͸� ���ν���)
    2)stored procedure (���� ���ν���)
    3)stored function (���� �Լ�)
    4)package (��Ű��)
    5)trigger (Ʈ����)
    -- 6)object type (��ü)

��) �͸� ���ν��� �ۼ�
���� ���� �Ҵ��ϴ� ���
jAVA : String name ;
       name = 'ȫ�浿'; -- ���Կ�����
Oracle PL/SQL
       1) :=  ���Կ�����
       2) select��, fetch�� : INTO��


-- �͸� ���ν��� -- declare ���� ����
DECLARE
  --[�Ϲݺ���  V], �Ű�����  P
  --���� �� : ���� ����
  --vname VARCHAR2(20);
  --vpay NUMBER(10);
  
  vname insa.name%TYPE := '�͸�'; --TYPE�� ����.
  vpay NUMBER(10) := 0 ;
  vpi CONSTANT NUMBER := 3.141592; -- ��� ���� CONSTANT
  vmessage VARCHAR2(100);
  
--desc insa;


BEGIN
  --���� ��
  SELECT name, basicpay + sudang
         INTO vname, vpay
  FROM insa
  WHERE num = 1001;
  --���

--java : system.out.prinf();
--oracle : DBMS_OUTPUT ��Ű�� ����� ���
  --DBMS_OUTPUT.PUT_LINE('�����='||vname);
  --DBMS_OUTPUT.PUT_LINE('�޿�='||vpay);
  vmessage := vname || ', ' || vpay;
  DBMS_OUTPUT.PUT_LINE('��� : '||vmessage);
--EXCEPTION
END;

--PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
-------------------------------------------------------------------------------- 
--����) 30�� �μ��� �������� ���ͼ� 10�� �μ��� ���������� ����.(�͸����ν��� �ۼ�)

select *
from dept;

10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON


declare
  vloc dept.loc%TYPE;
begin
  select loc  INTO vloc
  from dept
  where deptno = 30;
  
  update dept
  set loc = vloc
  where deptno = 10;
  
  --commit;
  
--exception
  --ROLLBACK;
end;
--PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
--------------------------------------------------------------------------------
--[����]10�� �μ��� �߿� �ְ� sal�� �޴� ����� ���� ��ȸ
--1)TOP-N

select *
from(
    select *
    FROM emp
    WHERE deptno = 10
    order by sal desc
)
where rownum = 1;
--2) rank�Լ�
select *
from(
select e.*
    ,rank() over(order by sal desc) sal_rank
from emp e
where deptno = 10
)
where sal_rank = 1;
--3) ��������

select *
from emp
where deptno = 10 and sal = (select max(sal)
                             from emp
                             where deptno = 10
                            );
--4) �͸� ���ν��� ����ؼ� ó��.
declare
 vmax_sal_10 emp.sal%type; -- Ÿ���� ���� ����
 vempno emp.empno%type; 
 vename emp.ename%type; 
 vjob emp.job%type; 
 vsal emp.sal%type; 
 vhiredate emp.hiredate%type; 
 vdeptno emp.deptno%type;
begin
--exception
 select max(sal) into vmax_sal_10
 from emp
 where deptno = 10;

 select empno, ename, job, sal, hiredate, deptno
    into vempno, vename, vjob, vsal, vhiredate, vdeptno
 from emp
 where deptno = 10 and sal = vmax_sal_10;
 
 DBMS_OUTPUT.PUT_LINE('�����ȣ : '||vempno);
 DBMS_OUTPUT.PUT_LINE('����� : '||vename);
 DBMS_OUTPUT.PUT_LINE('�Ի����� : '||vhiredate);
end;
--------------------------------------------------------------------------------
--4-2) �͸� ���ν��� ����ؼ� ó��.
declare
 vmax_sal_10 emp.sal%type; -- Ÿ���� ���� ����
 vrow emp%rowtype; --�� ���ڵ带 ��� ������ �� �ִ� ���� (���ڵ��� ���� ����)
begin
--exception
 select max(sal) into vmax_sal_10
 from emp
 where deptno = 10;

 select empno, ename, job, sal, hiredate, deptno
    into vrow.empno, vrow.ename, vrow.job, vrow.sal, vrow.hiredate, vrow.deptno
 from emp
 where deptno = 10 and sal = vmax_sal_10;
 
 DBMS_OUTPUT.PUT_LINE('�����ȣ : '||vrow.empno);
 DBMS_OUTPUT.PUT_LINE('����� : '||vrow.ename);
 DBMS_OUTPUT.PUT_LINE('�Ի����� : '||vrow.hiredate);
end;
--------------------------------------------------------------------------------                          
--ORA-01422: exact fetch returns more than requested number of rows
--PL/SQL���� �������� ���ڵ带 �����ͼ� ó���ϱ� ���ؼ��� Ŀ��(CURSOR ��Ƶδ� �������)�� ����ؾ� �Ѵ�.
DECLARE
  vname insa.name%TYPE := '�͸�';
  vpay NUMBER(10) := 0 ;
  vmessage VARCHAR2(100);
BEGIN
  SELECT name, basicpay + sudang
         INTO vname, vpay
  FROM insa; -- ��� ��� ������ ������
  vmessage := vname || ', ' || vpay;
  DBMS_OUTPUT.PUT_LINE('��� : '||vmessage);
--EXCEPTION
END;
--------------------------------------------------------------------------------
--Java
if(���ǽ�){
}


if(���ǽ�){
}else{
}


if(���ǽ�){
}else if(���ǽ�){
}else if(���ǽ�){
}else if(���ǽ�){
}


--PL/SQL
IF (���ǽ�) THEN
END IF;


IF (���ǽ�) THEN
ELSE
END IF;


IF (���ǽ�) THEN
ELSIF(���ǽ�) THEN
ELSIF(���ǽ�) THEN
ELSIF(���ǽ�) THEN
ELSIF(���ǽ�) THEN
ELSE
END IF;


--����) ������ �ϳ� �����ؼ� ������ �Է¹޾Ƽ� ¦��, Ȧ�� ���
--ORA-06502: PL/SQL: numeric or value error: character string buffer too small
DECLARE
 vnum NUMBER(4) := 0;
 vresult VARCHAR2(6) := 'Ȧ��'; --byte�� �ȵ� 2���� 6���� �����ؾ��Ѵ�.
BEGIN
 vnum := :bindNumber;
--EXCEPTION
 IF ( MOD(vnum,2) = 0 ) THEN
   vresult := '¦��';
 --ELSE
 --  vresult := 'Ȧ��';
 END IF;
 
 DBMS_OUTPUT.PUT_LINE(vnum || ' ' || vresult );
END;
--------------------------------------------------------------------------------
--[����] ���� ���� �Է¹޾Ƽ� ��~�� ���. (�͸����ν��� ���)

DECLARE
 vkor NUMBER(3) := 0;
 vgrade VARCHAR2(3) := '��';
BEGIN
 vkor := :bindNumber;
 
     IF (vkor between 0 and 100) THEN   
       IF (vkor >= 90) THEN vgrade := '��';       
       ELSIF (vkor >= 80) THEN  vgrade := '��';
       ELSIF (vkor >= 70) THEN  vgrade := '��';
       ELSIF (vkor >= 60) THEN  vgrade := '��';
       ELSIF (vkor >= 50) THEN  vgrade := '��';
     END IF;
     DBMS_OUTPUT.PUT_LINE(vgrade);
     ELSE
     DBMS_OUTPUT.PUT_LINE('�������� 0~100�� ���̷� �Է�' );
     END IF;    
END;

---------------------------------------------
--�ڡڡڡڡڡڡڡ�
DECLARE
 vkor NUMBER(3) := 0;
 vgrade VARCHAR2(3) := '��';
BEGIN
 vkor := :bindNumber;
 
     IF (vkor between 0 and 100) THEN   
      CASE trunc(vkor/10)
          when 10 then vgrade := '��';  
          when 9 then vgrade := '��';  
          when 8 then vgrade := '��';  
          when 7 then vgrade := '��';
          when 6 then vgrade := '��'; 
          else vgrade := '��'; 
      END CASE;
     DBMS_OUTPUT.PUT_LINE(vgrade);
     ELSE
     DBMS_OUTPUT.PUT_LINE('�������� 0~100�� ���̷� �Է�' );
     END IF;    
END;

------
DECLARE
 vkor NUMBER(3) := 0;
 vgrade VARCHAR2(3) := '��';
BEGIN
 vkor := :bindNumber;
     IF (vkor between 0 and 100) THEN   
      vgrade := CASE trunc(vkor/10)
          when 10 then '��'  
          when 9 then  '��'  
          when 8 then  '��'  
          when 7 then  '��'
          when 6 then  '��' 
          else  '��'
      END;
     DBMS_OUTPUT.PUT_LINE(vgrade);
     ELSE
     DBMS_OUTPUT.PUT_LINE('�������� 0~100�� ���̷� �Է�' );
     END IF;    
END;
--------------------------------------------------------------------------------
--LOOP...END LOOP;(�ܼ� �ݺ�) ��
--Java :
  while (true){
  //���ѷ���
  if(����) break;
  }
  
--Oracle :  
  LOOP
  --
  --
  EXIT WHEN ����
  END LOOP;
 
��) 1~10 = 55
DECLARE
    vi NUMBER := 1;
    vsum NUMBER := 0;
BEGIN
    LOOP
        IF vi = 10 THEN
        DBMS_OUTPUT.PUT(vi);
        ELSE
        DBMS_OUTPUT.PUT(vi || '+'); 
    END IF;    
    vsum := vsum + vi;
    EXIT WHEN vi = 10;
    vi := vi + 1;
    END LOOP;
      --vsum += vi;     
    --EXIT WHEN vi = 10 �����ݷ� ������ ���� 
    /*
    PLS-00103: Encountered the symbol "END" when expecting one of the following:
    * & - + ; / at mod remainder rem <an exponent (**)> and or ||
    multiset
    The symbol ";" was substituted for "END" to continue.
    */  
    DBMS_OUTPUT.PUT_LINE('=' || vsum); --LINE���� ����� �Ͼ��.
--EXCEPTION
END;
  
  
--------------------------------------------------------------------------------  
--WHILE...LOOP(������ �ݺ�) ��
Java :
while(���ǽ�){

}

--oracle :
while (���ǽ�)
LOOP
--
END LOOP;
��)1~10=55

------------------------
DECLARE
    vi NUMBER := 1;
    vsum NUMBER := 0;
BEGIN
    while( vi <= 10 )
    LOOP
        IF vi = 10 THEN DBMS_OUTPUT.PUT(vi);
        ELSE DBMS_OUTPUT.PUT(vi || '+'); 
    END IF;    
    vsum := vsum + vi;
    EXIT WHEN vi = 10;
    vi := vi + 1;
    END LOOP;   
    DBMS_OUTPUT.PUT_LINE('=' || vsum);  
END;


--------------------------------------------------------------------------------
--FOR...LOOP(������ �ݺ�) ��
--JAVA : FOR��
--ORACLE :

FOR �ݺ� ����(i) IN [REVERSE] ���۰�.. ����
LOOP
--�ݺ� ó�� ����

END LOOP;
---------------------------------------
--��)1+2+3+4+5+6+7+8+9+10=55

DECLARE 
 vi NUMBER := 1;
 vsum NUMBER := 0;
BEGIN
 FOR vi IN 1..10
 LOOP
   DBMS_OUTPUT.PUT(vi || '+');
   vsum := vsum + vi;
 END LOOP;
 DBMS_OUTPUT.PUT_LINE('=' || vsum);
--EXCEPTION
END;
---------------------------------------
DECLARE 
 --vi NUMBER := 1; FOR���� ���Ǵ� �ݺ������� �������� �ʾƵ� �ȴ�.
 vsum NUMBER := 0;
BEGIN
 FOR vi IN  REVERSE 1.. 10
 LOOP
   DBMS_OUTPUT.PUT(vi || '+');
   vsum := vsum + vi;
 END LOOP;
 DBMS_OUTPUT.PUT_LINE('=' || vsum);
--EXCEPTION
END;
--------------------------------------------------------------------------------
--GO TO��
--DECLARE
BEGIN
--
   GOTO first_proc;
--
   <<second_proc>>
   DBMS_OUTPUT.PUT_LINE('>  2 ó��');
   GOTO third_proc;
--
   <<first_proc>>
   DBMS_OUTPUT.PUT_LINE('>  1 ó��');
   GOTO second_proc;
   
   <<third_proc>>
   DBMS_OUTPUT.PUT_LINE('>  3 ó��');
   
 --EXCEPTION
END;
--------------------------------------------------------------------------------
--������(2~9) ���
1) WHILE LOOP ~ END LOOP ��� *2 

DECLARE
 vdan NUMBER(2) := 2;
 vi NUMBER(2) := 1;
 BEGIN
 --vdan 2~9
 while vdan <= 9
 LOOP 
  -- 1~9
  vi := 1; -- �߿�!
  WHILE vi <= 9
  LOOP
  --2*1=2
  DVMS_OUPUT.PUT(vdan || '*' || vi || '=' || RPAD(vdan*vi,4,' ') )
  vi := vi +1;
  END LOOP;
  DVMS_OUPUT.PUT_LINE(' ')
  vdan := vdan + 1;
 END LOOP;
--EXCEPTION
END;



2) FOR LOOP ~ END LOOP ���

--DECLARE
-- vdan NUMBER(2):=2 ;
-- vi NUMBER(2) := 1 ;

BEGIN
--EXCEPTION
    FOR vdan IN 2.. 9
    LOOP
        FOR vi IN 1.. 9
        LOOP
        DBMS_OUTPUT.PUT( vdan || '*' || vi || '=' || RPAD( vdan*vi, 4, ' ' ) );
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');   
    END LOOP;
    --EXCEPTION
END;

DECLARE




















