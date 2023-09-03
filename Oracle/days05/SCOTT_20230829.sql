--SCOTT--

-- [집계 함수]
-- 각 사원들의 급여
-- 각 사원들의 총급여합
-- 총 사원 수
-- 각 사원들의 평균급여
SELECT SUM (sal + NVL(comm, 0)) SUM_PAY --27125
        , COUNT(sal + NVL(comm, 0)) cnt --12명
        , SUM (sal + NVL(comm, 0))/COUNT(sal + NVL(comm, 0)) avg_pay
        , AVG(sal + NVL(comm, 0)) avg_pay 
        , MAX(sal + NVL(comm, 0)) MAX_pay 
        , MIN(sal + NVL(comm, 0)) MIN_pay
        , STDDEV(sal + NVL(comm, 0)) STDDEV_pay--표준편차 : 분산의 제곱근(루트)
        , VARIANCE(sal + NVL(comm, 0)) VARIANCE_pay--분산 : (각 사원들의 PAY - AVG_PAY)^2의 평균
FROM emp;
----------------------------------------------------------
-- 1. insa 테이블에서 남자는 'X', 여자는 'O' 로 성별(gender) 출력하는 쿼리 작성
-- 1-1. 집계(SET)연산자 사용해서 풀기
SELECT name, ssn
       ,'X' gender
FROM insa
WHERE mod(SUBSTR(ssn,-7,1),2) = 1
UNION
SELECT name, ssn
       ,'O' gender
FROM insa
WHERE mod(SUBSTR(ssn,-7,1),2) = 0;

--1-2. REPLACE() 사용해서 풀기
SELECT ename
    , REPLACE(ename, 'M', '*')
FROM emp;
-- 성별이 1 or 0 .. 1이면 X 0이면 O

WITH t as(
SELECT name, ssn
       ,mod(SUBSTR(ssn,-7,1),2) gender
FROM insa
)
SELECT t.name, t.ssn
    ,replace(replace(t.gender, 1, 'X'), 0 , 'O') gender
FROM t;

--3. NVL2(), NULLIF() 사용해서 풀기.
SELECT NULLIF(1,1) -- NULL
FROM dual;
--
SELECT NULLIF(1,0) -- 1
FROM dual;
--

select comm
    ,nvl(comm,0) 
    ,nvl2(comm,comm,0)
FROM emp;
--
SELECT name, ssn
    --,NULLIF(A,B) --A==B 남자 NULL반환 , A!=B A반환 
    , NVL2(NULLIF(mod(SUBSTR(ssn,-7,1),2),1),'O','X') GENDER
FROM insa;
------------------------------------------------------------
--2. insa 테이블에서 2000년 이후 입사자 정보 조회하는 쿼리 작성
--입사일자를 기준으로 년도 추출해서 비교
SELECT name, ibsadate
    ,TO_CHAR(ibsadate, 'yyyy')
    ,EXTRACT(year FROM ibsadate) 
FROM insa
WHERE TO_CHAR(ibsadate, 'yyyy') = '2000';
WHERE EXTRACT(year FROM ibsadate) = 2000;
--
SELECT name, ibsadate
FROM insa
WHERE ibsadate >='2000.1.1';
-----------------------------------------
3. SQL 집합(SET) 연산자의 종류와 설명을 하세요
  1) 종류 
  	UNION 
	UNION ALL 
	INTERSECT 
	MINUS
------------------------------------------
--4. emp 테이블에서 급여와 평균급여를 구하고
   각 사원의 급여-평균급여를 소수점 3자리에서 올림,반올림,내림해서 아래와 
   같이 조회하는 쿼리를 작성하세요.
   
   SELECT ename, sal + NVL(comm, 0) pay
   FROM emp;
   --
   SELECT ename
   , AVG(sal + NVL(comm, 0) pay) AVG_PAY 
   -- 여러개의 사원정보(레코드)가 들어가서 하나의 값이 나옴(복수행함수) , ename은 단행함수라서 같이 못씀
   FROM emp;
   --
   --서브쿼리 사용******************************************
    WITH temp AS(
    SELECT ename, sal + NVL(comm, 0) pay
         -- , AVG(sal + NVL(comm, 0) pay) AVG_PAY 
        ,(select AVG(sal + NVL(comm, 0)) AVG_PAY from emp) avg_pay 
    from emp)
    
    --평균급여가 소수점 3번째 자리에서 반올림 round(값, 2) //2+1 반올림
    select ename, pay
    ,round(avg_pay,2) avg_pay
