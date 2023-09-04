

-- 오라클 자료형(Data Type)--
--1)CHAR
   -- 고정 길이
   -- CHAR(size Byte | CHAR)
   -- CHAR == CHAR(1) == CHAR(1 BYTE)
   -- 2000byte
   -- 한글(3바이트) 알파벳(1바이트)

--2)NCHAR == N(UNICODE) + CHAR
             -- 같은 바이트로 처리
  -- CHAR(size == 문자)
  -- NCHAR로 선언된 컬럼은 캐릭터만 정의할 수 있다, 유니코드이기 때문에 바이트로는 X 기본 CHAR
  -- 1문자 , 2000byte
  -- 고정 길이
  -- 예) NCHAR(20) [A][한][][][][][][][][][][][][][][][][][][]
  -- NCHAR == NCHAR(1) 1문자
  -- 바이트 사용X
  
  create table test (
  aa char(3) --char(3 byte)
  , bb char(3 char) --세 문자
  , cc nchar(3)); --세 문자
  
-- Table TEST이(가) 생성되었습니다.
  
INSERT INTO test(aa, bb, cc) VALUES ('홍길동','홍길동','홍길동');
--SQL 오류: ORA-12899: value too large for column "SCOTT"."TEST"."AA" (actual: 9, maximum: 3)
-- 자료형 크기보다 큰값이 들어가서 오류

INSERT INTO test(aa, bb, cc) VALUES ('홍','홍길동','홍길동');
--1 행 이(가) 삽입되었습니다.
commit;


INSERT INTO test(aa, bb, cc) VALUES ('홍','홍길동','홍길동');


-- 고정 길이를 나타내는 자료형 CHAR , NCHAR
-- (일단 메모리를 할당하고 값이 없는 곳에는 공백이 들어가져있다.)
  
  
-- 가변길이 자료형
-- 3) VARCHAR2            VAR (가변)
-- 가변길이
-- 최대크기 4000Byte

-- 예) 고정길이/가변길이
     name CHAR(10 CHAR)      [m][b][c][][][][][][][공백]   -- mbc로 넣더라도 10문자로 잡혀져 있음
     name VARCHAR2(10 CHAR)  [m][b][c] // [][][][][][][]  -- mbc로 넣으면 3문자로 잡혀져 있음 나머지 공백은 메모리를 할당하지 않는다.
                             -- 최대 이름 문자열의 길이 == size
     VARCHAR2(10) == VARCHAR2(10 Byte)
     VARCHAR2 == VARCHAR2(1) == VARCHAR2(1 Byte)
  
  
--4) CHAR, NCHAR, VARCHAR2, [NVARCHAR2]
-- N + VAR + CHAR2 유니코드 형태의 문자를 저장하는 자료형

--5) LONG : 가변 문자 자료형, 2GB
 --JAVA : long 정수를 나타내는 자료형 -- -900경 ~ +900경
 --Oracle : long 가변 문자를 저장하는 자료형, 2GB까지 저장 가능
  
--6) NUMBER  숫자를 나타내는 자료형 (숫자 == 정수 + 실수)
-- NUMBER
-- NUMBER (p)    p는 precision 정확도 == 전체 자릿수  1 ~ 38까지의 값 , 
-- NUMBER (p,s)  s는 scale 규모 == 소수점 이하 자릿수  -83~ 127까지의 값
    NUMBER(4) S(소수점)는 없기 때문에 정수를 뜻함
    
    NUMBER(5,2) 실수(전체 자릿수 5자리에 소숫점 2자리까지)
    
    예) NUMBER(3,7) ===> 0.0000[][][] 형태의 데이터 저장. 
    -- 전체 자릿수가 소수점 자릿수보다 반드시 클 필요는 없다.
    -- NUMBER(4,5)처럼 scale이 precision보다 크다면, 이는 첫자리에 0이 놓이게 된다.

    kor NUMBER; == kor NUMBER(38,127) NUMBER로 가장 큰 자료값을 나타낸다는 의미
   
    kor NUMBER(3) == kor NUMBER(3,0) -- 0 생략

    
    예)
    CREATE TABLE tbl_number(
          kor NUMBER(3,0) -- 점수는 0~100 이니까 세자리 3        
         ,eng NUMBER(3,0)
         ,mat NUMBER(3,0)
         ,tot NUMBER(3,0)
         ,avg NUMBER(5,2)
         
    );

