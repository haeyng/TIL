--[제약조건]
--date integrity (데이터 무결성)?
--제약조건? 신뢰되는 데이터를 다루기 위한 규칙

--부서 테이블 삭제
drop table dept;
--ORA-02449: unique/primary keys in table referenced by foreign keys
--foreign keys 참조하고 있는 키가 있어서 삭제X
--부모테이블 emp에서 참조하고 있는 참조키가 있기 때문에 삭제 불가.

INSERT INTO emp(empno) VALUES (7369);
--ORA-00001: unique constraint (SCOTT.PK_EMP) violated
-- = 개체 무결성에 위배된다
-- 하나하나의 개체 (레코드) emp에서는 사원들

dept(deptno(참조키)) -----  emp(deptno 외래키(FK))


UPDATE emp
SET deptno = 50
WHERE empno = 7839; --KING 10번부서
--ORA-02291: integrity constraint (SCOTT.FK_DEPTNO) violated - parent key not found
--50번 부서(참조키)가 존재하지 않기 때문에 오류
--참조 무결성의 규칙에 위배된다.


--king 의 부서를 null로 변경해보기
UPDATE emp
SET deptno = NULL
WHERE empno = 7839; --KING 10번부서
-- 외래 키는 반드시 참조 키의 값과 일치하거나 null을 가져야 한다.
commit;

select *
from emp;

--
insert into emp(empno) values ('abc');
--SQL 오류: ORA-01722: invalid number
--empno 는 number인데 문자를 넣으려고해서 오류
--도메인 무결성 규칙에 위배된다.

--tbl_score kor number(3)    0~100점 정수 제약 조건
-- 100점 이상인 111점이 들어가면 도메인 무결성 규칙에 위배 


-- 테이블에 pk nn fk 제약조건이 선언되어있지 않아도 상관없다.
-- 예) emp에서 중복되는 사원번호를 가진 사원이 들어가지고 삭제할때도 두명이 삭제되어버린다.
-- 즉, 테이블을 생성한 경우에 DML에 의한 데이터 조작이 사용자가 원하는 대로 되지 않을 수 있다.


--
사원테이블
사원번호    고유한키 PK
주민등록번호 유일한 키 == 중복되지 않는 키 (유일성제약조건) UK 
국어점수    NUMBER(3) -999~+999점 0~100점까지의 정수값만 저장하게 체크하는 키 CK
        INSERT , UPDATE 101점 하면 오류발생 --> 도메인 무결성 위배
        
--------------------------------------------------------------------------------        
-- 제약조건을 설정하는 방법
--1) 컬럼레벨 (in-line 방식)
--2) 테이블레벨 (out-of-line 방식)

-- 제약조건을 설정하는 시점
--1) 테이블 생성할 때 -CREATE TABLE문
--2) 테이블 수정할 때 -ALTER TABLE문

CREATE TABLE sample(
    id varchar2(20) PK,NN,CK,UK 등등 제약조건 -- 칼럼 하나 선언될때마다 뒤에 제약조건 : 칼럼레벨(IN-LIKE식 방식)
    ,pwd varchar2(20) PK,NN,CK,UK 등등 제약조건
    ,kor
    ,eng
    ,mat
    :
    :
    ,constraint 제약조건설정 -- 테이블레벨 (out-of-line 방식)
    ,constraint 제약조건설정
    ,constraint 제약조건설정
)

--------------------------------------------
CREATE TABLE sample(
    id varchar2(20) PK (NN 제약조건은 반드시 컬럼 레벨 방식으로만 설정할 수 있다.)
    ,pwd varchar2(20) PK,NN,CK,UK 등등 제약조건
    -- id,pwd가 합쳐져 복합 pk, 복합키는 칼럼레벨로는 설정할수 없고 테이블 레벨 방식으로만 설정할 수 있다. 
    ,kor
    ,eng
    ,mat
    :
    :
    ,constraint id (NN 제약조건은 테이블 레벨방식으로 설정할수 없다.)
    ,constraint id + pwd 복합키로 설정(테이블 레벨 방식으로만 설정할수있다.)
    ,constraint 제약조건설정
)
--------------------------------------------
--제약조건의 종류 5가지
 