--    ,ceil(pay - avg_pay,2) --올림
    ,ceil(pay - avg_pay*100)/100 --올림
    ,round(pay - avg_pay,2) --반올림
    ,trunc(pay - avg_pay,2) --내림(절삭) floor x
    from temp;
------------------------------------------------
( 힌트 : AVG() 평균 구하는  집계함수 사용 )
4-2. emp 테이블에서 급여와 평균급여를 구하고
    각 사원의 급여가 평균급여 보다 많으면 "많다"
                   평균급여 보다 적으면 "적다"라고 출력;                

SELECT ename, pay, avg_pay
        , sign(pay - avg_pay) --양수1 음수-1 같으면 0 반환 --(1많다) (-1적다), (0같다)
        , NVL2(NULLIF(sign(pay - avg_pay),1),'많다','적다') --1,-1 경우에만 적용한거라 완벽한 코딩은 아님 0도 처리해야함 replace 사용해서 0까지 해보기
from (select ename, sal + nvl(comm, 0) pay
    , (select avg(sal + nvl(comm, 0 )) from emp) avg_pay
     from emp
     )e;
--ORA-00936: missing expression -- 서브쿼리 괄호 묶어야됨
----------------------
--set 함수 union 사용
select ename, pay,'많다'
from emp
where pay> avg_pay
union
...

-------------------------------------------------------------------
--5.  총 게시글수가 154개이고 한 페이지에 출력할 게시글 수가 15개 일 때
    --총 페이지수는 얼마인가 계산하는 쿼리 작성.
SELECT CEIL(154/15)
FROM dual;

--------------------------------------------------------------------
--5-2. insa 테이블에서 모든 사원들을 14명씩 팀을 만드면 총 몇 팀이 나올지를 쿼리로 작성하세요.

select count(*)from insa;
--
select ceil(60/14)
from dual;
--
--ORA-00936: missing expression 서브쿼리는 괄호처리
select ceil(select count(*)from insa/14)
from dual;
--
select ceil((select count(*)from insa)/14)
from dual;
------------------------------------------------
--6. emp 테이블에서 최고 급여자, 최저 급여자 정보 모두 조회

select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay, deptno
from emp;
--
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay, deptno
      , '최고급여자'
from emp
where sal + nvl(comm,0) = 5000;
--(SELECT  MAX(sal + NVL(comm, 0)) MAX_pay FROM emp); --5000값을 가져오는 서브쿼리
--
SELECT  MAX(sal + NVL(comm, 0)) MAX_pay 
FROM emp;
--
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay, deptno
      , '최고급여자'
from emp
where sal + nvl(comm,0) = (SELECT  MAX(sal + NVL(comm, 0)) MAX_pay FROM emp)
union
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay, deptno
      , '최저급여자'
from emp
where sal + nvl(comm,0) = (SELECT  min(sal + NVL(comm, 0)) MAX_pay FROM emp);
--


--2번째 풀이
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay, deptno
      , '최고급여자'
from emp
where sal + nvl(comm,0) >= all(SELECT sal + NVL(comm, 0) FROM emp);
--union
--all, any, some
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay, deptno
      , '최저급여자'
from emp
where sal + nvl(comm,0) <= all(SELECT  sal + NVL(comm, 0) FROM emp);
--

--3번째 풀이
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay
      , deptno
from emp
where sal + nvl(comm,0) in(5000, 800);
--
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay
      , deptno
from emp
where sal + nvl(comm,0) in(5000, 800);
--
select max(sal + nvl(comm,0)), min(sal + nvl(comm,0))
from emp;
----------------------------------------------------
--ORA-00913: too many values 에러
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay
      , deptno
from emp
where sal + nvl(comm,0) in(
    select max(sal + nvl(comm,0)), min(sal + nvl(comm,0))
    from emp);
----------
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay
      , deptno
from emp
where sal + nvl(comm,0) in(
    select max(sal + nvl(comm,0))--, min(sal + nvl(comm,0))
    from emp);