INSERT INTO tbl_number(kor, eng, mat, tot, avg) VALUES(90.89, 85, 100);
-- 오류: ORA-00947: not enough values 실제 값들이 충분하지 않다. tot와 avg가 없다.


-- 주고자 하는 칼럼 값만 줄 때
INSERT INTO tbl_number(kor, eng, mat) VALUES(90.89, 85, 100); 
-- 국어는 kor NUMBER(3,0)으로 자료형을 잡아놨는데 소수점을 줬지만 에러가 발생하지 않음 왜?
-- 90.89 -> 91 소수점 첫째자리에서 반올림되어서 올라가진다.


select *
from tbl_number;
[결과]
91	85	100		

commit;


INSERT INTO tbl_number(kor, eng, mat) VALUES(90, 85, 300); 
--1 행 이(가) 삽입되었습니다.

select *
from tbl_number;
[결과]
90	85	300
  
-- 999도 세자리이기 때문에 들어가졌다.
  
  
  INSERT INTO tbl_number(kor, eng, mat) VALUES(90, 85, -999); 
  
  select *
  from tbl_number;
  
  --,mat NUMBER(3,0)
  --- 999~999까지 집어 넣겠다는 의미
  -- 제약조건으로 0 ~ 100의 값만 넣겠다고 추가하면 된다. --자료형은 number 3자리로 잡아야한다.
  
  rollback;
  
  select *
  from tbl_number;
  
  [결과]
  91	85	100
  
  
  INSERT INTO tbl_number(kor, eng, mat) VALUES(80, 75, 30); 
  
  commit;
  
  select *
  from tbl_number;
  [결과]
  91	85	100
  80	75	30
  
  
  
  -- java에서 for/while 반복문 kor, eng, mat 랜덤한 정수 값을 발생시켜서 집어넣었다.
  -- oracle에서 PL/SQL
  
  INSERT INTO tbl_number(kor, eng, mat) VALUES(trunc(dbms_random.value(0,101))
                                              ,trunc(dbms_random.value(0,101))
                                              ,trunc(dbms_random.value(0,101)));
  
  -- 각 점수의 랜덤한값 발생
  select trunc(dbms_random.value(0,101))
  from dual;
  
  commit;
  
  select *
  from tbl_number;
  
  
  -- 모든 학생의 총점, 평균 계산 (UPDATE)
  UPDATE tbl_number
  set tot = kor + eng + mat , avg = (kor+eng+mat)/3;
  
  --where 생략하면 모든 레코드
  
  commit;
  
  
  
  
  -- 첫번째 학생의 성적 수정하려고 함
  select *
  from tbl_number;
  -- 수정하려면 하나하나의 학생들을 구별할 수 있는 고유한 키가 필요하다.
  -- 
  UPDATE tbl_number
    set avg = 999.12345665
  where avg = 92; -- 고유한 키를 primary key 라고 한다. 예)학번 같은
  소수점 셋째 자리에서 반올림
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
  -- 지정된 precision보다 큰 값이 들어가서 오류
  
  drop table tbl_number;
  
  
  -- char, nchar        varchar2, nvarchar2
  -- long 
  -- number(p,s)
     number == number(38,127) --생략하면 최댓값 준것과 같다.
     number(p) == number(p,0) 정수
     number(p,s) == 실수
     
     desc emp;
  

desc dept;
  
  
--7) FLOAT(p) == NUMBER 내부적으로 NUMBER로 처리된다.
    -- 잘 사용되지 않음
    
