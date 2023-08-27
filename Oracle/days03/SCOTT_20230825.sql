SELECT BUSEO,NAME,BASICPAY + SUDANG PAY        
FROM insa
WHERE BASICPAY + SUDANG BETWEEN 2000000 AND 2500000
--WHERE BASICPAY + SUDANG <= 2500000 AND BASICPAY + SUDANG >= 2000000 
ORDER BY BUSEO, NAME ASC, PAY DESC; 

--1) WITH절 사용, 처리 순서 기억하기
with e AS --() 괄호의 결과물을 e가 가진다. --with절은 여러개 가능
(
    SELECT BUSEO,NAME,BASICPAY + SUDANG PAY        
    FROM insa
)
--, d AS 
--(
--    SELECT deptno, dname
--    FROM dept
--)

--SELECT e.*, e.buseo, e.name, e.pay
SELECT buseo, name, pay
FROM e
WHERE pay BETWEEN 2000000 AND 2500000;





--인라인 뷰(INLINE VIEW)--
--인라인 뷰는 FROM 절에서 서브쿼리를 사용하여 생성한 임시 뷰이다.

-- 뷰 : 일종의 가상 테이블이다.
-- 테이블 : 데이터를 저장하는 단위이다. 행과 열로 이루어져있다.
SELECT e.*
FROM ( --인라인뷰
SELECT BUSEO, NAME, BASICPAY + SUDANG PAY        
    FROM insa
    )e
WHERE (e.pay BETWEEN 2000000 AND 2500000) AND buseo != '총무부';


-- 81/11/17 NLS RR/MM/DD    YY/MM/DD   
-- 자바 : hiredate String(문자열) "81/12/20".substirng (0,2).equals("80")
-- 오라클 : 문자열 자료형              문자 추출 함수 = '81'  ==> 안됨
--              hiredate가 날짜형   


-- 자바 : hiredate 날짜형 -> 년도 추출
--       Date d = new Date(); --->년도  d.getYear()+1900;
-- 오라클 : hiredate 날짜형 -> EXTRACT()를 사용해 년도 추출 -> 81년도인지 비교
--                          TO_CHAR()


DESC emp;
-- HIREDATE          DATE  오라클의 날짜형     TIMESTAMP


-- 날짜형 --2087 까지 출력됨 이상함
SELECT empno, ename, hiredate
    ,EXTRACT(year FROM hiredate) h_year
FROM emp;
-- 두 사원을 삭제하려고 함
--7876	ADAMS	87/05/23	2087
--7788	SCOTT	87/04/19	2087
DML : INSERT, UPDATE, DELETE  + DML은 반드시 TCL구문 COMMIT, ROLLBACK을 실행해야한다 

DELETE FROM 테이블명
[WHERE 조건절];

DELETE FROM emp; -- WHERE 조건절이 없으면 모든 레코드(행)가 삭제됨
--14개 행 이(가) 삭제되었습니다. 
ROLLBACK;
COMMIT; --커밋하고 나면 롤백 못함.

-- 삭제할때는 고유한 키값으로 삭제한다
DELETE FROM emp
WHERE empno IN(7876,7788);
--2개 행 이(가) 삭제되었습니다.

----------------------------------------
SELECT empno, ename, hiredate
    ,EXTRACT(year FROM hiredate) h_year

FROM emp
WHERE TO_CHAR(hiredate, 'YYYY') = 1981   --'1981' 과 1981 오류가 나지 않고 출력결과가 같지만 좋은 코딩은 아님
--WHERE TO_CHAR(hiredate, 'YYYY') = '1981'
--WHERE TO_CHAR(hiredate, 'YY') = '81' -- TO_DHAR는 문자로!
--WHERE EXTRACT (YEAR FROM hiredate) = 1981 --12번문제 두번째 풀이 방법
ORDER BY hiredate ASC;
----------------------------------------



-- 문자열
SELECT empno, ename, hiredate
FROM emp
WHERE hiredate BETWEEN '81/1/1' AND '81/12/31';
WHERE hiredate >= '81/1/1'  AND hiredate <= '81/12/31'; --12번문제 첫번째 풀이 방법