1) PRIMARY KEY(PK)  해당 컬럼 값은 반드시 존재해야 하며, 유일해야 함
                    (NOT NULL과 UNIQUE 제약조건을 결합한 형태) 
                    
2) FOREIGN KEY(FK)  해당 컬럼 값은 참조되는 테이블의 컬럼 값 중의 하나와 일치하거나 NULL을 가짐 

3) UNIQUE KEY(UK)   테이블내에서 해당 컬럼 값은 항상 유일해야 함 

4) NOT NULL(NN)     컬럼은 NULL 값을 포함할 수 없다. (필수 입력 사항, 반드시 입력해야한다.)

5) CHECK(CK)        해당 컬럼에 저장 가능한 데이터 값의 범위나 조건 지정 

--------------------------------------------------------------------------------
--제약조건 실습
-- tbl_constraint

1) 칼럼 레벨 방식으로 제약조건을 설정.

CREATE TABLE tbl_constraint1(
    --empno NUMBER(4) NOT NULL PRIMARY KEY -- 자동으로 제약조건 이름이 sys_xxx
    
    --empno NUMBER(4) NOT NULL constraint 제약조건명(PK_테이블명_컬럼명) PRIMARY KEY -- 내가 원하는 제약조건 이름을 주고 제약조건을 설정
    empno NUMBER(4) NOT NULL constraint PK_tblconstraint1_empno PRIMARY KEY
);
--Table TBL_CONSTRAINT1이(가) 생성되었습니다.

select *
FROM user_constraints
WHERE table_name = upper('TBL_CONSTRAINT1');

--제약조건 이름
SYS_C007028 C NN 제약 조건
SYS_C007029 P PK 제약 조건
--

tbl_constraint1 에서 pk 제약조건을 제거 하려면?
ALTER TABLE 테이블명 
DROP [CONSTRAINT constraint명 | PRIMARY KEY | UNIQUE(컬럼명)]
[CASCADE];

1- 첫번째 방법) -- 제약조건 이름을 알아와서 입력 후 제거
alter table TBL_CONSTRAINT1
drop constraint SYS_C007029;
--Table TBL_CONSTRAINT1이(가) 변경되었습니다.

drop table TBL_CONSTRAINT1;
--Table TBL_CONSTRAINT1이(가) 삭제되었습니다.

------------------------------------------------
--내가 원하는 제약조건 이름을 주고 제약조건을 설정후 삭제
CREATE TABLE tbl_constraint1(
    --empno NUMBER(4) NOT NULL PRIMARY KEY -- 자동으로 제약조건 이름이 sys_xxx
    
    --empno NUMBER(4) NOT NULL constraint 제약조건명(PK_테이블명_컬럼명) PRIMARY KEY -- 내가 원하는 제약조건 이름을 주고 제약조건을 설정
    empno NUMBER(4) NOT NULL constraint PK_tblconstraint1_empno PRIMARY KEY
);
-------------------------------------
alter table TBL_CONSTRAINT1
drop constraint PK_tblconstraint1_empno;
--Table TBL_CONSTRAINT1이(가) 변경되었습니다.

drop table TBL_CONSTRAINT1;
--Table TBL_CONSTRAINT1이(가) 삭제되었습니다.
---------------------------------------------------
1- 두번째 방법) PK제약조건은 제약조건명을 몰라도 제거할 수 있다.
alter table tbl_constraint1
drop primary key;

--------------------------------------------------------------------------------
CREATE TABLE tbl_constraint1(
    --empno NUMBER(4) NOT NULL PRIMARY KEY -- 자동으로 제약조건 이름이 sys_xxx
    
    --empno NUMBER(4) NOT NULL constraint 제약조건명(PK_테이블명_컬럼명) PRIMARY KEY -- 내가 원하는 제약조건 이름을 주고 제약조건을 설정
    empno NUMBER(4) NOT NULL constraint PK_tblconstraint1_empno PRIMARY KEY
    ,ename VARCHAR2(20)
    ,deptno NUMBER(2) constraint FK_tblconstraint1_deptno REFERENCES dept (deptno)-- dept(deptno) 외래키로 설정 칼럼레벨 방식으로
                                                         -- 참조하는 테이블명(참조하는 칼럼명)
);
--Table TBL_CONSTRAINT1이(가) 생성되었습니다.

