--SCOTT--
--복습 문제
--1. 서브쿼리(SUBQUERY)에 대해서 설명하세요.
	1) Query란 하나이상의 테이블이나 뷰로부터 데이터를 검색(retrieve)하는 동작을 말한다.
   	   이 때 참조하는 최상위 레벨 SELECT 문을 Query(질의:쿼리)라 한다.
	2) 쿼리가 또다른 SQL 문으로 nested된 것을 subquery라 한다.
       즉, SQL 문 속에 또 다른 SQL문이 넣어져 있는 경우이다.
	3) main(parent) query
       sub(child) query
	3) main     관계O      sub query : 상관 서브 쿼리(correlated subquery)
                관계X
                
--1-2. 인라인뷰(inline view)에 대해서 설명하세요.
	1)서브 쿼리 종류 3가지 : 인라인 뷰, 중첩(NESTED) 서브쿼리, 일반서브쿼리
	2)FROM절에 위치한 서브쿼리
	3)마치 가상테이블처럼 사용되는 서브쿼리이다. ALIAS(별칭) 부여해야 한다.

--1-3. WITH 절에 대해서 설명하세요.
	SELECT 절 7가지 중 하나
	WITH 별칭 AS (서브쿼리),... 여러개 가능

--1-4. emp 테이블에서
   pay(sal+comm)  1000 초과~ 3000 미만 받는  
   30부서원을 제외한 모든 사원들만 
   ename을 기준으로 오름차순 정렬해서 조회하는 쿼리를 작성하세요.  
    (1) 일반 쿼리 사용;
SELECT deptno, ename, sal, comm, sal+NVL(comm, 0 ) PAY
FROM emp
WHERE sal + NVL(comm, 0 ) > 1000 AND sal + NVL(comm, 0 ) < 3000
AND deptno != 30
ORDER BY ename;

    (2) inline view 사용;
-- FROM(서브쿼리)
SELECT E.* -- 가상테이블이 하나뿐이기 때문에 e 별칭 생략 가능
FROM(
    SELECT deptno, ename, sal, comm, sal+NVL(comm, 0 ) PAY
    FROM emp
    --WHERE deptno != 30
    )e
WHERE e.PAy > 1000 AND e.pay < 3000
ORDER BY ename;

    (3) with 절 사용  
WITH E AS(
    SELECT deptno, ename, sal, comm, sal+NVL(comm, 0 ) PAY
    FROM emp
    --WHERE deptno != 30
)
SELECT *
FROM E
WHERE e.PAy > 1000 AND e.pay < 3000
ORDER BY ename;

3. 지금까지 배운 [Oracle 함수]를 적고 설명하세요 .
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename)
FROM emp;
1) UPPER()
2) LOWER()
3) INITCAP()

SELECT name, ssn
,SUBSTR(ssn, 0, 2)
,SUBSTR(ssn, 1, 2)
,SUBSTR(snn, -1, 1)
,SUBSTR(snn, -7)
FROM insa;
4) SUBSTR() 리턴타입 CHAR
4-2) EXTRACT() 리턴타입 NUMBER

SELECT NVL(comm, 0)
FROM emp;
5) NVL()

SELECT SYSDATE, CURRENT_DATE
FROM dual;
6) SYSDATE, CURRENT_DATE

SELECT -- 5%3
      MOD(5,3)
FROM dual;
7) MOD()

SELECT 형 변환 함수
FROM ;
8) TO_CHAR(NUMBER)
   TO_CHAR(DATE)
   TO_CHAR(CHAR문자)
   TO_DATE()
   TO_NUMBER()

9) COUNT()
emp 테이블에서 job(업무)의 종류와 갯수 출력 쿼리 작성.

--ORA-00937: not a single-group group function
SELECT DISTINCT job -- 여러개의 레코드를 뿌려주는 컬럼인데
      ,COUNT(DISTINCT job) 
      -- count는 여러개의 레코드가 들어가서 한개로 나옴 1개의 칼럼만 select 되는 집계함수이다.
