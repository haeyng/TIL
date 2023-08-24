--SCOTT --

SELECT *
FROM tabs;

-- SQL 수행 과정 이해 --
--Optimizer 검색
-- DQL 문 : SELECT

-- 모든 사용자 계정 조회 SQL 작성.
SELECT *
FROM all_users;
--HR 계정(샘플 계정)
--상태: 실패 -테스트 실패: ORA-28000: the account is locked

-- HR 계정의 상태 확인
-- ORA-00942: table or view does not exist
SELECT *
FROM dba_users;

--DQL : SELECT 문
--1) 데이터를 가져오는데 사용하는 SQL문 중에 하나이다.
--2) 가져오고자 하는 대상은 하나 이상의 테이블이거나 또는 뷰이다.
--3) 사용자가 소유한 테이블, 뷰만 SELECT 할 수 있다.
--    또는 객체에 대해서 권한이 있으면 SELECT 할 수 있다.

select *
FROM emp; --scott.sql 를 스크립트 파일이라고 함


【형식】
    [subquery_factoring_clause] subquery [for_update_clause];

【subquery 형식】
   {query_block ?
    subquery {UNION [ALL] ? INTERSECT ? MINUS }... ? (subquery)} 
   [order_by_clause] 

【query_block 형식】
   SELECT [hint] [DISTINCT ? UNIQUE ? ALL] select_list
   FROM {table_reference ? join_clause ? (join_clause)},...
     [where_clause] 
     [hierarchical_query_clause] 
     [group_by_clause]
     [HAVING condition]
     [model_clause]

【subquery factoring_clause형식】
   WITH {query AS (subquery),...}

--SELECT문 앞에 있는 순서는 작성하는 순서. 뒤에 번호는 처리되는 순서. (시험)
[WITH 절] --1번처리
SELECT 절 --반드시 있어야함 --6번처리
FROM 절 --반드시 있어야함 --2번처리
[WHERE 절] --3번처리
-- 계층절 hierarchical_query_clause
[GROUP BY 절] --4번처리
[HAVING 절] --5번처리
[ODER BY 절] --7번처리

-- SCOTT 사용자가 소유한 테이블 정보 조회하려고 함 (처리 순서대로 적기)

SELECT * -- 조회할 목록을 주는 것이 SELECT이다. *는 컬럼 목록을 가져온다는 뜻
FROM user_tables; -- 소유자의 테이블 정보를 얻어올 수 있는 뷰(view)이고 데이터 사전에 등록되어 있다.

--오류난거 추가한 SQL
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-7-87', 'dd-MM-yy')-51,1100,NULL,20);  

INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-87', 'dd-MM-yy')-85,3000,NULL,20);

COMMIT;

-- emp (사원) 테이블의 사원 정보를 조회
SELECT *
FROM emp; --scott.emp 가 원칙이지만 scott에서 작업하고 있어서 생략가능

-- emp (사원) 테이블의 사원 정보(사원번호, 사원명, 입사일자)를 조회
SELECT empno, ename, hiredate
FROM emp;

-- emp 테이블의 구조 확인해보기
DESCRIBE emp;
DESC emp; -- DESCRIBE를 줄여서 DESC

-- dept 테이블의 구조 확인 
DESC dept;
-- dept 테이블의 모든 컬럼을 조회
SELECT *
--SELECT deptno, dname, LOC
FROM dept;

-- emp 테이블의 job만 조회하려고 함
SELECT job -- 각 사원들의 job 정보를 조회한 것.
FROM emp;

-- 사원들의 job의 종류만 조회하려고 함
SELECT ALL job -- job 앞에 아무것도 없으면 all인데 생략가능.

SELECT DISTINCT job -- 중복을 제거.
FROM emp;

-- emp 테이블의 job의 갯수 파악하려고 함 : 5가지 job
--COUNT() 집계함수를 사용
SELECT COUNT(DISTINCT job) --5
       ,COUNT(job) -- 중복제거를 꼭 해야함.
FROM emp;

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
CLERK
CLERK
ANALYST

SELECT DISTINCT job, ename -- DISTINCT 는 다른 칼럼과 같이 쓰면 중복이 되지 않음
-- ename의 영향으로
FROM emp;