select *
FROM user_constraints
WHERE table_name = upper('TBL_CONSTRAINT1');

--PK(P) NN(C) FK(R)
---------------------------------------------
CREATE TABLE tbl_constraint1(
    --empno NUMBER(4) NOT NULL PRIMARY KEY -- 자동으로 제약조건 이름이 sys_xxx
    
    --empno NUMBER(4) NOT NULL constraint 제약조건명(PK_테이블명_컬럼명) PRIMARY KEY -- 내가 원하는 제약조건 이름을 주고 제약조건을 설정
    empno NUMBER(4) NOT NULL constraint PK_tblconstraint1_empno PRIMARY KEY
    ,ename VARCHAR2(20)
    ,deptno NUMBER(2) constraint FK_tblconstraint1_deptno REFERENCES dept (deptno)-- dept(deptno) 외래키로 설정 칼럼레벨 방식으로
                                                         -- 참조하는 테이블명(참조하는 칼럼명)
    --,kor number(3) constraint CK_tblconstraint1_kor CHECK(조건식)-- -999~+999 X 0~100점을 주는 제약조건 체크제약조건
    ,kor number(3) constraint CK_tblconstraint1_kor CHECK(kor between 0 and 100)
);


select *
FROM user_constraints
WHERE table_name = upper('TBL_CONSTRAINT1');

-----------------
CREATE TABLE tbl_constraint1(
    --empno NUMBER(4) NOT NULL PRIMARY KEY -- 자동으로 제약조건 이름이 sys_xxx
    
    --empno NUMBER(4) NOT NULL constraint 제약조건명(PK_테이블명_컬럼명) PRIMARY KEY -- 내가 원하는 제약조건 이름을 주고 제약조건을 설정
    empno NUMBER(4) NOT NULL constraint PK_tblconstraint1_empno PRIMARY KEY
    ,ename VARCHAR2(20)
    ,deptno NUMBER(2) constraint FK_tblconstraint1_deptno REFERENCES dept (deptno)-- dept(deptno) 외래키로 설정 칼럼레벨 방식으로
                                                         -- 참조하는 테이블명(참조하는 칼럼명)
    --,kor number(3) constraint CK_tblconstraint1_kor CHECK(조건식)-- -999~+999 X 0~100점을 주는 제약조건 체크제약조건
    ,kor number(3) constraint CK_tblconstraint1_kor CHECK(kor between 0 and 100)
    ,email varchar2 (250) constraint UK_tblconstraint1_email UNIQUE-- 중복되지 않는 유일한 값 , 유일성 제약 조건(UK)
);

-----------------------------
CREATE TABLE tbl_constraint1(
    --empno NUMBER(4) NOT NULL PRIMARY KEY -- 자동으로 제약조건 이름이 sys_xxx
    
    --empno NUMBER(4) NOT NULL constraint 제약조건명(PK_테이블명_컬럼명) PRIMARY KEY -- 내가 원하는 제약조건 이름을 주고 제약조건을 설정
    empno NUMBER(4) NOT NULL constraint PK_tblconstraint1_empno PRIMARY KEY
    ,ename VARCHAR2(20)
    ,deptno NUMBER(2) constraint FK_tblconstraint1_deptno REFERENCES dept (deptno)-- dept(deptno) 외래키로 설정 칼럼레벨 방식으로
                                                         -- 참조하는 테이블명(참조하는 칼럼명)
    --,kor number(3) constraint CK_tblconstraint1_kor CHECK(조건식)-- -999~+999 X 0~100점을 주는 제약조건 체크제약조건
    ,kor number(3) constraint CK_tblconstraint1_kor CHECK(kor between 0 and 100)
    ,email varchar2 (250) constraint UK_tblconstraint1_email UNIQUE-- 중복되지 않는 유일한 값 , 유일성 제약 조건(UK)
    ,city varchar2(20) constraint CK_tblconstraint1_city CHECK(city in('서울','부산','대구','대전')) -- 서울, 부산, 대구, 대전 중에 하나만 사용하도록 제약 -- 체크제약 조건
);





--------------------------------------------------------------------------------
2) 테이블 레벨 방식으로 제약조건을 설정.

drop table tbl_constraint2;