FROM emp;
-------------------------------------------
-ORA-00936: missing expression
SELECT DISTINCT job 
      ,SELECT COUNT(DISTINCT job) from emp     
FROM emp;
------------------------------------------
--반드시 서브쿼리는 괄호 안에 넣어준다
SELECT DISTINCT job 
      ,(SELECT COUNT(DISTINCT job) from emp ) jobcount   
FROM emp;
------------------------------------------ 암기하기

10) CONCAT()
    ||
 ------------------------------------------   
    
3-2. 지금까지 배운 오라클의 연산자(operator)를 적으세요.  
IS NOT
AND
ALL
ANY
--
문자열 연결 연산자 ||
산술 연산자 + - * / MOD()
논리연산자 AND OR NOT
SQL 연산자 ALL, ANY, SOME, EXISTS, IN, BETWEEN, LIKE, IS, NULL, IS NOT NULL
비교 연산자 = != ^= <>         > < >= <=
    
    
    
    
 ------------------------------------------ 4번문제 풀이
SELECT ssn
    , SUBSTR(SSN, 1,2) YEAR
    -- SSN -> 생년월일 추출 (날짜) 형변환 -> EXTRACT
    -- , EXTRACT(MONTH FROM 날짜) MONTH
    , SUBSTR(SSN, 0,6)
    , TO_DATE(SUBSTR(SSN, 0,6))
    , EXTRACT(MONTH FROM TO_DATE(SUBSTR(SSN, 0,6))) MONTH -- 한자리는 09가 아니라 9이다 숫자이기 때문에
    , SUBSTR(SSN,-7,1) --성별
FROM insa;
 ------------------------------------------   
SELECT ename, hiredate
    , TO_CHAR(hiredate) -- 문자열 '80/12/17'
    --, SUBSTR(hiredate, 0, 2) 아래처럼 변환해서 사용하기
    , SUBSTR(TO_CHAR(hiredate), 0, 2)
FROM emp;
 ------------------------------------------   
 --4-3)문제풀이
 -- + 70년대 12월생 사원 출력 LIKE '7_12%'
 --   12월생 LIKE '__12'
 --   70년생 LIKE '7%'
SELECT name
, SUBSTR(SSN,1,8)||'******' RRN
-- , SUBSTR(SSN,3,2) = '12' --월 12하고 같은지? 비교
FROM insa
-- WHERE SUBSTR(SSN,1,2) BETWEEN '70' AND '79' AND MOD(SUBSTR(SSN, -7,1),2) = 1; --남자사원
-- LIKE 연산자 사용해보기
WHERE SSN LIKE '7%' AND MOD(SUBSTR(SSN, -7,1),2) = 1;
-------------------------------------------   
-- 6번 풀이
SELECT ENAME
, NVL(TO_CHAR(MGR),'BOSS') MGR --MGR은 숫자타입!
, NVL(COMM,0) COMM
FROM emp;

-- NVL2 사용해보기
-- NVL2(p1, p2, p3) -- 매개변수가 3개
-- P1이 NULL이 아니면 P2
-- P1이 NULL이면     P3이 된다
SELECT ENAME
, NVL(TO_CHAR(MGR),'BOSS') MGR
, NVL2(COMM,COMM,0) COMM
FROM emp;
------------------------------------------- 
--6-2)문제풀이
SELECT name, tel
FROM insa
WHERE tel IS NULL; --3명이 NULL인것 확인
-- 자료형 파악하기
DESC insa;
-- TEL               VARCHAR2(15)  TEL은 문자열이다.
SELECT name 
       --,NVL(TEL,'연락처 등록 안됨') TEL
       ,NVL2(TEL,TEL,'연락처 등록 안됨')TEL
