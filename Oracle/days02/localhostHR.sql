--ALTER USER hr IDENTIFIED BY lion ACCOUNT UNLOCK;
--SYS에서 잠금해제 하고 접속함
--HR 계정이 소유하고 있는 샘플 테이블 조회
SELECT *
FROM user_tables;

--REGIONS
--COUNTRIES
--LOCATIONS
--DEPARTMENTS
--JOBS
--EMPLOYEES
--JOB_HISTORY

--ORA-00942: table or view does not exist
-- : selcet 할 대상이 보이지 않는다.
--emp 테이블 (객체)를 소유한 소유자도 아니고 SELECT 할 수 있는 권한도 없기 때문에 에러 발생
select *
FROM emp;

-- HR 계정이 소유하고 있는 테이블 정보 조회
SELECT *  
FROM user_tables;

-- 사원 정보를 저장하고 있는 테이블 조회
SELECT *  
FROM EMPLOYEES;

-- 사원 정보 firstname, lastname을 저장하고 있는 테이블 조회
SELECT first_name, last_name
FROM EMPLOYEES;

-- 사원 정보 firstname, lastname, name 별칭으로 테이블 조회(출력)
--SELECT first_name + last_name -- 오류 ORA-01722: invalid number
-- 오라클에서 + 연산자는 문자연결연산자로 사용할 수 없다.
-- 오라클에서 문자연결연산자 || , concat() 
-- 오라클은 '문자열' '날짜'     오라클에서 문자열일때, 날짜일때 '' 사용 
-- concat ('문자열', '문자열')
SELECT first_name, last_name
      ,CONCAT(CONCAT(first_name, ' '), last_name) AS "NAME"
      , first_name || ' '|| last_name AS name   -- 같은 결과는 -1 붙어서 출력됨
FROM EMPLOYEES;

SELECT *
FROM tabs;
-- 각 팀장 -- 테이블 파악 제출 
-- 테이블이 뭐하는 테이블이고 데이터 몇개 칼럼 몇개 저장하고 있는지..등등