CREATE TABLE tbl_constraint2(
    empno NUMBER(4) NOT NULL

    ,CONSTRAINT PK_tbl_constraint2_empno PRIMARY KEY -- 어떤 레코드가 PK를 가질지 명시되어 있지 않음
)
--ORA-00906: missing left parenthesis

CREATE TABLE tbl_constraint2(
    empno NUMBER(4) NOT NULL

    ,CONSTRAINT PK_tbl_constraint2_empno PRIMARY KEY (empno) --(empno,등등) 하면 복합키
)


select *
FROM user_constraints
WHERE table_name = upper('TBL_CONSTRAINT2');


---------------------------------------------
CREATE TABLE tbl_constraint2(
    empno NUMBER(4) NOT NULL
    ,enmae VARCHAR2 (20)
    ,deptno number(2)

    ,CONSTRAINT PK_tbl_constraint2_empno PRIMARY KEY(empno) -- 어떤 레코드가 PK를 가질지 명시되어 있지 않음
    --,constraint FK_tblconstraint2_deptno REFERENCES dept (deptno) --FK 칼럼명이 없음
    ,constraint FK_tbl_constraint2_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
);
------------

CREATE TABLE tbl_constraint2(
    empno NUMBER(4) NOT NULL
    ,enmae VARCHAR2 (20)
    ,deptno number(2)
    ,kor number(3)

    ,CONSTRAINT PK_tbl_constraint2_empno PRIMARY KEY(empno) -- 어떤 레코드가 PK를 가질지 명시되어 있지 않음
    --,constraint FK_tblconstraint2_deptno REFERENCES dept (deptno) --FK 칼럼명이 없음
    ,constraint FK_tbl_constraint2_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
    --,constraint CK_tblconstraint1_kor CHECK(kor between 0 and 100) -- 대상 칼럼이 없음 -- KOR에 포함되어 있어서 칼럼 레벨 방식과 똑같음
    ,constraint CK_tblconstraint1_kor CHECK(kor between 0 and 100) 
);
--------------------


CREATE TABLE tbl_constraint2(
    empno NUMBER(4) NOT NULL
    ,enmae VARCHAR2 (20)
    ,deptno number(2)
    ,kor number(3)
    ,email varchar2(250)

    ,CONSTRAINT PK_tbl_constraint2_empno PRIMARY KEY(empno) -- 어떤 레코드가 PK를 가질지 명시되어 있지 않음
    --,constraint FK_tblconstraint2_deptno REFERENCES dept (deptno) --FK 칼럼명이 없음
    ,constraint FK_tbl_constraint2_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
    --,constraint CK_tblconstraint1_kor CHECK(kor between 0 and 100) -- 대상 칼럼이 없음 -- KOR에 포함되어 있어서 칼럼 레벨 방식과 똑같음
    ,constraint CK_tblconstraint2_kor CHECK(kor between 0 and 100)
    ,constraint UK_tblconstraint2_email UNIQUE (email)-- 칼럼명이 빠져있음(email)
);

-----------------------------------
 
 
 CREATE TABLE tbl_constraint2(
    empno NUMBER(4) NOT NULL
    ,enmae VARCHAR2 (20)
    ,deptno number(2)
    ,kor number(3)
    ,email varchar2(250)

    ,CONSTRAINT PK_tbl_constraint2_empno PRIMARY KEY(empno) -- 어떤 레코드가 PK를 가질지 명시되어 있지 않음
    --,constraint FK_tblconstraint2_deptno REFERENCES dept (deptno) --FK 칼럼명이 없음
    ,constraint FK_tbl_constraint2_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
    --,constraint CK_tblconstraint1_kor CHECK(kor between 0 and 100) -- 대상 칼럼이 없음 -- KOR에 포함되어 있어서 칼럼 레벨 방식과 똑같음
    ,constraint CK_tblconstraint2_kor CHECK(kor between 0 and 100)
    ,constraint UK_tblconstraint2_email UNIQUE (email)-- 칼럼명이 빠져있음(email)
    ,constraint CK_tblconstraint2_city CHECK(city in('서울','부산','대구','대전'))
);