-- dual이란
DESC dual;
--DUMMY칼럼을 가지고 있다  VARCHAR2(1) , 레코드는 X값 하나 가지고 있음

-- FROM절 뒤에는 테이블, 뷰(가상테이블)만 가능
FROM dual;

-- 오늘 날짜를 조회하려고 함 
SELECT SYSDATE; -- SYSDATE()는 오늘 날짜를 반환해주는 함수지만 매개변수가 없어서 ()괄호 생략
--ORA-00923: FROM keyword not found where expected 오류
-- 오라클에는 SELECT와 FROM절은 반드시 꼭 필요하다

SELECT SYSDATE
FROM emp; --레코드 갯수만큼 날짜가 출력됨
--하나의 레코드만 가지고 있는 dual을 사용해 결과물 출력 테스트 가능하다.

SELECT SYSDATE
    ,EXTRACT( YEAR FROM SYSDATE) year
    ,EXTRACT( month FROM SYSDATE) month
    ,EXTRACT( day FROM SYSDATE) day
    
    ,TO_CHAR(SYSDATE, 'YYYY')
    ,TO_CHAR(SYSDATE, 'YY') 
FROM dual; -- 시간은 가지고 있지만 출력만 되지 않은 것


-- SUBSTR 함수 설명
-- 첫번째 위치는 0이나 1부터 시작
SELECT SUBSTR('abcdesfg', 3,2) --3번째 위치부터 2글자 잘라옴 -- 문자 'cd' 출력
        ,SUBSTR('abcdesfg', 3) --'cdesfg' 출력
        ,SUBSTR('abcdesfg', -3,2) --'sf'
FROM dual;


-----------------------------------------12번문제 세번째 풀이 방법
SELECT empno, ename, hiredate
    ,EXTRACT(year FROM hiredate) h_year   
FROM emp
WHERE SUBSTR(hiredate, 1,2) = '81'  -- SUBSTR(문자열, 시작위치, 길이) DATE 타입을 넣어도 오류가 나지 않음 왜?
ORDER BY hiredate ASC;
----------------------------------------

SELECT empno, ename, hiredate
    , EXTRACT(YEAR FROM hiredate) h_year
    , TO_CHAR(hiredate, 'YY')
FROM emp
WHERE TO_CHAR(hiredate, 'YY') = '81'
ORDER BY hiredate;
----------------------------------------




-- [문제] insa 테이블에서 이름, 주민등록번호 조회 // 이름,주민등록번호,년도,월,일,성별,검증 조회
-- 출력형식 문길수 721217-1*****
-- SUBSTR 함수 사용하기

SELECT NAME, SSN
        , CONCAT(SUBSTR(SSN, 1,8),'*****')
--    , SUBSTR(SSN, 1,2) --년도
--    , SUBSTR(SSN, 3,2) --월
--    , SUBSTR(SSN, 5,2) --일
--    , SUBSTR(SSN,8,1) --성별   
FROM insa;

------------------------------------------

SELECT NAME, SSN
        ,SUBSTR(SSN, 0,8)||'*****' AS rrn --첫번째 위치는 0도 가능!
        ,SUBSTR(SSN, 1,2) year
        ,SUBSTR(SSN, 3,2) month
        ,SUBSTR(SSN, 5,2) AS "DATE"
--        ,SUBSTR(SSN, 5,2) date --ORA-00923: FROM keyword not found where expected 에러발생 
                          --from절이 위치해야되는데 다른게 있다고 뜨는 오류
        ,SUBSTR(SSN,8,1) gender
        ,SUBSTR(SSN, -1)
FROM insa;

--771212-[1]022432 출생년도 1900, 1800, 2000 + 77  ==> 1977



--복습문제 14. emp 테이블에서 직속상사(mgr)가 없는  사원의 정보를 조회하는 쿼리 작성.
SELECT *
FROM emp
WHERE mgr is NULL;

--복습문제 14-2. emp 테이블에서 직속상사(mgr)가 있는  사원의 정보를 조회하는 쿼리 작성.
SELECT *
FROM emp
WHERE mgr IS NOT NULL;

--14-3. emp 테이블에서 직속상사(mgr)가 없는  사원의 mgr을 'CEO'로 출력하는 쿼리 작성.