FROM insa
WHERE tel IS NULL;
------------------------------------------- 
--NULLIF() 잘 사용되지는 않음
-- 반환값 : NULL, 하나의 값
-- 어떤 경우에 다른지 파악
--  두 개의 값을 비교하여 NULL 또는 두 개 값중 하나를 출력한다.
-- 첫번째 값과 두번째 값을 비교하여 두 값이 같으면 NULL을 출력하고, 같지 않으면 첫번째 값을 출력한다.
【형식】
        NULLIF(expr1, expr2)
이는 CASE 문으로 쓰면 다음과 같다.
    CASE WHEN expr1 = expr2 THEN NULL ELSE expr1 END
;

SELECT ename
       , NULLIF( ename, 'SMITH')
FROM emp;
-------------------------------------------
--COALESCE 합동(연합,유착)하다.
SELECT sal, comm
      ,SAL + NVL(COMM, 0) pay
      ,SAL + NVL2(COMM, COMM, 0) PAY --NVL2 사용
      -- , COALESCE (P1,P2,P3,P4,P5..) -- 처음으로 NULL이 아닌것이 나오면 출력
      , COALESCE (SAL + COMM, SAL, 0 ) PAY -- SAL+COMM가 NULL이면 SAL이고 SAL도 NULL이면 0
FROM emp;
-------------------------------------------
-- 6-3) 문제 풀이
SELECT NUM, NAME
      -- , NVL (TEL, 'X')
      -- , NVL2 (TEL, 'O', 'X')
FROM insa;
-------------------------------------------
--6-4)
SELECT name, ssn
    ,SUBSTR(ssn, -7, 1) gender
    ,MOD(TO_NUMBER(SUBSTR (ssn, -7,1)),2) gender
    ,MOD(SUBSTR(ssn, -7,1),2) gender
    ,NULLIF(MOD(SUBSTR(ssn,-7,1),2), 1 ) gender
    ,NVL2(NULLIF (MOD (SUBSTR(SSN,-7,1),2),1), '여자', '남자') gender
FROM insa;
-------------------------------------------
SELECT SYSDATE
    , TO_CHAR(SYSDATE, 'CC') --21세기
    , TO_CHAR(SYSDATE, 'SCC') --21세기
FROM dual;
-------------------------------------------
-- '05/01/10' -- 날짜X 문자열O
SELECT '05/01/10' -- 날짜X 문자열O
FROM dual;
-------------------------------------------ora_help 에 to_char 검색해서 참고
SELECT '05/01/10'
    ,TO_DATE('05/01/10', 'RR/MM/DD')--날짜로 변환
    ,TO_CHAR(TO_DATE('05/01/10', 'RR/MM/DD'), 'YYYY')RR --2005
    ,TO_CHAR(TO_DATE('05/01/10', 'YY/MM/DD'),'YYYY') YY --2005
    
    ,TO_CHAR(TO_DATE('97/01/10', 'RR/MM/DD'), 'YYYY')RR --1997
    ,TO_CHAR(TO_DATE('97/01/10', 'YY/MM/DD'),'YYYY') YY --2097 
FROM dual;
-- 'RR/MM/DD' RR에 50~00까지는 세기가 1900이 붙음
SELECT ename, hiredate
    , TO_CHAR (hiredate, 'YYYY') year -- 도구>설정에 'RR/MM/DD' 형태로 저장되어 있음 
FROM EMP;
--------------------------------------------------------------------
7. RR과 YY의 차이점
RR과 YY는 둘다 년도의 마지막 두자리를 출력해 주지만, 
현재 system상의 세기와 나타내고자 하는 년도의 세기를 비교할 했을 때 출력되는 값이 다르다.
RR은 시스템상(1900년대)의 년도를 기준으로 하여 이전 50년도에서 이후 49년까지는 기준년도와 가까운 1850년도에서 1949년도까지의 값으로 표현하고, 
이 범위를 벗아날 경우 다시 2100년을 기준으로 이전 50년도에서 이후 49년까지의 값을 출력한다.
--------------------------------------------------------------------