--8)DATE  날짜정보 + 시간정보 (초까지 가지고 있다.) 7byte
    TIMESTAMP                             , + ms , ns
    
    예) 학생정보를 저장하고 관리하는 테이블 생성
        학번의 자료형 : NUMBER(7) , VAR X,  [CHAR] 학번은 고정 길이이고, 한글은 포함되지 않기 때문에
        이름의 자료형 : 가변 길이 NVARCHAR2() 이름은 3글자 이상 글자, 한글 10문자 이름까지 저장.
                                           이름이 10글자 이상이면? 테이블 수정 (컬럼의 크기 수정) 
        국어, 영어, 수학, 총점 : NUMBER(3) + 체크제약조건( 0~100 정수)
                              -999~+999
        평균 : 100.00 NUMBER(5,2)
        등수 : NUMBER(3) -- 999등까지
        생일 : 날짜    [DATE], TIMESTAMP x ms, ns 필요없음 
        주민등록번호 : [CHAR(14)], NCHAR X 굳이 2바이트 유니코드로 저장할 필요 없음  
        

--9)TIMESTAMP : DATE 확장
    TIMESTAMP(6) == TIMESTAMP (값을 안주면 6) --> .000000
    TIMESTAMP(0)
    TIMESTAMP(9)
    
    
--10) 2진 데이터(0,1)
      예) 이미지 파일, 실행 파일  --> 2진 데이터로 변환 --> DB에 저장 할 때 사용하는 자료형이 RAW(SIZE) 2000byte, LONG RAW 2GB

--11) RAW(2000byte까지 저장 가능)
      LONGRAW (2GB까지 저장 가능)
      BLOB (B 는 Binary 2진 LOB는 Large Object 큰 객체를 뜻함) 4GB까지 저장이 가능하다.
      BFILE (Binary 데이터를 외부에 file형태로 (264 -1바이트)까지 저장)
  
--12) CHAR, NCHAR (2000byte)
      VARCHAR2, NVARCHAR2 (4000byte)
      LONG(2GB)
      CLOB(4BG)  -- 게시판 글 내용은 CLOB 아니면 NCLOB로 자료형을 사용한다.
      N+CLOB(4GB)
      
--------------------------------------------------------------------------------
--COUNT OVER() 질의한 행의 누적된 결과값을 반환하는 함수이다.

SELECT name, basicpay
    ,COUNT(*)
FROM insa;
--GROUP BY 절 필요      
--ORA-00937: not a single-group group function      


-- 누적된 값을 counting 함
SELECT buseo, name, basicpay
    --,COUNT (*) OVER(ORDER BY basicpay asc)
    ,COUNT (*) OVER(PARTITION BY buseo ORDER BY basicpay asc) --부서 안에서의 누적된 값 counting
FROM insa;




SELECT buseo, name, basicpay
    --,SUM(basicpay) OVER(ORDER BY basicpay asc) -- sum 누적
    ,SUM(basicpay) OVER(PARTITION BY buseo ORDER BY basicpay asc) -- 부서 안에서의 누적된 합
FROM insa;

      
      
-- 각 지역별 급여 평균과 각 사원들 간의 급여액의 차이 조회

select city, name, basicpay
    ,avg(basicpay) over(partition by city order by city)
    ,basicpay - avg(basicpay) over(partition by city order by city)
from insa;      
  
--------------------------------------------------------------------------------
-- [테이블을 생성하고 수정, 삭제]
-- 테이블 안의 레코드(행,row)를 추가, 수정, 삭제하는 작업