--------------------------------------------------------------------------------
3) 테이블 생성 후에 pk 제약조건을 설정하려고 함 (테이블을 수정한다는 의미)------★★★★★★★★
CREATE TABLE tbl_constraint3(
    empno NUMBER(4)
    ,ename varchar2(20)
    ,deptno number(2)
)
--
alter table tbl_constraint3
--add(컬럼명,... )
add constraint PK_tbl_constraint3_empno PRIMARY KEY (empno);
--
select *
FROM user_constraints
WHERE table_name = upper('TBL_CONSTRAINT3');

drop table tbl_constraint3;

--------------------------------------------------------------------------------
-- 제약조건 비활성화/활성화
--활성
alter table 테이블명
enable constraint 제약조건명;
--비활성
alter table 테이블명
disable constraint 제약조건명;

--
drop table 테이블명; -- 테이블 휴지통에 삭제(복구 가능)
drop table 테이블명 cascade constraints; -- 테이블과 그 테이블을 참조하는 포린키를 동시에 삭제한다.
drop table 테이블명 purge; -- 휴지통에 넣지 않고 완전 삭제

예)
drop table dept; -- 삭제불가 emp(deptno fk 외래키, 참조)
drop table dept cascade constraints; --dept 테이브로가 emp 테이블 안에 있는 deptno(포린키)(칼럼)를 삭제한다.

--
alter table 테이블명
add (칼럼,...)
add (제약조건,..) 여러개 추가 가능? 확인하기
--

--
【컬럼레벨의 형식】
        컬럼명 데이터타입 CONSTRAINT constraint명
	REFERENCES 참조테이블명 (참조컬럼명) 
             [ON DELETE CASCADE | ON DELETE SET NULL]

--emp 테이블로 가정
emp,
    deptno NUMBER(2) constraint FK_EMP_DEPTNO  
           REFERENCES dept(deptno)
           1) --ON DELETE CASCADE; -- 의미? on delete cascade를 주면 emp 테이블에 30번 사원들도 같이 삭제된다.
           2) ON DELETE SET NULL; --의미? emp 테이블에 30번 사원들의 deptno = null로 설정된다.
--
DELETE FROM dept
where deptno = 30;
--ORA-02292: integrity constraint (SCOTT.FK_DEPTNO) violated - child record found
-- 참조 무결성 제약조건 위반 --참조하고 있는 자식 테이블에 사원들이 있기 때문에 삭제 불가 emp 사원 테이블에 30번 사원이 참조하고 있다


update emp
set deptno = null
where deptno = 30;

select *
from emp;

rollback;

--------------------------------------------------------------------------------
ON DELETE CASCADE
ON DELETE SET NULL
-- 실습

emp -> tbl_emp 생성
dept -> tbl_dept 생성

create table tbl_emp as(select * from emp)
create table tbl_dept as(select * from dept)
--Table TBL_EMP이(가) 생성되었습니다.
--Table TBL_DEPT이(가) 생성되었습니다.

--dept 테이블의 제약조건을 확인 -> PK 제약조건-> tbl_dept PK 제약조건 추가
alter table tbl_dept
add(constraint pk_tbldept_deptno primary key (deptno));
--emp 테이블의 제약조건을 확인 -> PK , FK제약조건 -> tbl_dept PK , FK 제약조건 추가
alter table tbl_emp
add(constraint pk_tbldept_empno primary key (empno));
--FK 추가할 때 ON DELETE CASCADE 옵션을 추가
alter table tbl_emp
add constraint fk_tbldept_empno foreign key (deptno)
    references tbl_dept(deptno)
    on delete cascade;
    
--
select * from tbl_emp;

select * from tbl_dept;

delete from tbl_dept
where deptno = 30; --30번 부서 삭제

rollback;
----------------------------------------------------

    
--제약조건 삭제 후 새로 만듦
alter table tbl_emp
drop constraint fk_tbldept_empno;

--제약조건 추가
alter table tbl_emp
add constraint fk_tbldept_empno foreign key (deptno)
    references tbl_dept(deptno)
    on delete set null;

delete from tbl_dept
where deptno = 30; --30번 부서에 null이 들어가 있음

select * from tbl_emp;

select * from tbl_dept;