8. dept 테이블 조회
SELECT *
FROM DEPT;

8-2. dept 테이블에   deptno = 50,  dname = QC,  loc = SEOUL  로 새로운 부서정보 추가

INSERT INTO dept(deptno,dname,loc) 
VALUES (50, 'QC', 'SEOUL');
--VALUES ('50', 'QC', 'SEOUL');
--00984. 00000 -  "column not allowed here" SEOUL에 컬럼을 허용하지 않는 에러 발생
--값으로 인식하는것이 아니라 컬럼으로 인식해서 발생함

--1 행 이(가) 삽입되었습니다.

DESC dept;

--50에 ''를 붙였으나 자동으로 숫자타입으로 변환됨
-- to_number('50')

COMMIT;

8-3. dept 테이블에 QC 부서를 찾아서 부서명(dname)과 지역(loc)을 
   dname = 현재부서명에 2를 추가,  loc = POHANG 으로 수정
SELECT deptno
FROM dept
WHERE dname = 'QC'; -- 50번

-- 50, 'QC', 'SEOUL'
UPDATE dept
SET dname = CONCAT(dname, '2') -- 2는 문자로 --현재 부서명에 2 추가
, loc = 'POHANG'
WHERE deptno = 50;

COMMIT;

SELECT *
FROM DEPT;

SELECT deptno
FROM dept
WHERE DNAME = 'QC2';

DELETE FROM dept--deptno로 삭제
WHERE deptno = (SELECT deptno FROM dept WHERE DNAME = 'QC2'); --중첩 서브쿼리

WHERE deptno = 50;

commit;

SELECT *
FROM DEPT;
-----------------------------------------
-- REPLACE() 사용하기
SELECT name, ssn
     --,gender
FROM insa;
-- 이름 속에 m 문자를 포함하면 *으로 변경
SELECT ename
FROM emp
-- WHERE ename LIKE '%m%'; --m이 소문자 m이라 아무것도 안뜸 -- 대소문자 구분안하고 찾으려면?
-- WHERE ename LIKE '%m%' OR ename LIKE '%M%'; -- 첫번째 방법
-- WHERE LOWER (ename) LIKE '%m%';
-- WHERE UPPER (ename) LIKE '%M%';
-- WHERE ename LIKE UPPER('%m%'); 정답 X 이름속에 소문자 있으면 검색 안됨
-- WHERE ename LIKE CONCAT(CONCAT('%', UPPER('m')),'%');
-- WHERE ename LIKE '%' || 'm' || '%'; --암기!!!!
WHERE ename LIKE '%' || UPPER('m') || '%'; --암기!!!! 위 코딩과 같은 코딩
--
SELECT ename
    ,REPLACE(ename, UPPER('m'), '*')
FROM emp
WHERE ename LIKE '%' || UPPER('m') || '%';
------------------------------------------------
--[문제] emp 테이블에서 ename 'la' 대소문자 구분없이 있는 사원 조회
--                          'la' 'La' 'lA' 'LA'
SELECT ename
FROM emp
WHERE ename LIKE '%la%' OR ename LIKE '%La%'
   OR ename LIKE '%lA%' OR ename LIKE '%LA%';
--
SELECT ename
FROM emp
WHERE REGEXP_LIKE(ename, 'la', 'i'); -- i 옵션이 대소문자 구분없음을 나타냄
WHERE REGEXP_LIKE(ename, 'LA'); --정규표현식 사용
WHERE ename LIKE '%la%' OR ename LIKE '%La%'
   OR ename LIKE '%lA%' OR ename LIKE '%LA%';
--
SELECT ename
    , REPLACE (ename, 'LA', '<span style="color:red">LA</span>')