--1) 테이블 : 데이터를 저장하는 저장소
--2) ***DB 모델링*** -> 테이블 생성
  예) 게시판의 게시글을 저장할 테이블 생성
     1) 테이블명 : tbl_board
     2)              컬럼명         자료형               크기                   널허용여부                                               설명          
        글번호(열쇠PK)  seq         숫자(정수)          NUMBER(38)                  NOT NULL                                     게시글의 번호
        작성자         writer       문자              VARCHAR2(20 byte)           NOT NULL
        비밀번호       passwd        문자             VARCHAR2(15)                NOT NULL
        제목          title         문자             VARCHAR2(100)               NOT NULL
        내용          content        문자            CLOB                (오라클은 NULL일때는 아무것도 X NULL로 하면 오류난다.)
        작성일        regdate        날짜             DATE                        DEFAULT SYSDATE(자동입력)
        :
        :
        
     3) 게시글을 구분할 수 있는 고유한 키 : 글번호
     4) 필수 입력 사항 :  == NOT NULL(NN) (NOT NULL은 제약 조건 중에 하나)
     5) 작성일은 현재 시스템의 날짜로 자동 입력 : 
  
  
【간단한형식】
    CREATE [GLOBAL TEMPORARY] TABLE [schema.] table
      ( 
        열이름  데이터타입 [DEFAULT 표현식] [제약조건] 
       [,열이름  데이터타입 [DEFAULT 표현식] [제약조건] ] 
       [,...]  
      ); 

  
【간단한형식】
    CREATE TABLE tbl_board
( 
        seq        NUMBER(38)                                  NOT NULL PRIMARY KEY
        ,writer    VARCHAR2(20 byte)                           NOT NULL
        ,passwd    VARCHAR2(15)                                NOT NULL
        ,title     VARCHAR2(100)                               NOT NULL
        ,content   CLOB                
        ,regdate   DATE                        DEFAULT SYSDATE
); 

-- 테이블 생성 완료
  
DESC tbl_board;
[결과]  
이름      널?       유형            
------- -------- ------------- 
SEQ     NOT NULL NUMBER(38)    
WRITER  NOT NULL VARCHAR2(20)  
PASSWD  NOT NULL VARCHAR2(15)  
TITLE   NOT NULL VARCHAR2(100) 
CONTENT          CLOB          
REGDATE          DATE  
  
-- 조회수 컬럼이 없어서 추가하려고 함. - 테이블 생성 후에 새로운 컬럼 추가(테이블 수정한다는 의미)

--CREATE TABLE (DDL)
--DROP TABLE (DDL)
--ALTER TABLE (DDL)

? alter table ... add 컬럼 또는 제약조건        -- 새로운 컬럼을 테이블에 추가할 때
? alter table ... modify 컬럼                 -- 컬럼을 테이블에서 수정할 때
? alter table ... drop[constraint] 제약조건    -- 제약조건을 테이블에서 삭제할 때
? alter table ... drop column 컬럼            -- 컬럼을 테이블에서 삭제할 때


select *
from tbl_board;  
-- 현재 하나의 레코드도 존재하지 않음

-- 컬럼 추가시 테이블의 행이 존재한다면, 새로 추가되는 컬럼은 이미 존재하는 모든 행의 값은 NULL로 초기화한다.



INSERT into tbl_board(seq, writer, passwd, title, content, regdate)
               values(1, 'admin','1234','test-1','test-1', sysdate);
 
 1 행 이(가) 삽입되었습니다.
 
commit;
 
select *
from tbl_board;
  
  
  
INSERT into tbl_board(seq, writer, passwd, title, content, regdate)
               values(1, 'hong','1234','test-2','test-2');   -- 기본값이 들어가 있어서 sysdate는 지워줌
--SQL 오류: ORA-00947: not enough values 갯수가 맞지 않음 


INSERT into tbl_board(seq, writer, passwd, title, content)
               values(1, 'hong','1234','test-2','test-2');
--ORA-00001: unique constraint (SCOTT.SYS_C007021) violated : 
--              유일성 제약조건에       제약조건명        위배된다



--tbl_board 테이블에 제약조건 모두 확인(조회)
select *
from user_constraints
where table_name LIKE UPPER('%board%'); 
  