------------
--in으로 쓰려면 이렇게
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay
      , deptno
from emp
where sal + nvl(comm,0) in(
(select max(sal + nvl(comm,0)) from emp),
(select min(sal + nvl(comm,0)) from emp)
);
-------
7. emp 테이블에서 
   comm 이 400 이하인 사원의 정보 조회
   ( comm 이 null 인 사원도 포함 )
;

select ename, sal, comm
FROM emp
where comm <= 400; -- null --null은 참,거짓이 아님
--
--두번째 방법
select ename, sal, comm
FROM emp
where comm <= 400 or comm is null;
--
--세번째 방법
select ename, sal, comm
FROM emp
where comm <= 400
union
select ename, sal, comm
from emp
where comm is null;
--
--첫번째 방법
select ename, sal, comm
FROM emp
where nvl(comm,0)<=400;
--
--네번째 방법
--lnnvl(조건식)
--where의 조건이 true이면 false 반환
--              null이면 false 반환
--              false이면 true 반환
select ename, sal, comm
FROM emp
where lnnvl(); --수정 where comm <= 400 or comm is null
--
select ename, sal, comm
FROM emp
where lnnvl(comm > 400);--where comm <= 400 or comm is null의 결과물과 같은 코딩
--
8. emp 테이블에서 각 부서별 급여(pay)를 가장 많이 받는 사원의 정보 출력. 

select max(sal + nvl(comm,0))from emp where deptno = 10; --10번 부서 5000
select max(sal + nvl(comm,0))from emp where deptno = 20; --20번 부서 3000
select max(sal + nvl(comm,0))from emp where deptno = 30; --30번 부서 2850
select max(sal + nvl(comm,0))from emp where deptno = 40; --40번 부서 null

select*
from emp
where deptno = 30 and
sal + nvl(comm,0) = (select max(sal + nvl(comm,0))
from emp where deptno = 30)

union

select*
from emp
where deptno = 10 and
sal + nvl(comm,0) = (select max(sal + nvl(comm,0))
from emp where deptno = 10)

union

select*
from emp
where deptno = 20 and
sal + nvl(comm,0) = (select max(sal + nvl(comm,0))
from emp where deptno = 20);


--
-- 위의 쿼리 비교
-- 상관 서브 쿼리
select *
from emp e
where sal + nvl(comm,0) = (
    select max (sal+nvl(comm,0))
    from emp
    where e.deptno = deptno
)
--------------------------------------------------
-- 각 부서별 최고 급여액 얼마인지?
SELECT MAX(SAL + NVL(COMM,0)) MAX_PAY
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--------------------------------------
9. INSTR() 함수 사용하는 문제입니다. 
    '031)1234-5678' 이라는 전화번호가 있을 경우
    INSTR() 함수를 사용해서 1234 전화번호를 얻어오는 쿼리를 작성하세요;

--substr()
SELECT '031)1234-5678'
        , substr('031)1234-5678', 5, 4) --'1234'
        , instr('031)1234-5678', ')') --4
        , substr('031)1234-5678'
                , instr('031)1234-5678', ')')+1 -- +1은 괄호 다음부터여서
                , instr('031)1234-5678', '-') - instr('031)1234-5678', ')') -1)
              --,4)
FROM DUAL;
-----------------------------------------------
--12번
select deptno, ename, sal+nvl(comm,0) pay
        , round((sal+nvl(comm,0))/100) bar_length
        , lpad(' ',round((sal+nvl(comm,0))/100)+1, '#')
from emp
where deptno = 30
order by pay desc
;
------------------------------------------------
--13.  insa 테이블에서 주민등록번호를 123456-1******  형식으로 출력하세요 . 

select name, ssn
    , substr(ssn, 0, 8) || '******'
    , concat(substr(ssn, 0, 8), '******')
    , rpad(substr(ssn, 0, 8), 14, '*')
from insa;
-------------------------------------------------
--trunc() 절삭(내림) 함수, 숫자, 날짜, 절삭하고자 하는 특정 위치를 줄 수 있다.
--floor() 절삭(내림) 함수, 숫자 ,     소수점 첫번째 자리에서 절삭