FROM emp
WHERE REGEXP_LIKE(ename, 'la', 'i');
--                              match option : i(대소문자 구분X), C(대소문자 구분O), m(멀티 라인), x(공백문자 무시)
--
-- LIKE 연산자 % _ 와일드카드
-- 정규표현식을 사용할 수 있는 함수
-- 복수행 함수(그룹함수)
SELECT COUNT(*) --사원수 12명 -- 여러개의 레코드가 들어가서 단일행을 돌려준다--복수함수
FROM emp;
-- 단일행 함수(single row function)
SELECT LOWER(ename) -- 단일행함수
FROM emp;
----------------
-- ORA_HELP에 regexp_like 함수에 있는 테이블 추가하고 정규표현식 확인해봄
SELECT *
FROM TEST
WHERE REGEXP_LIKE(name, '^[한백]');
WHERE REGEXP_LIKE(name, '강산$');
----------------------------------
--insa 테이블에서 남자 사원만
WHERE SSN LIKE '7%' AND MOD(SUBSTR(ssn, -7, 1),2) = 1;

WHERE REGEXP_LIKE (SSN, '^7.{6}[13579]');
--                         . 아무문자나 6개 건너뛰고, 그 다음에 13579인지?
WHERE REGEXP_LIKE (SSN, '^7\d{5}-[13579]');
-----------------------------------
--[문제] insa 테이블에서 성이 김씨, 이씨만 조회
1) LIKE 사용

SELECT *
FROM insa
WHERE name LIKE '김%' OR name LIKE '이%';

2) REGEXP_LIKE()사용

SELECT *
FROM insa
WHERE REGEXP_LIKE(name, '^(김|이)');
WHERE REGEXP_LIKE(name, '^[김이]');

--[문제] insa 테이블에서 성이 김씨, 이씨를 제외한 조회
1) LIKE 사용

SELECT *
FROM insa
WHERE NOT (name LIKE '김%' OR name LIKE '이%');

2) REGEXP_LIKE()사용

SELECT *
FROM insa
WHERE NOT REGEXP_LIKE(name, '^[^김이]');
WHERE NOT REGEXP_LIKE(name, '^[김이]');
---------------------------------------
-- 9. 시노님(synonym)이란? 
하나의 객체에 대해 다른 이름을 정의하는 방법
SQL 문에서 사용하는 테이블이나 컬럼의 별명과 유사한 개념
별명은 해당 SQL문 내에서만 사용할 수 있지만, 시노님은 데이터베이스 전체에서 사용할 수 있는 객체이다.

---------------------------------------
--10. emp 테이블에서 급여를 가장 많이 받는 사원의 정보를 조회.
SELECT deptno, empno, ename, sal + NVL(COMM, 0) PAY
FROM emp
ORDER BY PAY DESC;
-- COUNT(),                                MAX(),MIN()
--10	7839	KING	5000




--10-2. emp 테이블에서 급여를 가장 적게 받는 사원의 정보를 조회.
--20	7369	SMITH	800

-- SQL 연산자 ALL을 사용해 풀기 
WITH temp AS(
SELECT deptno, empno, ename, sal + NVL(COMM, 0) PAY
FROM emp
)
SELECT *
FROM temp
--WHERE pay >= ALL(모든 사원들 PAY); -- 모든 사원들보다 PAY가 같거나 크면 제일 큰 것
WHERE pay >= ALL(SELECT pay FROM temp);

---------------------------------------------------
WITH temp AS(
SELECT deptno, empno, ename, sal + NVL(COMM, 0) PAY
FROM emp
)
SELECT *
FROM temp
WHERE pay <= ALL(SELECT pay FROM temp); --모든 사원들보다 같거나 작으면 제일 작은것
---------------------------------------------------
--MAX(), MIN() 그룹(집계) 함수
-- SELECT 가장 pay가 많은 사람
SELECT MAX(sal + NVL(comm, 0)) MAX_PAY
        ,MIN (sal + NVL(comm, 0)) MIN_PAY