--------------------------------------------------------------------------------
--조인(JOIN)--
CREATE TABLE book(
       b_id     VARCHAR2(10)    NOT NULL PRIMARY KEY   -- 책ID
      ,title      VARCHAR2(100) NOT NULL  -- 책 제목
      ,c_name  VARCHAR2(100)    NOT NULL     -- c 이름
     -- ,  price  NUMBER(7) NOT NULL
 );
-- Table BOOK이(가) 생성되었습니다.
INSERT INTO book (b_id, title, c_name) VALUES ('a-1', '데이터베이스', '서울');
INSERT INTO book (b_id, title, c_name) VALUES ('a-2', '데이터베이스', '경기');
INSERT INTO book (b_id, title, c_name) VALUES ('b-1', '운영체제', '부산');
INSERT INTO book (b_id, title, c_name) VALUES ('b-2', '운영체제', '인천');
INSERT INTO book (b_id, title, c_name) VALUES ('c-1', '워드', '경기');
INSERT INTO book (b_id, title, c_name) VALUES ('d-1', '엑셀', '대구');
INSERT INTO book (b_id, title, c_name) VALUES ('e-1', '파워포인트', '부산');
INSERT INTO book (b_id, title, c_name) VALUES ('f-1', '엑세스', '인천');
INSERT INTO book (b_id, title, c_name) VALUES ('f-2', '엑세스', '서울');

COMMIT;

SELECT *
FROM book;

-- 단가테이블(책의 가격)
  CREATE TABLE danga(
      b_id  VARCHAR2(10)  NOT NULL  -- 동시에 PK , FK (식별관계 : 부모테이블의 b_id 단가 테이블에 fk키로 참조가 되는데 pk가 되면 식별관계라고 한다.)
      ,price  NUMBER(7) NOT NULL    -- 책 가격
      
      ,CONSTRAINT PK_dangga_id PRIMARY KEY(b_id)
      ,CONSTRAINT FK_dangga_id FOREIGN KEY (b_id)
              REFERENCES book(b_id)
              ON DELETE CASCADE
);
--Table DANGA이(가) 생성되었습니다.

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

-- 책을 지은 저자테이블
 CREATE TABLE au_book(
       id   number(5)  NOT NULL PRIMARY KEY
      ,b_id VARCHAR2(10)  NOT NULL  CONSTRAINT FK_AUBOOK_BID
            REFERENCES book(b_id) ON DELETE CASCADE
      ,name VARCHAR2(20)  NOT NULL
);

INSERT INTO au_book (id, b_id, name) VALUES (1, 'a-1', '저팔개');
INSERT INTO au_book (id, b_id, name) VALUES (2, 'b-1', '손오공');
INSERT INTO au_book (id, b_id, name) VALUES (3, 'a-1', '사오정');
INSERT INTO au_book (id, b_id, name) VALUES (4, 'b-1', '김유신');
INSERT INTO au_book (id, b_id, name) VALUES (5, 'c-1', '유관순');
INSERT INTO au_book (id, b_id, name) VALUES (6, 'd-1', '김하늘');
INSERT INTO au_book (id, b_id, name) VALUES (7, 'a-1', '심심해');
INSERT INTO au_book (id, b_id, name) VALUES (8, 'd-1', '허첨');
INSERT INTO au_book (id, b_id, name) VALUES (9, 'e-1', '이한나');
INSERT INTO au_book (id, b_id, name) VALUES (10, 'f-1', '정말자');
INSERT INTO au_book (id, b_id, name) VALUES (11, 'f-2', '이영애');

COMMIT;

SELECT * 
FROM au_book;

--판매 테이블 -- 출판사 --> 책 판매 구조 --> 서점
-- 고객 테이블(서점)
 CREATE TABLE gogaek(
      g_id       NUMBER(5) NOT NULL PRIMARY KEY 
      ,g_name   VARCHAR2(20) NOT NULL
      ,g_tel      VARCHAR2(20)
);
          

 INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (1, '우리서점', '111-1111');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (2, '도시서점', '111-1111');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (3, '지구서점', '333-3333');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (4, '서울서점', '444-4444');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (5, '수도서점', '555-5555');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (6, '강남서점', '666-6666');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (7, '강북서점', '777-7777');

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


-- JOIN 종류
1) EQUI JOIN
    - WHERE 조건절에 조인 조건 (=)
                        부.PK = 자.PK
    - 오라클에서는 natural join과 동일
    - USING 절을 사용