select sysdate -- 오라클에서 날짜를 나타내는 자료형 중 date 자료형 : sysdate
      ,systimestamp --오라클에서 날짜를 나타내는 자료형 중 timestamp 자료형
      ,trunc( sysdate, 'year' ) --23/01/01
      ,trunc( sysdate, 'month' ) --23/08/01
      ,trunc( sysdate)--23/08/29 -- 00:00:00 시간,분,초 절삭되어짐 --자주 사용됨
from dual;
-------------------------------------------------
--15번

--ORA-00937: not a single-group group function
--avg 집계함수
select sum(pay)
from(
    select ename, sal, comm
         , sal + nvl(comm,0) pay
        , round ((select avg(sal + nvl(comm,0)) from emp ),5) avg_pay
    from emp
)e
where pay > avg_pay;
-------------------------------------------------
--16번
select t.*
    ,t.pay/t.max_pay * 100 || '%' percent
    ,round (t.pay/t.max_pay * 100/10) 별갯수
    ,lpad( ' ', round (t.pay/t.max_pay * 100/10)+1, '*')
from (
select ename
, sal + nvl(comm,0) pay
,(select max(sal + nvl(comm,0)) from emp) max_pay
from emp
)t;
-------------------------------------------------
-- [문제] emp 테이블의 pay 급여 순으로 등수를 매기기 (상관 서브 쿼리 사용해서)-- 외우기
-- 상관서브 쿼리 두가지 암기하기

select t.*
    ,(SELECT COUNT(*)+1-- +1은 등수 체크하는 사람보다 급여가 많은 사람의 사람수에서 1을 더해야 그 사람의 등수가 나옴
    FROM EMP
    WHERE sal + nvl(comm,0)>t.pay
    ) pay_rank
from(
    select ename, sal + nvl(comm,0) pay
    from emp
)t
order by pay_rank asc;
--
--with절로 
with t as(
select ename, sal + nvl(comm,0) pay
    from emp
)
select t.*
    ,(SELECT COUNT(*)+1
    FROM EMP
    WHERE sal + nvl(comm,0)>t.pay
    ) pay_rank
from t
order by pay_rank asc;
------------------------------------------------
--날짜 함수
1)sysdate - 현재 날짜, 시간 정보 반환하는 함수
    to_char (날짜, '형식')
select sysdate --'23/08/29'
    ,to_char(sysdate,'yyyy-mm-dd pm hh12:mi:ss (day)')
    ,to_char(sysdate,'ds ts')
from dual;

-- 외우기 차이점 시험 
--년 중 몇번째 주 ww ,iw (차이점?)  -   w

2)round(날짜, [형식])
select sysdate
     , to_char(sysdate,'DL TS') --2023년 8월 29일 화요일 오후 3:47:33
     , ROUND (SYSDATE) --23/08/30 --12시(정오)가 지났기 때문에 반올림되서 29일이지만 30일로 나옴
     , ROUND (SYSDATE, 'DD') --23/08/30 --일을 기준으로 반올림
     , ROUND (SYSDATE, 'MONTH') --23/09/01 15일이 지났기 때문에 반올림 9/1
     , ROUND (SYSDATE, 'YEAR') --24/01/01
from dual;
--
3) TRUNC(date)
select sysdate
     , to_char(sysdate,'DL TS') 
     , TRUNC (SYSDATE) 
     , TRUNC (SYSDATE, 'DD') 
     , TRUNC (SYSDATE, 'MONTH') 
     , TRUNC (SYSDATE, 'YEAR') 
from dual;
--
3)MONTHS_BETWEEN() --두개의 날짜간의 개월수를 리턴하는 함수
--emp 테이블의 각 사원들의 근무일수, 근무개월수, 근무년수 조회.

-- 꼭 외우기
날짜 - 날짜 = 일수
날짜 + 숫자 = 날짜
날짜 - 숫자 = 날짜
날짜 + 시간 = 날짜
      숫자/24

select ename
    , hiredate
    , sysdate
    , round ( sysdate - hiredate ) 근무일수 -- 날짜 - 날짜 = 일수
    , round ( months_between (sysdate, hiredate), 1) 근무개월수
    , round ( months_between (sysdate, hiredate)/12, 1) 근무년수
from emp;

--
--1시간 후 수업 종료