FROM emp;
--
SELECT deptno, ename, sal + NVL(comm, 0) PAY
FROM emp
WHERE sal + NVL(comm, 0) = (
SELECT MAX(sal + NVL(comm, 0))
FROM emp
);
WHERE sal + NVL(comm, 0) = 5000;
--
-------------------------------
11. 5. 현재 시스템의 날짜 출력하는 쿼리를 작성하세요. 
SELECT ( ㄱ ), ( ㄴ ) 
FROM dual;

SELECT SYSDATE CURRENTDATE
FROM DUAL;



---------------------------------------------
-- [집합연산자(Set Operator)]
-- 1) 두 테이블의 칼럼 수가 같고
-- 2) 대응되는 칼럼끼리 데이터 타입이 동일해야 한다.
-- 3) 컬럼 이름은 달라도 상관 없으며
-- 4) 집합 연산의 결과로 출력되는 컬럼의 이름은 첫번재 select 절의 컬럼 이름을 따른다.

-- 5) 합집합 : UNION, UNION ALL
    --교집합 : INTERSECT
    --차집합 : MINUS

-- emp  +  insa 두 테이블을 합쳐서 모든 사원 정보를 조회.
SELECT empno, ename, hiredate --, deptno -- number
FROM emp
UNION
SELECT num, name, ibsadate --, buseo -- varchar2
FROM insa;

------- emp ( 조인(join) dept ) +  insa
SELECT empno, ename, hiredate -- , deptno -- number
FROM emp
UNION
SELECT num, name, ibsadate -- , buseo -- varchar2
FROM insa;

SELECT deptno, dname, loc
FROM dept;

--------------------------------------------------
SELECT empno, ename, hiredate --, deptno -- number
FROM emp
UNION ALL
SELECT num, name, ibsadate --, buseo -- varchar2
FROM insa;
--------------------------------------------------
-- [UNION 과 UNION ALL의 차이점 + INTERSECT,MINUS]

(1) insa 테이블의 개발부 조회
SELECT name, city, buseo
FROM insa
WHERE buseo = '개발부';

(2) insa 테이블의 출신지역 : 인천 조회
SELECT name, city, buseo
FROM insa
WHERE city = '인천'; -- 9명 사원 조회 (개발부 사원은 6명)

--UNION의 결과 : 14명 (중복된 데이터 한번만 추가하고 제외됨)
SELECT name, city, buseo
FROM insa
WHERE city = '인천' -- 9명
UNION
SELECT name, city, buseo
FROM insa
WHERE buseo = '개발부'; --14명

--UNION ALL의 결과 : 23명 (중복된 데이터도 추가됨)
SELECT name, city, buseo
FROM insa
WHERE city = '인천' -- 9명
UNION ALL
SELECT name, city, buseo
FROM insa
WHERE buseo = '개발부'; --14명

--INTERSECT의 결과 : 6명 (인천이고 개발부인 6명) 교집합
SELECT name, city, buseo
FROM insa
WHERE city = '인천' -- 9명
INTERSECT
SELECT name, city, buseo
FROM insa
WHERE buseo = '개발부'; --14명

--MINUS 결과 : 3명 (인천 9명 - 개발부 6명)
SELECT name, city, buseo
FROM insa
WHERE city = '인천' -- 9명
-- ORDER BY NAME 제일 마지막에 위치해야 한다.
MINUS
SELECT name, city, buseo
FROM insa
WHERE buseo = '개발부'; --14명
ORDER BY name ASC;
----------------------------------------

--[문제] insa 테이블에서 남자O, 여자X

SELECT name, ssn
--,NULLIF( MOD(SUBSTR(SSN, -7,1),2), 1)
      ,NVL2(NULLIF( MOD(SUBSTR(SSN, -7,1),2), 1),'X','O') GENDER
FROM insa;