--mgr null 처리를 하려고 앞서 배운 nvl 함수를 사용해봄
SELECT empno, ename, job
             ,NVL(mgr, 'CEO') mgr 
             ,hiredate, sal, comm, deptno 
FROM emp;
-- ORA-01722: invalid number 
-- *Cause:    The specified number was invalid. 잘못된 숫자가 있다는 에러 발생함 이유는?
--,nvl(mgr, 'CEO') mgr --mgr의 데이터타입? mgr의 데이터 타입을 확인해보자 
DESC emp; 
[출력결과]
-- MGR        NUMBER(4) mgr은 숫자타입이다
-- NUMBER타입을 => String mgr 변환해야 -> NVL()을 이용해 'CEO' 처리가 가능하다
-- 사원번호 7369 -> 문자형태 '7369' 변환하듯이  null -> nvl() 처리하면 'ceo' 가능할 것 같다.
-------------------------------------
SELECT EMPNO, ENAME, JOB
-- ,nvl(mgr,0) mgr --mgr의 0 처리가 가능함
,NVL(TO_CHAR (mgr), 'CEO') mgr --mgr을 문자로 변환 후 NVL 함수를 이용해 'CEO'로 변환했다.
,hiredate, sal, comm,deptno
FROM emp;
-------------------------------------
SELECT empno, ename, job
,DECODE(mgr, NULL, 'CEO', mgr) AS mgr
, hiredate, sal, comm, deptno
FROM emp
WHERE mgr IS NULL;
-- 이 쿼리에서 DECODE 함수는 mgr 컬럼의 값이 NULL일 경우 'CEO'로 출력하고, 
--그렇지 않으면 원래의 mgr 값을 출력한다.
------------------------------------





SELECT
'AbCd'
,UPPER('AbCd')
,LOWER('AbCd')
FROM dual;

--TO_CHAR (날짜)
--[TO_CHAR (숫자)]
SELECT name
    , basicpay+sudang pay --2,810,000 콤마를 찍고 싶음. TO_CHAR(숫자, ['fmat', 'NLS인자'])숫자를 문자열로 만들어야 됨
    , TO_CHAR(basicpay+sudang) pay -- '2810000' 출력이 오른쪽 정렬 되어있으면 숫자, 왼쪽 정렬 되어있으면 문자
    --, TO_CHAR(basicpay+sudang, '99,999,999') pay
    --, TO_CHAR(basicpay+sudang, '9,999') pay--##### 자리가 부족하면 엑셀처럼 #으로 출력 자릿수는 금액보다 크게 설정
    , TO_CHAR(basicpay+sudang, 'L99,999,999') pay 
    , ibsadate
FROM insa;

--TO_CHAR (문자)
-- 오라클 자료형 -나중에 수업
-- 오라클 연산자
--1)산술연산자 + - * /   나머지를 구하는 연산자는 없고 함수가 있다: MOD()
SELECT 1+2 --3
    , 1-2 -- -1
    , 1*2 --2
    , 1/2 d --0.5   Java 0
    -- , 2/0 정수 --ORA-01476: divisor is equal to zero 나누기는 0으로 나누면 오류발생
    -- ,3.14/0 실수 --ORA-01476: divisor is equal to zero
    -- , 1%2 --나머지 연산자는 %가 아닌것 같음 --ORA-00911: invalid character
    ,MOD(1,2) --1 
FROM dual;


-- FROM절에 있는 dual이란? PUBLIC SYNONYM       스키마(SYS).객체명을 줄여서 == dual로 사용
-- SCOTT 사용자가 소유하고 있는 테이블 정보 조회
--[문제] dba_xxx, all_xxx, user_xxx 차이점 ?
SELECT *
--FROM emp;
--FROM scott.emp;
FROM user_tables; -- 현재 접속한 사용자(USER)의 소유한 테이블 정보만 조회.
FROM dba_tables; -- ORA-00942: table or view does not exist --DBA가 사용할 수 있는 모든 테이블 정보를 조회.
FROM all_tables; -- 현재 사용자가 소유하고 있는 테이블 + 권한이 부여된 테이블 정보를 조회