select sysdate 
    , to_char (sysdate, 'ts') --오후 4:14:30
    , sysdate + 1
    , sysdate + 10 --10일 후
    , to_char(sysdate +1/24, 'ts') --오후 5:15:22
from dual;
--------------------------------------------------
4)ADD_MONTHS(날짜, 더할 달)

select sysdate
    ,add_months(sysdate, 3) -- 23/11/29
    ,add_months(sysdate, -1) --23/07/29
from dual;
-------------------------------------------------
5)LAST_DAY() --특정 날짜가 속한 달의 가장 마지막 날짜를 리턴하는 함수
select sysdate a
    --,last_day(sysdate)--23/08/31
     -- 이번 달 마지막 날짜가 무슨 요일, 몇일까지인지 조회
    --,to_char (last_day(sysdate), 'dy')
    --,to_char (last_day(sysdate), 'dd')
    
    -- 이번 달 1일이 무슨 요일?
    ,to_char(trunc(sysdate, 'month'),'day') --23/08/01
    ,to_char(last_day(add_months(sysdate,-1)) + 1, 'day')
from dual;
-------------------------------------------------
6)next_day() --명시된 요일이 돌아오는 가장 최근의 날짜를 리턴하는 함수
  형식)NEXT_DAY(날짜, '요일')
  
  select sysdate, to_char(sysdate, 'day')
        , next_day(sysdate, '금요일') --sysdate부터 가장 가까운 금요일
        , next_day(sysdate, '화요일') --23/09/05
  FROM dual;
---------------------------------------------------
select sysdate --'23/08/29'
      , CURRENT_DATE --'23/08/29'
from dual;
--------------------------------------------------
--[문제] 개강일 23.7.13(목) 로부터  100일이 되는 날짜 몇일?
-- 날짜 + 숫자 = 숫자만큼의 일수가 더해진 날짜
-- 오라클 날짜, 문자열 ''

--ORA-01722: invalid number
--'23.7.13' == 날짜로 넣은건데 문자열로 인식되서 오류
--문자열->날짜 형 변환 : to_date()                 to_char(숫자,날짜,문자->문자변환)
--【형식】
     TO_DATE( char [,'fmt' [,'nlsparam']])
     
select to_date('23.7.13') + 100 --23/10/21
        ,to_date('23/7/13') + 100
       --,to_date('23.7.13(목)') +100 --ORA-01830: date format picture ends before converting entire input string
       --,to_date('23.7.13(목)', 'yy.m.dd(dy)') +100 --ORA-01821: date format not recognized
       ,to_date('23.7.13(목)', 'yy.mm.dd(dy)') +100 --23/10/21
FROM dual;



--------------------------------------------

--[변환 함수]
1) TO_NUMBER() --잘 안씀 자동으로 바꿔주기 때문에
    -- 왼쪽정렬             오른쪽정렬
    select '100' , to_number('100')
    from dual;
--------------------------------------------
-- DECODE 함수 (중요)
-- 여러개의 조건을 주어 조건에 맞을 경우 해당 값을 반환하는 함수 (if문)
-- 비교연산자를 '= 같다' 만 사용할 수 있다.
-- from절에서는 사용할 수 없다.
-- PL/SQL 안에서 사용할 수 있는 함수이다.

-- 자바
int x = 10;
if ( x == 11){
return c;
}
-- 오라클 decode 함수를 사용해서 표현
decode (x, 11, c) x가 11이면 c를 리턴한다.
-----------------------------------------
-- 자바
int x = 10;
if ( x == 11){
return c;
}else{
return d;
}
-- 오라클 decode 함수를 사용해서 표현
decode (x, 11, c, d) x가 11이면 c를 리턴하고 그렇지 않으면 d를 리턴한다.
------------------------------------------
-- 자바
int x = 10;
if ( x == 11){
return c;
}else if(x==12){
return d;
}else if(x==13){
return e;
}else{
return f;
}
-- 오라클 decode 함수를 사용해서 표현
decode (x, 11, c, 12, d, 13, e, f) x가 11이면 c를 리턴하고...
--------------------------
예) insa 테이블에서 주민등록번호를 가지고 "남자", "여자"라고 출력.

select name, ssn
     ,mod(substr(ssn,-7,1),2)
     ,decode(mod(substr(ssn,-7,1),2), 1, '남자', '여자') gender
     ,decode(mod(substr(ssn,-7,1),2), 1, '남자', 0,'여자') gender