-- emp 테이블에서 각사원의 사원명, 입사일자만 조회하려고 함
SELECT ename, hiredate
FROM emp;
-- SMITH	입사일자  80(RR)/12(MM)/17(DD)   년/월/일   NLS
--                          YY/MM/DD와 RRMMDD는 다르다

--[문제] emp 사원 테이블에서 사원의 부서번호, 사원명, 급여(sal+comm) 조회
-- null 처리 : 커미션 미확인 된 값(null)은 0으로 처리하려고 함
-- 오라클에는 null 처리를 해주는 함수가 4개 있다.
-- NVL, VNL2, NULLIF, COALESCE
SELECT deptno, ename,sal,comm
--            , NVL(comm,0)
--            , sal + comm AS "별칭(alias)"
--            , sal + NVL(comm,0) AS "pay" --AS키워드 생략가능
--            , sal + NVL(comm,0) "pay" -- "" 생략가능
--            , sal + NVL(comm,0) MY pay --ORA-00923: FROM keyword not found where expected alias 사이에 공백은 X 공백을 주려면 "" 안에 묶어서 넣어주면 됨 
--            , sal + NVL(comm,0) "MY pay"
--            ,sal + NVL(comm,0) pay
            ,sal + NVL(comm,0) my_pay
            ,(sal + NVL(comm,0)) * 12 --연봉 출력
FROM emp;

-- Oracle null의 의미? 미확인 된 값
-- 이준희 / null (성별) / null (키) 
-- 없는 값이 아니고 현재 시점에서 확인하지 못한 값을 null이라고 한다.

-- 어떤값  연산  null => null

--emp 테이블에서 모든 사원정보를 조회
--SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
SELECT *
FROM emp;

--emp 테이블에서 deptno 30번 부서원들만 조회(deptno, ename, job, hiredate, pay)
--오라클의 비교연산자 같다 =  다르다 != ^=  작거나 크다 >  <   >=   <=
--                  숫자, 날짜, 문자 비교

SELECT deptno, ename, job, hiredate
--      , NVL(sal+comm, sal) pay
      , sal + NVL(comm, sal) pay --위랑 같은 코딩이지만 더 나은 코딩
FROM emp
WHERE deptno = 30; -- java       == 같다 연산자   오라클 ==연산자

WHERE 참,거짓;
WHERE 조건절;

10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON

--부서 정보 조회
SELECT *
FROM dept;

--[문제] emp 테이블에서 20, 30번 부서원의 정보를 조회.
-- 자바 논리연산자에는 &&  ||  !
-- 오라클 논리연산자는 AND OR NOT
--SELECT deptno,* -- *이 deptno도 포함해서 구문오류남 아래처럼 써야됨
SELECT deptno, emp.* -- 부서번호를 앞에 두려고 deptno
FROM emp
WHERE deptno = 10 AND job = 'CLERK';
--WHERE deptno = 10 AND job = 'clerk';  -- 결과물이 없는 이유? job 검색어 대소문자를 구분한다. 
-- WHERE deptno = 20 || deptno = 30; --java에서는  or연산자 && ||
WHERE deptno = 20 OR deptno = 30; --오라클에서는 OR


SELECT deptno, emp.*
FROM emp
WHERE deptno >= 20 AND deptno <=30; --20~30번까지 찾는 코딩 between하고 똑같은 의미
WHERE deptno BETWEEN 20 AND 30; --0.014초 COST 3 -- or하고는 의미가 다르다


SELECT deptno, emp.*
FROM emp
WHERE doptno IN(20,30); --sql 연산자사용. or 연산자와 의미가 같다
--WHERE deptno = 20 OR deptno = 30; --0.016초 COST 3


-- scott 계정 + insa.sql 스크립트파일 열어서 테이블 생성, INSERT 문


SELECT *
FROM tabs;
--
SELECT *
FROM insa;

문제1) 서울 사람의 이름(name), 출신도(city), 부서명(buseo), 직위(jikwi) 출력 
 + 이름순으로 오름차순 정렬
 