-- 시노님 생성 3) scott 접속
-- 시노님 생성 4) 시노님에 권한을 부여한다


GRANT SELECT ON emp TO HR; --SELECT ON 권한 부여한다는 뜻
--Grant을(를) 성공했습니다.

SELECT *
FROM arirang;


-- 오라클 함수
--2) || 연결 문자열
DROP TABLE 테이블명 CASCADE; --CASCADE 계단식      DDL 구문 자동으로 생성 실행, PL/SQL 동적 쿼리
-- 쿼리 자체를 만들어서 실행하는 것 : 동적쿼리
SELECT 'DROP TABLE' || table_name || 'CASCADE;'
FROM user_tables;

--DROP TABLEDEPTCASCADE;
--DROP TABLEEMPCASCADE;
--DROP TABLEBONUSCASCADE;
--DROP TABLESALGRADECASCADE;
--DROP TABLEINSACASCADE;



3) 사용자 정의 연산자
--create operator 문으로 연산자를 생성할 수 있음.

4) 계층적 질의 연산자
--PRIOR, CONNECT_BY_ROOT가 계층적 질의 연산자

5) 비교 연산자 = != <> ^= > < >= <=
   -- 아래 3개는 비교 연산자인 동시에 SQL 연산자이다.
   ANY, SOME
   ALL

-- 10 20 30 40 부서번호 조회
SELECT deptno
FROM dept;


SELECT *
FROM emp
WHERE deptno > ANY(SELECT deptno FROM dept); --10번 부서 제외된 결과 출력
WHERE deptno <= ANY(SELECT deptno FROM dept);-- 서브쿼리의 결과 하나만 만족해도 참-> 조회 --SOME 과 ANY는 같음
WHERE deptno <= ALL(SELECT deptno FROM dept);--10번 --서브쿼리 조건을 모두 만족해야

WHERE deptno 비교연산자 ALL(서브쿼리);
WHERE deptno <=20; -- 10번 20번 부서