from insa;
---------------------------
--[문제] emp 테이블에서 10번 부서원 급여 15% 인상, 20번 부서원 급여 30% 인상, 그 외 부서는 5% 인상, 출력(부서번호, 사원명, 원래 급여, 인상액, 인상된 급여)

select empno, ename ,sal + nvl(comm,0) pay
    ,decode( sal + nvl(comm,0),  ,  ,   )
from emp;
--------------------------------------------------------------------------------




1. insa 테이블에서 남자는 'X', 여자는 'O' 로 성별(gender) 출력하는 쿼리 작성
작성하는 순서 모르겠음 gender를 사용하려고???★★★★★★★★★★

WITH t as(
SELECT name, ssn
       ,mod(SUBSTR(ssn,-7,1),2) gender
FROM insa
)
SELECT t.name, t.ssn
    ,replace(replace(t.gender, 1, 'X'), 0 , 'O') gender
FROM t;



WITH t AS (
    SELECT name, ssn, SUBSTR(ssn, 8, 1) gender
    FROM insa    
)
SELECT name, ssn
--    , gender
--    , MOD( gender, 2 )
--    , NULLIF( MOD( gender, 2 ), 1 )
    , NVL2( NULLIF( MOD( gender, 2 ), 1 ), 'X','O' ) gender
FROM t;




--------------------------------------------------------------

4. emp 테이블에서 급여와 평균급여를 구하고
   각 사원의 급여-평균급여를 소수점 3자리에서 올림,반올림,내림해서 아래와 
   같이 조회하는 쿼리를 작성하세요.

SELECT ename, pay, avg_pay
    , CEIL((pay-avg_pay)*100)/100 "차 올림"
    , ROUND((pay-avg_pay),2) "차 반올림"
    , TRUNC((pay-avg_pay),2) "차 내림"
FROM (
    SELECT ename
        , sal+NVL(comm, 0) pay
        , (SELECT AVG(sal+NVL(comm, 0)) FROM emp) avg_pay
    FROM emp
) temp;




--------------------------------------------------------------
( 힌트 : AVG() 평균 구하는  집계함수 사용 )
4-2. emp 테이블에서 급여와 평균급여를 구하고
    각 사원의 급여가 평균급여 보다 많으면 "많다"
                   평균급여 보다 적으면 "적다"라고 출력

SELECT ename, pay, avg_pay
        , sign(pay - avg_pay) --양수1 음수-1 같으면 0 반환 --(1많다) (-1적다), (0같다)
        , NVL2(NULLIF(sign(pay - avg_pay),1),'많다','적다') --1,-1 경우에만 적용한거라 완벽한 코딩은 아님 0도 처리해야함 replace 사용해서 0까지 해보기
from (
    select ename, sal + nvl(comm, 0) pay
        , (select avg(sal + nvl(comm, 0 )) from emp) avg_pay
    from emp
) e;

-----------------------------------------------------
--6. emp 테이블에서 최고 급여자, 최저 급여자 정보 모두 조회
select empno, ename, job, mgr, hiredate
      , sal + nvl(comm,0) pay
      , deptno
from emp
where sal + nvl(comm,0) in(
    (select max(sal + nvl(comm,0)) from emp)
    ,(select min(sal + nvl(comm,0)) from emp)
);



-----------------------------------------------------
8. emp 테이블에서 각 부서별 급여(pay)를 가장 많이 받는 사원의 정보 출력. 



select *
from emp
where (deptno = 30 
    and sal + nvl(comm,0) = ( select max(sal + nvl(comm,0))
                              from emp 
                              where deptno = 30))
    OR
    (deptno = 20 
    and sal + nvl(comm,0) = ( select max(sal + nvl(comm,0))
                              from emp 
                              where deptno = 20))
    OR
    (deptno = 10 
    and sal + nvl(comm,0) = ( select max(sal + nvl(comm,0))
                              from emp 
                              where deptno = 10));
                              

SELECT *
FROM emp e
WHERE sal+NVL(comm,0) = ( 
                        SELECT MAX(sal+NVL(comm,0)) 
                        FROM emp 
                        WHERE e.deptno=deptno 
                        );