-- 글번호 고유키를 2로 수정  
  
INSERT into tbl_board(seq, writer, passwd, title, content)
               values(2, 'hong','1234','test-2','test-2');  
  
commit;

select *
from tbl_board;
  

-- 테이블의 컬럼 순서대로 values() 코딩.
INSERT into tbl_board  --칼럼명이 순서대로 입력되어져 있기 때문에 삭제 가능
               values(3, 'song','1234','test-3','test-3', sysdate);
               

--컬럼 추가시 테이블의 행이 존재한다면, 새로 추가되는 컬럼은 이미 존재하는 모든 행의 값은 NULL로 초기화한다.               
-- 조회수 컬럼이 없어서 추가하려고 함      
-- readed NUMBER  
  
ALTER table tbl_board
--add (여러개의 칼럼을 추가 할 때)
add readed number default 0;
--Table TBL_BOARD이(가) 변경되었습니다.  

select *
from tbl_board;
[결과]
1	admin	1234	test-1	test-1	23/09/04	0
2	hong	1234	test-2	test-2	23/09/04	0
3	song	1234	test-3	test-3	23/09/04	0


--컬럼을 새로 추가할 시 기존의 게시글(행)은 null로 초기화가 되는데,
-- default 값을 설정했다면 그 기본값으로 기존의 게시글(행)도 초기화된다. ==> 0으로 초기화 되어져 있음.


desc tbl_board;


--1) 게시글 작성(insert문) content 는 null 허용이라 안줌, readed 0이라 안줌, regdate는 sysdate
insert into tbl_board(writer, seq, title, passwd)
values('kenik',(select nvl(max(seq),0)+1 from tbl_board) ,'test-4',  '1234');
  
commit; 
  
select *
from tbl_board;  
  
--2) content가 null인 경우 => '냉무'로 게시글을 수정.  
  
update tbl_board
set content = '냉무'
where content = null; -- where 조건절이 없으면 모든 레코드(게시글)을 수정한다는 의미.
-- ORA-00932: inconsistent datatypes: expected - got CLOB
-- ORA-00904: "null": invalid identifier  

  
update tbl_board
set content = '냉무'
where content is null;
--1 행 이(가) 업데이트되었습니다.

commit;

select *
from tbl_board;  


--3) kenik 작성자의 모든 게시글을 삭제

delete from tbl_board
where writer = 'song';

commit;

select *
from tbl_board;

--4) 컬럼의 자료형의 크기 수정
desc tbl_board;
--WRITER  NOT NULL VARCHAR2(20)       ->       VARCHAR2(40)으로 자료형의 크기를 수정하려고 함.

select max(vsize(writer))   --5,4             5까지만 줄일 수 있다.
from tbl_board;

--

alter table tbl_board
modify (writer varchar2(40)not null);
--ORA-01442: column to be modified to NOT NULL is already NOT NULL
 
 
alter table tbl_board
modify (writer varchar2(40)); 
--Table TBL_BOARD이(가) 변경되었습니다.
  
desc tbl_board; 

[결과] -- 40으로 수정됨.
이름      널?       유형            
------- -------- ------------- 
SEQ     NOT NULL NUMBER(38)    
WRITER  NOT NULL VARCHAR2(40)  
PASSWD  NOT NULL VARCHAR2(15)  
TITLE   NOT NULL VARCHAR2(100) 
CONTENT          CLOB          
REGDATE          DATE          
READED           NUMBER  
  
  
--5) title 컬럼명 수정 : subject 컬럼명으로 변경하려고 함

alter table tbl_board
rename column title to subject;
--Table TBL_BOARD이(가) 변경되었습니다.

select *
from tbl_board;

--6)bigo -- 칼럼을 추가(기타 사항을 저장하기 위한)

alter table tbl_board
add bigo varchar2(100);

desc tbl_board;

select *
from tbl_board;
-- bigo에 null값이 들어가져 있다.

