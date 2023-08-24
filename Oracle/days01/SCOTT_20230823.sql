-- 신입사원 입사 ->
    -- 모든 물건(객체) 책상, 컴퓨터, 필기구, 의자, 명찰.. 등을 만들어 준다 =>데이터 베이스 객체들

-- 사용자 계정 생성 -> 모든 데이터베이스 객체들을 만들어준다 => 스키마(SCHEMA)라고 한다.


--1) 윈도우 탐색기 C:\oraclexe 폴더
--2) scott.sql 검색
--3)
--4) scott 계정이 소유하고 있는 테이블이 어떤것이 있는지 조회. 확인 작업 DQL 문
-- (1) scott계정으로 접속
-- (2) 아래 SQL문 실행.
SELECT *
FROM user_tables;
--결과가 안나옴 소유하고 있는 테이블이 없다는 의미.
SELECT *
FROM tabs;
--tabs == user_tables 약어

Microsoft Windows [Version 10.0.19045.3324]
(c) Microsoft Corporation. All rights reserved.

C:\Users\user>sqlplus / as sysdba

SQL*Plus: Release 11.2.0.2.0 Production on 수 8월 23 16:48:44 2023

Copyright (c) 1982, 2014, Oracle.  All rights reserved.


Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL> show user
USER is "SYS"
SQL> @C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql
SQL>

--입력하면 테이블이 생성된다.


CREATE USER 계정생성
DROP USER 계정삭제
ALTER USER 계정 생성,삭제,수정

CREATE TABLE 테이블 생성
DROP TABLE SALGRADE; --테이블 삭제 순서대로 삭제 안하면 오류남
DROP TABLE BONUS;
DROP TABLE EMP;
DROP TABLE DEPT;
ALTER TABLE 테이블 수정
--------------------------------------------------------------------------------
CREATE TABLE DEPT
       (DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14) ,
	LOC VARCHAR2(13) ) ;
--------------------------------------------------------------------------------
CREATE TABLE EMP
       (EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);
--------------------------------------------------------------------------------
INSERT INTO DEPT VALUES
	(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES
	(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES
	(40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87')-85,3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-JUL-87')-51,1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
--------------------------------------------------------------------------------
CREATE TABLE BONUS
	(
	ENAME VARCHAR2(10)	,
	JOB VARCHAR2(9)  ,
	SAL NUMBER,
	COMM NUMBER
	) ;
--------------------------------------------------------------------------------
CREATE TABLE SALGRADE
      ( GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER );
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;
--------------------------------------------------------------------------------
--사원 정보 조회
SELECT *
FROM emp;
--부서 정보 조회
SELECT *
FROM dept; --접속자가 스캇이기 때문에 스캇 생략 하고 테이블명만 적어도 가능함
FROM scott.dept;
FROM 스키마.테이블명;
FROM 스키마.뷰명;
--------------------------------------------------------------------------------