SELECT name, city, buseo, jikwi
FROM insa
WHERE city = '서울' -- 오라클 '문자열' '날짜' 에만 ''  문자,문자열 구분안함
ORDER BY name ; -- 오름차순 ASC 정렬 내림차순 DESC --디폴트값은 오름차순 ASC
ORDER BY name DESC ;

 + 부서별로 1차 오름차순 정렬, 2차 이름으로 내림차순 정렬
SELECT buseo, name, city, jikwi
FROM insa
WHERE city = '서울' 
--ORDER BY buseo ASC, name DESC; 
ORDER BY 1 , 2 DESC; 
 

문제2) 출신도가 서울 사람이면서 기본급이 150만원 이상인 사람 출력 (name, city, basicpay, ssn) 

SELECT name, city, basicpay, ssn
FROM insa
WHERE city = '서울' AND basicpay >= 1500000
ORDER BY basicpay ASC;

문제3) 출신도가 서울 사람이거나 부서가 개발부인 자료 출력 (name, city, buseo) 

SELECT name, city, buseo
FROM insa
WHERE city = '서울' OR buseo = '개발부';

문제4) 출신도가 서울, 경기인 사람만 출력 (name, city, buseo) 

SELECT name, city, buseo
FROM insa
WHERE city IN ('서울' ,'경기'); --밑 코딩과 같은 코딩
WHERE city = '서울' OR city = '경기';

문제5) 급여(basicpay + sudang)가 250만원 이상인 사람. 단 필드명은 한글로 출력. (name, basicpay, sudang, basicpay+sudang)
+ 급여 많이 받는 순으로 내림차순 정렬

--ORA-00904: "PAY": invalid identifier 오류 발생 (select 처리 순서 때문에 발생)
SELECT name, basicpay, sudang, basicpay+sudang pay
FROM insa
WHERE basicpay+sudang >= 2500000 --pay 식별자 인식안됨
-- WHERE pay >= 2500000; --pay 식별자 인식안됨
-- 실행 순서가 where이 먼저가 되서 pay가 별칭 지정이 안되서 인식을 못한다
ORDER BY basicpay+sudang DESC; --pay 사용 가능 select문보다 늦게 실행되서
ORDER BY pay DESC; --가능
--------------------------------------------------------------------------------
--직속상사(mgr)가 없는 사람의 정보를 조회
-- mgr 이 null 인 사원을 조회하는것과 같음
SELECT *
FROM emp
WHERE mgr is not NULL;
-- WHERE mgr = 'NULL'; -- = 연산자를 쓰면 문자열 NULL을 찾는것과 같음 
WHERE mgr is NULL; --NULL 대문자로
--------------------------------------------------------------------------------
-- mgr을 BOSS로 나오게 하고 싶음
SELECT empno, ename, job, mgr, hiredate
FROM emp
WHERE mgr is NULL;



WHERE mgr is not NULL;
-- WHERE mgr = 'NULL'; -- = 연산자를 쓰면 문자열 NULL을 찾는것과 같음 
WHERE mgr is NULL; --NULL 대문자로


--------------------------------------------------------------------------------
CREATE TABLE insa(
        num NUMBER(5) NOT NULL CONSTRAINT insa_pk PRIMARY KEY --사원번호
       ,name VARCHAR2(20) NOT NULL --사원명
       ,ssn  VARCHAR2(14) NOT NULL --주민등록번호
       ,ibsaDate DATE     NOT NULL --입사일자
       ,city  VARCHAR2(10) --출생지역
       ,tel   VARCHAR2(15) -- 연락처
       ,buseo VARCHAR2(15) NOT NULL --부서
       ,jikwi VARCHAR2(15) NOT NULL --직위
       ,basicPay NUMBER(10) NOT NULL --기본급
       ,sudang NUMBER(10) NOT NULL --수당
);
--------------------------------------------------------------------------------
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1001, '홍길동', '771212-1022432', '1998-10-11', '서울', '011-2356-4528', '기획부', 
   '부장', 2610000, 200000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1002, '이순신', '801007-1544236', '2000-11-29', '경기', '010-4758-6532', '총무부', 
   '사원', 1320000, 200000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1003, '이순애', '770922-2312547', '1999-02-25', '인천', '010-4231-1236', '개발부', 
   '부장', 2550000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1004, '김정훈', '790304-1788896', '2000-10-01', '전북', '019-5236-4221', '영업부', 
   '대리', 1954200, 170000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1005, '한석봉', '811112-1566789', '2004-08-13', '서울', '018-5211-3542', '총무부', 
   '사원', 1420000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1006, '이기자', '780505-2978541', '2002-02-11', '인천', '010-3214-5357', '개발부', 
   '과장', 2265000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1007, '장인철', '780506-1625148', '1998-03-16', '제주', '011-2345-2525', '개발부', 
   '대리', 1250000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1008, '김영년', '821011-2362514', '2002-04-30', '서울', '016-2222-4444', '홍보부',    