-- bigo 칼럼 삭제

alter table tbl_board
drop column bigo;
--Table TBL_BOARD이(가) 변경되었습니다.

desc tbl_board;


-- 테이블 삭제
drop table tbl_board;
--Table TBL_BOARD이(가) 삭제되었습니다.
  
--7) 테이블명을 수정하려면
rename 테이블명1 to 테이블명2;
--------------------------------------------------------------------------------
--2) 테이블을 생성하는 방법 : 서브쿼리(subquery)를 이용한 테이블 생성
-- ㄱ. 기존 테이블에 원하는 데이터가 이미 존재 + 레코드(행) 존재
-- ㄴ. subquery 사용해서 테이블을 생성
-- ㄷ.          (1) 테이블 생성 + (2) 데이터 복사 + (3) 제약조건은 복사되지 않는다.(not null 제약 조건은 복사 된다.)
-- ㄹ.

create table tbl_emp (empno, ename, job, hiredate, mgr, pay, deptno)
as 
(
select empno, ename, job, hiredate, mgr, sal + nvl(comm,0) pay, deptno
from emp
);
--Table TBL_EMP이(가) 생성되었습니다.
desc tbl_emp;
이름       널? 유형           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
HIREDATE    DATE         
MGR         NUMBER(4)    
PAY         NUMBER    ---> 시스템이 자동으로 number 설정   
DEPTNO      NUMBER(2)    

select *
from tbl_emp;
-- 제약조건은 복사되지 않는다.
-- 제약조건 확인
select *
from user_constraints
where table_name = 'TBL_EMP'; -- '대문자'로

--삭제

DROP TABLE tbl_emp;
--Table TBL_EMP이(가) 삭제되었습니다.

--서브쿼리를 이용해서 테이블 생성 + 데이터가 필요 없을 때(데이터 복사X 테이블의 구조만 복사)

CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP
WHERE 1 = 0; --조회된 데이터가 아무것도 없음 --WHERE 절의 조건을 거짓으로 만들면 데이터복사 없이 구조만 복사된다.


DESC TBL_EMP;


SELECT *
FROM TBL_EMP;

--

--[문제] deptno, dname, empno, ename, hiredate, pay, grade 가진 테이블 생성
-- tbl_empgrade 테이블명

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
--insert문
insert into 테이블명 [(컬럴명...)] values (칼럼값..);
dml ===> commit(완료), rollback(취소;)
--
-- Multi + table insert 문
1)unconditional insert all 

Unconditional insert all 문은 조건과 상관없이 기술되어진 여러 개의 테이블에 데이터를 입력한다.

? 서브쿼리로부터 한번에 하나의 행을 반환받아 각각 insert 절을 수행한다.
? into 절과 values 절에 기술한 컬럼의 개수와 데이터 타입은 동일해야 한다.

    (비교)INSERT INTO 테이블명 VALUES();

【형식】
	INSERT ALL | FIRST
	  [INTO 테이블1 VALUES (컬럼1,컬럼2,...)]
	  [INTO 테이블2 VALUES (컬럼1,컬럼2,...)]
	  .......
	Subquery;

여기서 
 ALL : 서브쿼리의 결과 집합을 해당하는 insert 절에 모두 입력
 FIRST : 서브쿼리의 결과 집합을 해당하는 첫 번째 insert 절에 입력
 subquery : 입력 데이터 집합을 정의하기 위한 서브쿼리는 한 번에 하나의 행을 반환하여 각 insert 절 수행

--예)
create table dept_10 as (select * from dept where 1 = 0);
create table dept_20 as (select * from dept where 1 = 0);
create table dept_30 as (select * from dept where 1 = 0);
create table dept_40 as (select * from dept where 1 = 0);
--Table DEPT_40이(가) 생성되었습니다.
--
insert ALL -- 조건에 상관없이 모든 테이블에 다 insert 한다는 의미
    into dept_10 values (deptno, dname, loc)
    into dept_20 values (deptno, dname, loc)
    into dept_30 values (deptno, dname, loc)
    into dept_40 values (deptno, dname, loc)