-- 6) 논리 연산자 : AND OR NOT
-- 7) SQL 연산자
    (1) ( NOT ) IN (목록)
    (2) ( NOT ) BETWEEN a AND b
    (3) IS ( NOT ) NULL
    (4) ANY, SOME, ALL, WHERE 절 서브쿼리
    (5) EXISTS 상관 서브쿼리에 사용됨.
    (6) 문자 패턴 검사할 때
          1.  ( NOT ) LIKE 
            - 문자 패턴 검색할 때 사용되는 SQL 연산자이다.
            - 그 패턴에 사용되는 기호를 와일드 카드 : %   _
            - 와일드 카드를 일반 문자처럼 사용하고 싶을 때 ESCAPE 옵션을 사용한다.
          2.  REGEXP_LIKE 함수
              REGEXT_XXX 정규표현식을 사용하는 함수이다.
        예) emp 사원테이블에 R 문자로 시작하는 사원을 검색
            insa 테이블에 사원명이 '이'씨인 사원만 검색하고 싶음 ; -- 세미콜론 설명 위로 실행 안되서 오류 안남
            SELECT *
            FROM insa
            WHERE name LIKE '이%'; -- % 여러개의 문자가 올 수 있다. 하나도 안와도 상관없음 java에서 *와 같음
            WHERE name LIKE '패턴 와일드카드 %  _ '; -- LIKE 연산자 사용
            WHERE SUBSTR(name, 1, 1) = '이';
    
       예) insa 테이블에 사원명에 '이'가 들어가는 사원만 검색하고 싶음
            SELECT *
            FROM insa
            WHERE name LIKE '%이%';     
    
       예) insa 테이블에 사원명에 마지막에 '이'로 끝나는 사원만 검색하고 싶음
            SELECT *
            FROM insa
            WHERE name LIKE '%이';
        
       예) insa 테이블에서 81년생 사원 정보 조회
            SELECT *
            FROM insa
            WHERE ssn LIKE '81%';
        
        
       [문제] insa 테이블에서 남자사원만 조회
            SELECT name, ssn
            ,SUBSTR(ssn, 8)
            FROM insa
            WHERE ssn LIKE '______-1%';
            WHERE SUBSTR(ssn, 8) LIKE '1%';
            WHERE SUBSTR(ssn, 8, 1) = '1';
            WHERE ssn LIKE '%-1%';

            -- 주민번호는 1/3/5/7/9 남자

       [문제] insa 테이블에서 이름에 두번째 글자가 '순'
            SELECT name, ssn
            ,SUBSTR(ssn, 8)
            FROM insa
            WHERE name LIKE '_순%';
            WHERE SUBSTR(name, 2,1) = '순';
    
            FROM 상품테이블
            WHERE 상품명 LIKE '%씽크패드%' AND 상품크기 =17 AND 램용량 = 32;

            -- 부서테이블
            -- deptno(부서번호) dname(부서명) loc(지역명)
            --10	ACCOUNTING	NEW YORK
            --20	RESEARCH	DALLAS
            --30	SALES	CHICAGO
            --40	OPERATIONS	BOSTON
            SELECT *
            FROM dept;

            -- 새로운 부서를 추가
            -- DML : DELETE, UPDATE, INSERT + 커밋, 롤백
            
            INSERT INTO 테이블명(컬럼명, 컬럼명...) VALUES (값,값,값...);
            COMMIT;

            INSERT INTO dept(deptno, dname, loc) VALUES ( 50, '한글_나라' , 'SEOUL');
            
            INSERT INTO dept(deptno, dname, loc) VALUES ( 50, '한글100%나라' , 'SEOUL'); --한글100%나라 가 16바이트
            --SQL 오류: ORA-12899: value too large for column "SCOTT"."DEPT"."DNAME" (actual: 16, maximum: 14)
            
            INSERT INTO dept(deptno, dname, loc) VALUES ( 50, '한100%나' , 'SEOUL');
            --ORA-00001: unique constraint (SCOTT.PK_DEPT) violated --유일성 제약조건 위반
            --부서번호는 고유키로 만들어뒀는데 50번 같은 번호로 주었기 때문에 오류남.
            
            INSERT INTO dept(deptno, dname, loc) VALUES ( 60, '한100%나' , 'SEOUL');
            
            COMMIT;

            DESC dept;
            
            [결과]
            10	ACCOUNTING	NEW YORK
            20	RESEARCH	DALLAS
            30	SALES	CHICAGO
            40	OPERATIONS	BOSTON
            50	한글_나라	SEOUL
            60	한100%나	SEOUL
            -------------------------
            
            
            --검색 : 부서명(dname)에 위치 상관없이 '_나' 검색
            
            SELECT *
            FROM dept
            WHERE dname LIKE '%\_나%' ESCAPE '\'; -- \_는 일반문자 _로 인식되게
            WHERE dname LIKE '%_나%'; -- _가 와일드카드로 인식됨
            [결과]
            50	한글_나라	SEOUL
            60	한100%나	SEOUL
            -----------------
            
            
            [문제] 부서명에 %가 들어가있는 부서 검색
            
            SELECT *
            FROM dept
            WHERE dname LIKE '%\%%' ESCAPE '\';
            -----------------------------------
            
            
            DML - UPDATE + 커밋, 롤백
            UPDATE 테이블명
            SET 컬럼명 = 컬럼값...
            [WHERE 조건절;] --없으면 모든 레코드 수정함
            
            UPDATE dept
            SET loc = 'KOREA'; --6개 행 이(가) 업데이트되었습니다.       
            
            ROLLBACK;
            ---------
            
            UPDATE dept
            SET loc = 'KOREA'
            WHERE loc = 'SEOUL';--2개 행 이(가) 업데이트되었습니다.
            
            [결과]
            10	ACCOUNTING	NEW YORK
            20	RESEARCH	DALLAS
            30	SALES	CHICAGO
            40	OPERATIONS	BOSTON
            50	한글_나라	KOREA
            60	한100%나	KOREA
            -------------
            
            
            DELETE FROM dept
            WHERE deptno >=50;
            COMMIT;
            [결과]
            10	ACCOUNTING	NEW YORK
            20	RESEARCH	DALLAS
            30	SALES	CHICAGO
            40	OPERATIONS	BOSTON