-- 집합연산자(SET OPERATOR)
UNION -- ALL
1) 남자 조회
SELECT name, ssn, 'O' gender
FROM insa
WHERE MOD(SUBSTR(SSN, -7,1),2) = 1;

2) 여자 조회

SELECT name, ssn, 'X' gender
FROM insa
WHERE MOD(SUBSTR(SSN, -7,1),2) = 0;
---------------------------------
SELECT name, ssn, 'O' gender
FROM insa
WHERE MOD(SUBSTR(SSN, -7,1),2) = 1
UNION
SELECT name, ssn, 'X' gender
FROM insa
WHERE MOD(SUBSTR(SSN, -7,1),2) = 0;
------------------------------------

IS [NOT] NAN == Not A Number 
IS [NOT] INFINITE == 무한대

------------------------------------
1.오라클에서 함수의 정의
2.오라클에서 함수의 기능
3.오라클에서 함수의 종류
------------------------------------
(1)숫자함수
    - ROUND(number, 반올림위치 양수, 음수) 반올림함수
    - CEIL() 올림함수(절상함수)
    - FLOOR() 내림함수(절삭함수)
        ㄴTRUNC() 내림함수(절삭함수)
        
    SELECT ROUND(15.193) a --15 소수점 첫번째 자리에서 반올림.
        --,ROUND(15.193, 0) --15 반올림 위치 안준것과 같은 위치 0
        , ROUND(15.193,1) --15.2 소수점 두번째 자리에서 반올림.
        --, ROUND(15.193,n) -- 소수점 n+1 번째 자리에서 반올림한다.
        , ROUND(19.193,-1) -- 20 일의 자리에서 반올림
        , ROUND(15.193,-2) -- 십의 자리에서 반올림.
    FROM dual;
    
    -- 지정된 숫자보다 같거나 큰 정수 중에 최솟값
    SELECT CEIL(15.193) --16
        ,CEIL(15.913) --16
    FROM dual;
    
    -- 지정된 숫자보다 작거나 같은 정수 중에 최댓값
    SELECT FLOOR(15.193) --15
        ,FLOOR(15.913) --15
    FROM dual;
    
    - 반올림 ROUND(), 올림(절상) CEIL(), 내림(절삭) FLOOR()
    - 내림(절삭) 함수 : FLOOR(), TRUNC(절삭 위치를 주면 됨) 차이점.
    
    -- 15.193 숫자를 소수점 2자리에서 절삭 -- 내가 원하는 위치로 절삭하려면 가공해야함
    SELECT FLOOR(15.8193) --15
        ,FLOOR(15.8193*10)/10 --15.8
        
        ,TRUNC(15.8193) --FLOOR(15.8193) 동일
        ,TRUNC(15.8193,1) --FLOOR(15.81*10)/10 동일
        ,TRUNC(15.8193,2) --15.81
        ,TRUNC(15.8193,-1) -- 10 -- 일의 자리에서 절삭
        
    FROM dual;
    
    -- 소수점 세번째 자리에서 반올림해서 소수점 두자리까지 출력하라.
    SELECT 10/3
    FROM dual;
    --
    SELECT 10/3
        ,ROUND(10/3,2)
    FROM dual;
    ---------------------------------------------------------
    -- 나머지 MOD(), REMAINDER()
    SELECT MOD(19,4),REMAINDER(19,4)
    FROM dual;
    
    -- MOD(n2, n1)        = n2-n1*FLOOR(n2/n1)
    -- REMAINDER(n2, n1)  = n2-n1*ROUND(n2/n1)
    
    --ABS() 절대값 
    SELECT ABS(100), ABS(-100)
        ,SIGN(100), SIGN(-100)-- 1(매개변수가 양수일때 1 반환)  -1(음수일때 -1 반환)
        ,SIGN(0) --0
        ,POWER(2,3)
        ,SQRT(2)
    FROM dual;
    
    