'사원', 950000 , 145000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1009, '나윤균', '810810-1552147', '2003-10-10', '경기', '019-1111-2222', '인사부', 
   '사원', 840000 , 220400);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1010, '김종서', '751010-1122233', '1997-08-08', '부산', '011-3214-5555', '영업부', 
   '부장', 2540000, 130000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1011, '유관순', '801010-2987897', '2000-07-07', '서울', '010-8888-4422', '영업부', 
   '사원', 1020000, 140000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1012, '정한국', '760909-1333333', '1999-10-16', '강원', '018-2222-4242', '홍보부', 
   '사원', 880000 , 114000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1013, '조미숙', '790102-2777777', '1998-06-07', '경기', '019-6666-4444', '홍보부', 
   '대리', 1601000, 103000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1014, '황진이', '810707-2574812', '2002-02-15', '인천', '010-3214-5467', '개발부', 
   '사원', 1100000, 130000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1015, '이현숙', '800606-2954687', '1999-07-26', '경기', '016-2548-3365', '총무부', 
   '사원', 1050000, 104000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1016, '이상헌', '781010-1666678', '2001-11-29', '경기', '010-4526-1234', '개발부', 
   '과장', 2350000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1017, '엄용수', '820507-1452365', '2000-08-28', '인천', '010-3254-2542', '개발부', 
   '사원', 950000 , 210000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1018, '이성길', '801028-1849534', '2004-08-08', '전북', '018-1333-3333', '개발부', 
   '사원', 880000 , 123000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1019, '박문수', '780710-1985632', '1999-12-10', '서울', '017-4747-4848', '인사부', 
   '과장', 2300000, 165000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1020, '유영희', '800304-2741258', '2003-10-10', '전남', '011-9595-8585', '자재부', 
   '사원', 880000 , 140000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1021, '홍길남', '801010-1111111', '2001-09-07', '경기', '011-9999-7575', '개발부', 
   '사원', 875000 , 120000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1022, '이영숙', '800501-2312456', '2003-02-25', '전남', '017-5214-5282', '기획부', 
   '대리', 1960000, 180000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1023, '김인수', '731211-1214576', '1995-02-23', '서울', NULL           , '영업부', 
   '부장', 2500000, 170000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1024, '김말자', '830225-2633334', '1999-08-28', '서울', '011-5248-7789', '기획부', 
   '대리', 1900000, 170000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1025, '우재옥', '801103-1654442', '2000-10-01', '서울', '010-4563-2587', '영업부', 
   '사원', 1100000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1026, '김숙남', '810907-2015457', '2002-08-28', '경기', '010-2112-5225', '영업부', 
   '사원', 1050000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1027, '김영길', '801216-1898752', '2000-10-18', '서울', '019-8523-1478', '총무부', 
   '과장', 2340000, 170000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1028, '이남신', '810101-1010101', '2001-09-07', '제주', '016-1818-4848', '인사부', 
   '사원', 892000 , 110000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1029, '김말숙', '800301-2020202', '2000-09-08', '서울', '016-3535-3636', '총무부', 
   '사원', 920000 , 124000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1030, '정정해', '790210-2101010', '1999-10-17', '부산', '019-6564-6752', '총무부', 
   '과장', 2304000, 124000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1031, '지재환', '771115-1687988', '2001-01-21', '서울', '019-5552-7511', '기획부', 
   '부장', 2450000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1032, '심심해', '810206-2222222', '2000-05-05', '전북', '016-8888-7474', '자재부', 
   '사원', 880000 , 108000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1033, '김미나', '780505-2999999', '1998-06-07', '서울', '011-2444-4444', '영업부', 
   '사원', 1020000, 104000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1034, '이정석', '820505-1325468', '2005-09-26', '경기', '011-3697-7412', '기획부', 
   '사원', 1100000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1035, '정영희', '831010-2153252', '2002-05-16', '인천', NULL           , '개발부', 
   '사원', 1050000, 140000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1036, '이재영', '701126-2852147', '2003-08-10', '서울', '011-9999-9999', '자재부', 
   '사원', 960400 , 190000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1037, '최석규', '770129-1456987', '1998-10-15', '인천', '011-7777-7777', '홍보부', 
   '과장', 2350000, 187000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1038, '손인수', '791009-2321456', '1999-11-15', '부산', '010-6542-7412', '영업부', 
   '대리', 2000000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1039, '고순정', '800504-2000032', '2003-12-28', '경기', '010-2587-7895', '영업부', 
   '대리', 2010000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1040, '박세열', '790509-1635214', '2000-09-10', '경북', '016-4444-7777', '인사부', 
   '대리', 2100000, 130000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1041, '문길수', '721217-1951357', '2001-12-10', '충남', '016-4444-5555', '자재부', 
   '과장', 2300000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1042, '채정희', '810709-2000054', '2003-10-17', '경기', '011-5125-5511', '개발부', 
   '사원', 1020000, 200000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1043, '양미옥', '830504-2471523', '2003-09-24', '서울', '016-8548-6547', '영업부', 
   '사원', 1100000, 210000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1044, '지수환', '820305-1475286', '2004-01-21', '서울', '011-5555-7548', '영업부', 
   '사원', 1060000, 220000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1045, '홍원신', '690906-1985214', '2003-03-16', '전북', '011-7777-7777', '영업부', 
   '사원', 960000 , 152000);			
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1046, '허경운', '760105-1458752', '1999-05-04', '경남', '017-3333-3333', '총무부', 
   '부장', 2650000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1047, '산마루', '780505-1234567', '2001-07-15', '서울', '018-0505-0505', '영업부', 
   '대리', 2100000, 112000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1048, '이기상', '790604-1415141', '2001-06-07', '전남', NULL           , '개발부', 
   '대리', 2050000, 106000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1049, '이미성', '830908-2456548', '2000-04-07', '인천', '010-6654-8854', '개발부', 
   '사원', 1300000, 130000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1050, '이미인', '810403-2828287', '2003-06-07', '경기', '011-8585-5252', '홍보부', 
   '대리', 1950000, 103000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1051, '권영미', '790303-2155554', '2000-06-04', '서울', '011-5555-7548', '영업부', 
   '과장', 2260000, 104000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1052, '권옥경', '820406-2000456', '2000-10-10', '경기', '010-3644-5577', '기획부', 
   '사원', 1020000, 105000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1053, '김싱식', '800715-1313131', '1999-12-12', '전북', '011-7585-7474', '자재부', 
   '사원', 960000 , 108000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1054, '정상호', '810705-1212141', '1999-10-16', '강원', '016-1919-4242', '홍보부', 
   '사원', 980000 , 114000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1055, '정한나', '820506-2425153', '2004-06-07', '서울', '016-2424-4242', '영업부', 
   '사원', 1000000, 104000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1056, '전용재', '800605-1456987', '2004-08-13', '인천', '010-7549-8654', '영업부', 
   '대리', 1950000, 200000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1057, '이미경', '780406-2003214', '1998-02-11', '경기', '016-6542-7546', '자재부', 
   '부장', 2520000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1058, '김신제', '800709-1321456', '2003-08-08', '인천', '010-2415-5444', '기획부', 
   '대리', 1950000, 180000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1059, '임수봉', '810809-2121244', '2001-10-10', '서울', '011-4151-4154', '개발부', 
   '사원', 890000 , 102000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1060, '김신애', '810809-2111111', '2001-10-10', '서울', '011-4151-4444', '개발부', 
   '사원', 900000 , 102000);

COMMIT;
--------------------------------------------------------------------------------