--[문제] 책ID, 책제목, 출판사(c_name), 단가 출력
    book : b_id, title, c_name
    danga : b_id, price

1)객체명.컬럼명
SELECT book.b_id, book.title, book.c_name, danga.price
from book, danga
where book.b_id = danga.b_id; -- 조인 조건 = EQUI JOIN

2)별칭(ailas).컬럼명
SELECT b.b_id, b.title, c_name, price
from book b, danga d
where b.b_id = d.b_id; -- 조인 조건 = EQUI JOIN

3)JOIN ~ ON 구문
SELECT b.b_id, b.title, c_name, price
from book b JOIN danga d
ON b.b_id = d.b_id; -- 조인 조건 = EQUI JOIN

4)USING 절 사용 - 객체명.컬럼명 또는 별칭명.컬럼명 을 사용하지 않는다.
SELECT b_id, title, c_name, price
from book JOIN danga USING (b_id);

5)
SELECT b_id, title, c_name, price
from book natural JOIN danga;


--[문제] 책ID, 책제목, 판매수량, 단가, 서점명, 판매금액 출력
    book : b_id, title
    danga : b_id, price
    * panmai : b_id, p_su
    * gogaek : g_name

1) , 쓰는 JOIN 사용
-- 판매금액 = 판매수량(p_su) * 단가(price)
select b.b_id, title, p_su, price,g_name, p_su*price 판매금액
from book b, panmai p, danga d, gogaek g
where b.b_id = p.b_id and b.b_id = d.d_id and p.g_id = g.g_id;


2) JOIN ~ ON 사용
select b.b_id, title, p_su, price,g_name, p_su*price 판매금액
from book b join panmai p on b.b_id = p.b_id
            JOIN danga d ON b.b_id = d.b_id
            JOIN gogaek g ON p.g_id = g.g_id;

3) USING 사용

select b_id, title, p_su, price,g_name, p_su*price 판매금액
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

--INNER JOIN : 둘 이상의 테이블에서 조인조건을 만족하는 행만 반환한다. (양쪽에 공통적인것만 조회됨)
--emp / dept JOIN

select d.deptno, ename, sal -- king은 나오지 않는다. --사원도 안나옴 //null인것도 안나오고 40번도 안나오고
from emp e, dept d
where d.deptno = e.deptno; --EQUI JOIN, INNER JOIN, INNER JOIN 10/20/30

--emp deptno = null (king)
--dept 40 (양쪽에 다 있는 deptno만 조회된다.)
select deptno
from dept;
from emp;

----------------------------------------------------------------
select d.deptno, ename, sal 
from emp e, dept d
where e.deptno = d.deptno(+); --left outer join --king도 조회 된다.

--위와 같은 코딩 left outer join
select d.deptno, ename, sal 
from emp e left outer join dept d
on e.deptno = d.deptno;


-- right outer join
select d.deptno, ename, sal 
from emp e, dept d
where e.deptno(+) = d.deptno; -- 40번 정보 조회된다.
--위와 같은 코딩 right outer join
select d.deptno, ename, sal 
from emp e right outer join dept d
on e.deptno = d.deptno;


--양쪽 빠진 것 다 조회하고 싶을때
--FULL OUTER JOIN
select d.deptno, ename, sal 
from emp e FULL outer join dept d
on e.deptno = d.deptno;


--SELF JOIN : 같은 테이블을 조인
--deptno/empno/ename     직속상사의 부서번호/사원번호/사원명

select e1.deptno, e1.empno, e1.ename, e2.deptno, e1.mgr, e2.ename
from emp e1 , emp e2 -- self join
where e1.mgr = e2.empno;
--
select e1.deptno, e1.empno, e1.ename, e2.deptno, e1.mgr, e2.ename
from emp e1 join emp e2 -- inner join (inner 생략)
on e1.mgr = e2.empno; --equi join



-- cross join 모든 경우의 수 조회
-- 12 * 4 = 48
select d.deptno, dname, empno, ename
from emp e , dept d; --join 조건이 없는 cross join
-- 위와 같은 코딩
select d.deptno, dname, empno, ename
from emp e cross join dept d;