(2)문자함수
    --UPPER()
    --LOWER()
    --INICQP() 첫번째 문자만 대문자로 바꾸는 함수
    --CONCAT()
    --SUBSTR()
    
    --LENGTH() 문자열 길이
    SELECT DISTINCT job
          , LENGTH(job)
    FROM emp;
    
    -- emp 테이블에서 ename 에 L 문자가 있는 사원만 조회   
    SELECT ename, job
    FROM emp
    WHERE REGEXP_LIKE( ename , 'l', 'i');
    WHERE ename LIKE '%L%';
    -- L 문자가 있는 위치값을 조회
    SELECT ename
          , INSTR (ename, 'L')
    FROM emp
    WHERE REGEXP_LIKE( ename , 'l', 'i');
    
    -----------------
    SELECT 
           INSTR('corporate floor','or') --2
          ,INSTR('corporate floor','or',1,3) --14
          ,INSTR('corporate floor','or',-1,3) --2
          ,INSTR('corporate floor','or',4)
          ,INSTR('corporate floor','or',4,2) -- 4번째 문자부터 2번째 있는 OR을 찾기
    FROM dual;
    
    -- RPAD / LPAD
    -- Right Left
    -- PAD == 패드, 덧 대는 것, 메워 넣는 것
    -- 형식) RPAD (expr1, n[  , expr2])
      
    SELECT ename, sal + NVL(comm, 0) pay
        -- ,LPAD(sal + NVL(comm, 0), 10, '*')
        -- ,RPAD(sal + NVL(comm, 0), 10, '*')
    FROM emp;
    -----------------------------------------
    --100 단위로 #을 출력하고 싶음 200 ## 300 ###
    --10의 단위에서 반올림 #
        SELECT ename, sal + NVL(comm, 0) pay
        , ROUND (sal + NVL(comm, 0),-2)
        , ROUND (sal + NVL(comm, 0),-2)/100
        , RPAD(' ', ROUND(sal + NVL(comm, 0),-2)/100 + 1, '#') --(sal + NVL(comm, 0) 대신 ' ' 공백 --문법임
        -- +1이 아니고 8,19,18로 ..??
    FROM emp;
    -------------------------------------------------------
    
    -- LTRIM(), RTRIM(), TRIM() 문자값 중에서 왼쪽/오른쪽 으로 부터 특정문자와 일치하는 문자값을 제거한다.
    -- java. String.trim() 앞/뒤 공백 제거하는 함수
    -- 예) "    abc    ".trim()    ===>     "abc"
    
    SELECT '['||'   admin   '||']'             --[   admin   ]
        ,'['|| LTRIM('   admin   ') ||']'      --[admin   ]
        ,'['|| RTRIM('   admin   ', ' ') ||']' --[   admin]
        ,'['|| TRIM('   admin   ') ||']'       --[admin]
        
        ,'['|| LTRIM('xyxyadminxyxy','xy') ||']' --[adminxyxy]
        ,'['|| RTRIM('xyxyadminxyxy','xy') ||']' --[xyxyadmin]
    FROM dual;
    -----------------------------------------------------------
    
    SELECT ASCII('A'), ASCII('a'), ASCII('0')
        , CHR(65), CHR(97), CHR(48)
    FROM dual;
    
    -----------------------------------------------------------
    SELECT GREATEST (3,5,2,4,1)
            ,LEAST (3,5,2,4,1)
            ,GREATEST('MBC','TVC','SBS')
    FROM dual;
    -----------------------------------------------------------
    REPLACE() SMITH 에서 M을 *로 바꾸는것 위에서 했음
    -----------------------------------------------------------
    VSIZE() 지정된 문자열의 크기를 숫자로 반환하는 함수
    -- 알파벳은 1바이트 한글은 3바이트 
    SELECT VSIZE('a'), VSIZE('한')--1  3
    FROM dual;
    -----------------------------------------------------------
    