select deptno, dname, loc from dept; -- 서브쿼리를 읽어와서

16개 행 이(가) 삽입되었습니다.

select *
from dept_40;

rollback;

drop table dept_10;
drop table dept_20;
drop table dept_30;
drop table dept_40;


2)conditional insert all 

emp_10, emp_20, emp_30, emp_40 테이블 생성 후
emp 테이블을 select 조회하는 서브쿼리에서 각 부서별로
4개의 emp_10, emp_20, emp_30, emp_40 각각의 테이블에 insert 작업

create table emp_10 as(select * from emp where 1 = 0);
create table emp_20 as(select * from emp where 1 = 0);
create table emp_30 as(select * from emp where 1 = 0);
create table emp_40 as(select * from emp where 1 = 0);
--Table EMP_40이(가) 생성되었습니다.


select *
from emp;

insert all
    when deptno = 10 then -- 조건이 있는 다중테이블 insert문
     into emp_10 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
    when deptno = 20 then 
     into emp_20 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
    when deptno = 30 then 
     into emp_30 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
    else
     into emp_40 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
 select *
 from emp;

--12개 행 이(가) 삽입되었습니다.
--각부서번호에 있는 데이터를 번호에 맞춰서 insert함
select *
from emp_40;

rollback;
-----------------------------
3)conditional insert first

insert first
    when deptno = 10 then -- 조건이 있는 다중테이블 insert문
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

--insert all 와 insert first의 차이점?
--조건 만족하는 첫번째 frist insert
--조건 만족하는 모두 insert all
insert all 
    when deptno = 10 then
        into emp_10 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
    when job = 'CLERK' then
        into emp_20 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
    else 
        into emp_40 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
select *
from emp;
--13개 행 이(가) 삽입되었습니다.
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
--가로 세로 바뀜

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
--1) delete  emp_10 테이블의 모든 레코드(행) 삭제 + commit, rollback(직접해야함)
delete from emp_10;

select *
from emp_10;
------------
--2) truncate emp_20 테이블의 모든 레코드(행) 삭제 + 자동 커밋
truncate table emp_20;

select *
from emp_20;
------------
--3) drop table 테이블 자체를 삭제한다.
drop table emp_30;
--------------------------------------------------------------------------------
--[문제] insa 테이블에서 num, name 칼럼만을 복사해서
        새로운 tbl_score 테이블 생성
        ( num <= 1005 )
----> 서브쿼리를 사용해서 테이블을 생성

create table tbl_score
as
(
select num, name
from insa
where num <= 1005
)
--Table TBL_SCORE이(가) 생성되었습니다.

select *
from tbl_score;

--------------------------------------------------------------------------------
--[문제] tbl_score 테이블에 kor, eng, mat, tot, avg, grade, rank 컬럼 추가
(조건 국,영,수,총점은 기본값 0)
grade 등급 char (1 char)

-- 테이블 수정 (DDL)
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

--Table TBL_SCORE이(가) 변경되었습니다.
select *
from tbl_score;

--[문제] 1001~1005 5명 학생의 kor, eng, mat 점수를 임의의 점수로
        수정하는 쿼리 작성.

update tbl_score
set kor = trunc(dbms_random.value(0,101)), -- 절삭하지 않으면 100.5xx가 되었을때 반올림되어서 101값이 들어갈 수 있다.
    eng = trunc(dbms_random.value(0,101)),
    mat = trunc(dbms_random.value(0,101))
;
--where num between 1001 and 1005; 5명 외에는 없으니 where 조건 생략

commit;

select *
from tbl_score;
  
--[문제] 1005번 학생의 국어, 영어, 수학 값을 1001번 학생의 점수로 수정.

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

-- 위에 세단계 할 필요없이 한줄로 가능하다! --- 기억하기
update tbl_score 
set (kor,eng,mat) = (select kor,eng,mat from tbl_score where num = 1005)
where num = 1001;

 select *
from tbl_score; 

--[문제] 모든 학생의 총점, 평균을 수정(조건:평균은 소수점 2자리)

update tbl_score
set tot = kor + eng + mat
  , avg = (kor + eng + mat)/3;

--무조건 평균은 소수점 두자리까지 출력하려고 할 때
 select t.*, to_char(t.avg, '999.00')
from tbl_score t; 

  
 --[문제] 등급(grade) char(1 char) 'A','B','C','D','F'
 --90점 이상 A
 --80점 이상 B
 --70점 이상 C
 --0~59점 F
 
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
--[문제] tbl_score 테이블의 등수 처리(update)
select empno, ename, sal
    ,row_number() over(order by sal desc) rn
    ,rank() over(order by sal desc) r
    ,dense_rank() over(order by sal desc) dr
from emp;

-- 상관 서브쿼리를 update 문에 사용
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

-- [문제] 모든 학생들의 영어 점수를 20점 증가

update tbl_score
set eng = eng + 20; -- 80점 이상의 점수는 100이 넘어가 버리는 결과가 나온다.

update tbl_score
set eng = case
            when eng >= 80 then 100
            else eng + 20
           end;
           
commit;
 
 select *
from tbl_score;
 

--[문제] 국, 영, 수, 점수가 또 다시 수정이 되면
--      수정된 그 학생들의 총점, 평균, 전체학생들의 등수도 달라진다.
-- PL/SQL 5가지 한 종류 : 패키지(package) , 트리거 (Trigger)
update tbl_score
set  eng = eng + 10
where num = 1001;

commit;

-- [문제] 여학생들만 국어 점수를 5점씩 증가 시키는 쿼리 작성.
-- tbl_score 테이블에서 성별 컬럼. x
-- insa 테이블에 성별 ssn 주민등록번호
-- (insa 테이블 조인)
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
 
        -- 상관서브쿼리
        
        commit;
        
--
select num
    --, name
    --,mod(substr(ssn,-7,1),2)
from insa
where num <= 1005 and mod(substr(ssn,-7,1),2) = 1; 
--------------------------------------------------------------------------------
(병합 merge)

create table tbl_emp(
    id number not null primary key, -- primary key 제약 조건을 주면 자동으로 nn + un 제약 조건도 만들어진다.
    name varchar2(10) not null,
    salary  number,
    bonus number default 100
);
-- Table TBL_EMP이(가) 생성되었습니다.

DESC tbl_emp;
[결과]
이름     널?       유형           
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
-- Table TBL_BONUS이(가) 생성되었습니다.

insert into tbl_bonus(id)
  (select e.id from tbl_emp e);

commit;

select *
from tbl_bonus;

insert into tbl_bonus values (1004, 50);
commit;

tbl_emp 테이블에는 1004 ID 가진 사원이 존재x

1001
1002
1003

tbl_bonus
1001
1002
1003
1004

-- 병합(merge)작업 tbl_emp와 tbl_bonus 두 테이블 병합
merge into tbl_bonus b --tbl_bonus b에 (select id, salary from tbl_emp) 값이 병합되었다.
--using 테이블명, 뷰명, 서브쿼리
using (select id, salary from tbl_emp) e --emp 테이블은 구조가 다르기 때문에 구조를 똑같이 맞춰준다.
on (b.id = e.id) 
WHEN MATCHED THEN 
    UPDATE SET b.bonus = b.bonus + e.salary * 0.01 
WHEN NOT MATCHED THEN 
    INSERT (b.id, b.bonus) VALUES (e.id, e.salary*0.01)
--WHERE condition
;
-- 3개 행 이(가) 병합되었습니다.

select *
from tbl_emp;

select *
from tbl_bonus;




