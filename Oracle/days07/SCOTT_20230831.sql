-- 1. 오늘 날짜를 TO_CHAR() 함수를 사용해서 '2023년 08월 30일 오후 14:03:32 (월)' 형식으로 출력

select sysdate  
        --ORA-01821: date format not recognized
        --,to_char(sysdate, 'yyyy년 mm월 dd일 am hh24:mi:ss (dy)')
        ,to_char(sysdate, 'yyyy"년" mm"월" dd"일" am hh24:mi:ss (dy)')
--      ,to_char(sysdate, 'cc') 세기
--      ,to_char(sysdate, 'yyyy') 연도
--      ,to_char(sysdate, 'mm') 월
--      ,to_char(sysdate, 'dd') 일
--      ,to_char(sysdate, 'am') 
--      ,to_char(sysdate, 'hh24') 시간
--      ,to_char(sysdate, 'mi') 분
--      ,to_char(sysdate, 'ss') 초
--      ,to_char(sysdate, 'dy') 요일
--      ,to_char(sysdate, 'ts')

from dual;
--------------------------------------------------------------------------------
--2. 우리가 수료일 ( '2023.12.27' ) 오늘부터 수료일 까지 남은 일수 ? 

select sysdate, '2023.12.27'
--     , 날짜 - 날짜 = 일수
      , ceil ( abs( sysdate - tO_date ( '2023.12.27' ) ) ) "남은 일수"
from dual;
--------------------------------------------------------------------------------
--3. emp 테이블의 사원번호를 6자리로 출력하기. 
--java String.format("%06d", 123); 000123
    [ 출력 결과 예]
    7369	 007369
    7499	 007499
    7521	 007521
    7566	 007566
    7654	 007654 

select empno
        , to_char(empno, '009999')
        , lpad(empno, 6, 0)
from emp;
--------------------------------------------------------------------------------
--4.  emp 테이블에서 각 사원의 번호, 이름, 급여(pay) 출력.
    1) 10번 부서원은 15% 급여(pay) 인상
    2) 20번 부서원은 30% 급여(pay) 인상
    3) 그 외 부서원은 5% 급여(pay) 인상
    이 되는 쿼리 작성하세요.
    ( DECODE, CASE 함수 );
    
select empno, ename, sal + nvl(comm, 0) pay
       , decode(deptno, 10, 15, 20, 30, 5) || '%' "인상률"
       , (sal + nvl(comm, 0)) * (decode(deptno, 10, 0.15, 20, 0.3, 0.05)) "인상액"
       , (sal + nvl(comm, 0)) * (case deptno
                                  when 10 then 0.15
                                  when 20 then 0.3
                                  else 0.05
                                  end
                                )"인상액"
       , (sal + nvl(comm, 0)) + (sal + nvl(comm, 0)) * (decode(deptno, 10, 0.15, 20, 0.3, 0.05)) "인상 후"
from emp;
--------------------------------------------------------------------------------
--5. emp 테이블의 각 부서별 사원수가 3명 이하인 부서 조회
  ( 조건 : 40번 부서도 0 으로 출력, OUTER JOIN 사용 ) 
  [실행 결과]
     DEPTNO         COUNT 
---------- --------------
        10              3
        20              3
        40              0 
;
select d.deptno, count(empno) -- COUNT (comm) X
from emp e right outer join dept d on e.deptno = d.deptno -- dept를 출력할건데 dept가 오른쪽에 있어서 right 
group by d.deptno
having count(empno) <= 3
order by d.deptno;
--------------------------------------------------------------------------------
-- join ~ on 구문 => ,로 변경
select d.deptno, count(empno)
from emp e , dept d -- , 로 바꾸고 뒤에 조건절은 where 절로 들어간다.  
where e.deptno = d.deptno 
group by d.deptno
having count(empno) <= 3
order by d.deptno;
[결과] 30번이 빠져있음 right oute join이 빠져 있어서.
10	3
20	3
--------------------------------------------------------------------------------
-- (+) 가 right outer join을 의미한다.
-- (+) 가 where e.deptno = d.deptno(+) 된다면 left outer join을 의미한다.
select d.deptno, count(empno)
from emp e , dept d -- , 로 바꾸고 뒤에 조건절은 where 절로 들어간다.  
where e.deptno(+) = d.deptno 
group by d.deptno
having count(empno) <= 3
order by d.deptno;
--------------------------------------------------------------------------------
--5-2. emp 테이블에서 각 부서의 사원수를 조회
    ( 조건 : DECODE, COUNT 함수 사용 ) ;
select count(*) "총 사원 수"
      ,COUNT ( decode(deptno, 10, 'O') ) "10번 사원수"
      ,COUNT ( decode(deptno, 20, 'O') ) "20번 사원수"
      ,COUNT ( decode(deptno, 30, 'O') ) "30번 사원수"
      ,COUNT ( decode(deptno, 40, 'O') ) "40번 사원수"
from emp;
--------------------------------------------------------------------------------
--6. 정규 표현식을 사용하는 함수를 모두 적으세요.
LIKE SQL 연산자     % _ 와일드카드
REGEXP_LIKE() 함수

INSTR()  '031)1234-5678'  ')' 위치  '-'위치
REGEXP_INSTR() 함수

SUBSTR()
REGEXP_SUBSTR()

REPLACE()
REGEXP_REPLACE()
--------------------------------------------------------------------------------
-- 7. emp 테이블에서 부서별, job별 사원의 급여합을 조회.
  [실행 결과] 
    DEPTNO JOB          SUM_PAY
---------- --------- ----------
        10 CLERK           1300
        10 MANAGER         2450
        10 PRESIDENT       5000
        20 ANALYST         3000
        20 CLERK            800
        20 MANAGER         2975
        30 CLERK            950
        30 MANAGER         2850
        30 SALESMAN        7800

-- 부서별 총 급여 합
select deptno, sum (sal + nvl(comm, 0)) deptno_sum_pay
from emp
group by deptno;

-- job별
select deptno, job, sum (sal + nvl(comm, 0)) deptno_sum_pay
from emp
group by deptno, job
order by deptno, job;
--------------------------------------------------------------------------------
--8. emp 테이블에서 각 부서별 총급여합 조회
  1) GROUP BY 절 사용

select deptno, sum(sal + nvl(comm, 0))
from emp
group by deptno;


  2) DECODE, SUM 함수 사용

select sum (sal + nvl(comm,0)) --27125 총 사원 급여합
      ,sum (decode ( deptno, 10, sal + nvl(comm, 0))) "10번"
      ,sum (decode ( deptno, 20, sal + nvl(comm, 0))) "20번"
      ,sum (decode ( deptno, 30, sal + nvl(comm, 0))) "30번"
from emp;
--------------------------------------------------------------------------------
9. emp 테이블에서 각 부서별, job 별 총급여합 조회 (sum_pay가 존재하지 않는 job도 출력)
  [실행 결과] 
    DEPTNO JOB          SUM_PAY
---------- --------- ----------
        10 ANALYST            0
        10 CLERK           1300
        10 MANAGER         2450
        10 PRESIDENT       5000
        10 SALESMAN           0
        20 ANALYST         3000
        20 CLERK            800
        20 MANAGER         2975
        20 PRESIDENT          0
        20 SALESMAN           0
        30 ANALYST            0

    DEPTNO JOB          SUM_PAY
---------- --------- ----------
        30 CLERK            950
        30 MANAGER         2850
        30 PRESIDENT          0
        30 SALESMAN        7800


with j as (
select distinct job
from emp
)
select deptno, j.job , sum( sal + nvl(comm, 0) ) dj_sum_pay
from j left outer join emp e on j.job = e.job
group by deptno, j.job
order by deptno;
--------------------------------------------------------------------------------
-- Oracle 10g 에 추가된 문법 PARTITION BY OUTER JOIN 사용해 수정
with j as (
select distinct job
from emp
)
select deptno, j.job , NVL(sum( sal + nvl(comm, 0) ), 0) dj_sum_pay
from j left outer join emp e PARTITION BY(deptno) on j.job = e.job
-- deptno로 파티션을 나눠서 'left outer join' 왼쪽의 j(job) 를 출력한다는 의미.
group by deptno, j.job
order by deptno;
--------------------------------------------------------------------------------
--10.  empno, dname, ename, hiredate 컬럼 조회 ( JOIN )
-- dept - dname
-- emp - empno, ename, hiredate
-- join 조건

 [실행결과]
7369	RESEARCH	SMITH	80/12/17
7499	SALES	ALLEN	81/02/20
7521	SALES	WARD	81/02/22

select empno, dname, ename, hiredate
from dept d inner join emp e on d.deptno = e.deptno; --inner 공통
------------------------------------
select empno, dname, ename, hiredate
from dept d , emp e
where d.deptno = e.deptno;
--------------------------------------------------------------------------------
11. insa테이블에서 여자인원수가 5명 이상인 부서만 출력.  
 [실행결과]
BUSEO               COUNT
--------------- ----------
개발부                   8
영업부                   8

select *
from insa
where 여자사원만;
---------------
select buseo, count(*) -- * -> buseo, count(*)
from insa
where mod(substr(ssn,-7,1),2)=0
group by buseo; -- 부서별로 그룹
---------------
select buseo, count(*)
from insa
where mod(substr(ssn,-7,1),2)=0
group by buseo
having count(*) >= 5; 
-- [풀이 끝]
--------------------------------------------------------------------------------
select *
from emp;

select*
from salgrade;
----------------
20	SMITH	800
30	ALLEN	1600
30	WARD	1250
20	JONES	2975
30	MARTIN	1250
----------------
-- deptno, ename, sal ,grade 등급 조회 (emp 테이블에서 사원의 급여 등급)
select deptno, ename, sal
      ,case
           when sal >= 700 and sal < 1200 then 1
           when sal between 1201 and 1400 then 2
           when sal between 1401 and 2000 then 3
           when sal between 2001 and 3000 then 4
           when sal between 3001 and 9999 then 5
       end grade
from emp;
--------------------------------------------------------------------------------
--join 사용
--non equal join 
select deptno, ename, sal ,grade
from emp e join salgrade s on e.sal between s.losal and s.hisal;
--
select deptno, ename, sal 
       ,losal || '~' ||hisal
       ,grade
from emp e join salgrade s on e.sal between s.losal and s.hisal;
--------------------------------------------------------------------------------


select deptno, ename
from emp
order by deptno;
-- [출력되기 원하는 형식(가로로)]
-- 10 , KING/CLARK/MILLER
-- 20 , FORD/SMITH/JONES

-- *** LISTAGG() ***
-- 오라클 11g 버전부터 사용할 수 있는 함수로 그룹에 속해있는 데이터를 가로로 나열할 때 사용한다. 

SELECT deptno 
        ,LISTAGG (ename,'/')
         WITHIN GROUP (ORDER BY sal DESC)
FROM emp
GROUP BY deptno;
[결과]
10	KING/CLARK/MILLER
20	FORD/JONES/SMITH
30	BLAKE/ALLEN/TURNER/MARTIN/WARD/JAMES
--------------------------------------------------------------------------------
[문제] 위 결과 + 40번 부서 추가 하고 사원없음 으로 출력
10	KING/CLARK/MILLER
20	FORD/JONES/SMITH
30	BLAKE/ALLEN/TURNER/MARTIN/WARD/JAMES
40  사원없음

SELECT d.deptno 
        ,nvl (LISTAGG (ename,'/') WITHIN GROUP (ORDER BY sal DESC), '사원없음')
FROM emp e right outer join dept d on d.deptno = e.deptno
GROUP BY d.deptno;
--------------------------------------------------------------------------------
-- GROUPING SETS 절
-- 예) GROUP BY exp1
--      UION ALL
--     GROUP BY exp2

-- GROUPING SETS (exp1, exp2)


select deptno, count(*)
from emp
group by deptno;
[결과]
30	6
20	3
10	3

-- union all

select job, count(*)
from emp
group by job;
[결과]
CLERK	    3
SALESMAN	4
PRESIDENT	1
MANAGER	    3
ANALYST	    1

-- [GROUPING SETS 절]
select deptno, job, count(*)
from emp
group by grouping sets (deptno, job);

-- emp 테이블에서 급여를 가장 많이 받는 사원의 정보(empno, deptno, ename, pay) 조회

select deptno, empno, ename
     , sal + nvl(comm, 0) pay
from emp
where (sal + nvl(comm, 0)) = (select max(sal + nvl(comm, 0)) from emp);
where (sal + nvl(comm, 0)) >= all(select sal + nvl(comm, 0) from emp);
--------------------------------------------------------------------------------
-- RANK 순위 함수
-- [TOP-N 분석]  인기 순위 TOP 10,5 .. 등
-- 1) ORDER BY 정렬된 인라인뷰
-- 2) ROWNUM 의사 칼럼 - 행마다 순서대로 번호를 부여하는 칼럼
-- 3) WHERE 조건절 에서 > , <= 조건을 지정한다.

-- 의사(pseudo) 컬럼 -- 실제 존재하지 않는 가짜
-- Pseudocolumn은 테이블의 컬럼처럼 동작하지만, 테이블내에 실제로 저장되어 있지 않는다. 
-- 그러므로 pseudocolumn에서 select을 해야 한다.
-- Pseudocolumn에는 insert, update, delete를 실행할 수 없으며, 
-- 일종의 argument없는 함수처럼 동작하는 것이다.
select rowid, rownum, ename
from emp;

desc emp; -- 구조 확인
--------------------------------------------------------------------------------
-- TOP - N 분석(방식) 

select deptno, ename, hiredate, sal + nvl(comm,0) pay
FROM emp
ORDER BY pay desc;

-- top 3
select rownum , e.*
from (
        select deptno, ename, hiredate, sal + nvl(comm,0) pay
        FROM emp
        ORDER BY pay desc
     )e
where rownum between 3 and 5; -- (주의) 안됨! 중간은 안됨 항상 top 부터 n 까지이다.
where rownum <= 5;
where rownum <= 3;
where rownum = 1;
--------------------------------------------------------------------------------
-- [RANK 순위 함수]
-- 1)RANK()
-- 2)DENSE_RANK()
-- 3)PERCENT_RANK()
-- 4)FIRST(), LAST()
-- 5)ROW_NUMBER() ***
--------------------------------------------------------------------------------
select deptno, ename, sal + nvl(comm,0) pay
         , row_number() over( order by sal + nvl(comm,0) desc ) 급여순위
from emp
where 급여순위 = 1;
-- ORA-00904: "급여순위": invalid identifier : 잘못된 식별자 , alias 인식 못함 -> with절 가공
--------------------------------------------------------------------------------
-->with절 가공
select e.*
from(
    select deptno, ename, sal + nvl(comm,0) pay
         , row_number() over( order by sal + nvl(comm,0) desc ) 급여순위
    from emp
)e
where 급여순위 between 3 and 5;
where 급여순위 <= 3;
where 급여순위 = 1;
--------------------------------------------------------------------------------
--[문제] emp 테이블에서 각 부서별 최고급여를 받는 사원의 정보를 조회
-- (deptno, [dname], ename, pay, hiredate, grade)

select deptno, ename, sal + nvl(comm,0) pay
      , row_number() over (partition by deptno order by sal + nvl(comm,0) desc) 급여순위
from emp;
-----------------------------------

select e.*
from(
    select deptno, ename, sal + nvl(comm,0) pay
      , row_number() over (partition by deptno order by sal + nvl(comm,0) desc) 급여순위
from emp
)e
where 급여순위 <= 2;
where 급여순위 = 1;

-----------------------------------
--dname 추가
select e.*
from(
    select d.deptno, dname, ename, sal + nvl(comm,0) pay
      , row_number() over (partition by d.deptno order by sal + nvl(comm,0) desc) 급여순위
from emp e, dept d
where e.deptno = d.deptno
)e
where 급여순위 <= 2;
----------------------------------
--grade 추가
select e.*
from(
    select d.deptno, dname, ename, sal + nvl(comm,0) pay, grade
      , row_number() over (partition by d.deptno order by sal + nvl(comm,0) desc) 급여순위
from emp e, dept d, salgrade s
where e.deptno = d.deptno AND sal between losal and hisal
)e
where 급여순위 <= 2;
--------------------------------------------------------------------------------
-- emp 테이블에서 최고급여 받는 사람
--dept : deptno, dname
--emp : deptno, ename, pay, hiredate
--salgrade : grade

select d.deptno, dname, ename, sal + nvl(comm, 0) pay, hiredate, grade
from dept d join emp e on d.deptno = e.deptno
            join salgrade s on e.sal between s.losal and s.hisal;
          --join ..
          --join ..
------------------------------------
select e.*
from(
     select d.deptno, dname, ename, sal + nvl(comm, 0) pay, hiredate, grade
            , row_number() over( order by sal + nvl(comm,0) desc ) 급여순위
     from dept d join emp e on d.deptno = e.deptno
                 join salgrade s on e.sal between s.losal and s.hisal
)e
where 급여순위 = 1;
--------------------------------------------------------------------------------
-- 순위(RANK) 함수
-- TOP - N 분석
-- ROW_NUMBER() OVER()

-- RANK(), DENSE_RANK() 중복순위 계산 O/X
-- dense 빽빽한, 밀집한

select empno, ename, sal
      , row_number() over(order by sal desc) rn_rank
      , rank() over (order by sal desc) r_rank --중복되는 값 계산
      , dense_rank() over (order by sal desc) dr_rank --중복되는 값 계산 X
from emp;
----------------------------------
--부서별 순위
select empno, ename, sal
      , row_number() over(PARTITION BY DEPTNO order by sal desc) rn_rank
      , rank() over (PARTITION BY DEPTNO order by sal desc) r_rank --중복되는 값 계산
      , dense_rank() over (PARTITION BY DEPTNO order by sal desc) dr_rank --중복되는 값 계산 X
from emp;
--------------------------------------------------------------------------------
--[문제] EMP 테이블에서 각 사원 급여를 부서 내에서의 급여 순위, 사원 전체의 급여 순위 조회

--부서 내 급여 순위
select empno, deptno, ename, sal + nvl(comm,0) pay
      ,rank() over (partition by deptno order by sal + nvl(comm,0) desc) r_rank    
from emp;

--사원 전체 급여 순위
select empno, ename, sal + nvl(comm,0) pay
       ,row_number() over(order by sal + nvl(comm,0) desc) rn_rank
       ,rank() over(order by sal + nvl(comm,0) desc) rn_rank
from emp;
----------------------------------
select empno, deptno, ename, sal + nvl(comm,0) pay
      ,rank() over (partition by deptno order by sal + nvl(comm,0) desc) "부서"  
      ,row_number() over(order by sal + nvl(comm,0) desc) "사원 전체" 
from emp
order by deptno;
--------------------------------------------------------------------------------
--[문제] insa 테이블에서 사원수 출력
-- 남자사원수 : 31
-- 여자사원수 : 29
-- 전체사원수 : 60

-- 첫번째 방법
select '남자사원수', COUNT(*) 
from insa
WHERE MOD(SUBSTR(SSN,-7,1),2) = 1
UNION
select '여자사원수', COUNT(*) 
from insa
WHERE MOD(SUBSTR(SSN,-7,1),2) = 0
UNION
select '전체사원수', COUNT(*) 
from insa;

-- 두번째 방법
select 
  decode (MOD(SUBSTR(SSN,-7,1),2),1, '남자', '여자') || '사원수' gender
, count(*)
FROM insa
group by MOD(SUBSTR(SSN,-7,1),2)
union
select '전체사원수', count(*)
from insa;

--3번째 방법 ROLLUP(), CUBE() 분석함수 -- GROUP BY 절 사용할 수 있는 함수
-- GROUPING SETS -- GROUP BY 절에 사용.

-- ROLLUP은 GROUP BY 절의 그룹 조건에 따라 전체 행을 그룹화 하고, 
-- 각 그룹에 대해 부분합을 구하는 연산자이다.
-- CUBE는 ROLLUP에 의한 그룹 결과와 GROUP BY 절에 기술된 조건에 따라 그룹 조합을 만드는 연산자이다. 
-- 즉, ROLLUP 연산자를 수행한 결과에 더해 GROUP BY 절에 기술된 조건에 따라 모든 가능한 그룹핑 조합에 대한 결과를 출력한다.



select  
      decode (MOD(SUBSTR(SSN,-7,1),2),1, '남자', 0 , '여자', '전체') || '사원수' gender
    , count(*)
FROM insa
GROUP BY CUBE(MOD(SUBSTR(SSN,-7,1),2));
GROUP BY ROLLUP(MOD(SUBSTR(SSN,-7,1),2));
-----------------------------------------
select buseo, jikwi, sum(basicpay) sum_pay
FROM insa
group by cube(buseo,jikwi)
-- group by buseo, rollup (jikwi) --직위에 대한 부분합만 전체사원합은 x
-- group by rollup (buseo, jikwi) -- 부분합
order by buseo;
--------------------------------------------------------------------------------
--[문제] emp 테이블에서 가장 빨리 입사한 사원과 가장 늦게(최근)에 입사한 사원의 일수 차이는?

select ename, hiredate
from emp
order by hiredate desc;

-- 날짜를 순위 매겨서 1등 날짜 - 마지막 날짜 

SMITH	80/12/17
MILLER	82/01/23

--row_number()
with a as (
    select hiredate
    from(
    select hiredate
    ,row_number() over(order by hiredate desc) h_rank
    from emp
    )e
    where h_rank = 1
),
b as (
    select hiredate
    from(
    select hiredate
    ,row_number() over(order by hiredate asc) h_rank
    from emp
    )e
    where h_rank = 1 
)
select a.hiredate - b.hiredate
from a, b;
------------------------------------
--max(),min() 써서 간단하게
select max(hiredate) - min(hiredate)
from emp;
--------------------------------------------------------------------------------
--[문제] 만 60세에 퇴사한다고 가정, 나이(입사일자와 별개)
-- insa 테이블에서 각 사원들의 만나이를 계산해서 출력(조회)
-- 1) ssn 주민등록번호 '770830-1022432'
--                           [1,2,3,4,5,6,7,8,9,0]   1900,2000,1800
--                      1,2,5,6    1900
--                      3,4,7,8    2000
--                          0,9    1800

-- 만나이 : 올해년도 - 생일년도 => 생일 지나지 않은 경우에는 -1 
-- 이름, 주민번호, 만나이 출력(조회)

select name, ssn
      , floor((sysdate - to_date (substr(ssn, 1, 6)))/365) "원래 나이" 
      , nvl (floor (decode (sign (sysdate - to_date ( substr(ssn, 3, 4), 'mm-dd')), -1, ((sysdate - to_date (substr(ssn, 1, 6)))/365) - 1 )),floor((sysdate - to_date (substr(ssn, 1, 6)))/365)) "만나이"  
from insa;

select sysdate
from dual;
--------------------------------------
--1)
select sysdate, to_char(sysdate,'yyyy') -- 올해년도
from dual;
--2)
select '770830-1022432'
      ,substr('770830-1022432', 0 , 2)
      ,case
         when  substr('770830-1022432', -7, 1) in (1,2,5,6) then 1900
         when  substr('770830-1022432', -7, 1) in (3,4,7,8) then 2000
         else  1800
       end + substr('770830-1022432', 0, 2) b_year
from dual;

--3)
select substr('770830-1022432', 3, 4) --b_md
      ,to_date(substr('770830-1022432', 3, 4),'mmdd')
      ,sign (trunc(sysdate) - to_date(substr('770830-1022432', 3, 4),'mmdd')) --소수점때문에 trunc(sysdate) 시간 절삭
from dual;

--구현)
select t.name, t.ssn
    --,t.now_year - t.birth_year
      ,t.now_year - t.birth_year + (case isBirthCheck
                                         when -1 then -1 -- 생일이 지나지 않은 경우
                                         else    0       --오늘 생일, 생일이 지난 경우
                                    end) american_Age -- 만 나이
      ,t.now_year - t.birth_year + 1 counting_age -- 세는 나이
from(
    select name, ssn
         ,to_char(sysdate, 'yyyy') now_year
         ,case
              when  substr(ssn, -7, 1) in (1,2,5,6) then 1900
              when  substr(ssn, -7, 1) in (3,4,7,8) then 2000
              else  1800
           end + substr(ssn, 0, 2) birth_year
          ,sign (trunc(sysdate) - to_date(substr(ssn, 3, 4),'mmdd')) isBirthCheck
    from insa
)t ;
--------------------------------------------------------------------------------
--Java : 임의의 수(난수)  0.0 <= double Math.random() < 1.0     , Random 클래스
--Oracle : dbms_random 패키지    !=    자바 패키지

SELECT 
--SYS.dbms_random.value --0.0 <= SYS.dbms_random.value  < 1.0
--sys.dbms_random.value(0,100) -- 0 <= 실수 < 100
--sys.dbms_random.string('U',5) -- UPPER 무작위 대문자 5글자
--sys.dbms_random.string('L',5) --LOWER 무작위 소문자 5글자
--sys.dbms_random.string('A',5) -- 무작위 알파벳 대소문자
--sys.dbms_random.string('X',5) -- 대문자 + 숫자 5글자
sys.dbms_random.string('P',5) -- 대문자 + 특수문자 5글자
from dual;

-- 0<= SCORE 정수 <100
-- 1<= lotto 정수 <45
-- 150<= v 정수 <= 200
select  trunc(sys.dbms_random.value*101) -- 0 <= 실수 < 101
       ,trunc(sys.dbms_random.value(0,45))+1 -- 0 + 1<= 정수 < 45 +1
       ,trunc(sys.dbms_random.value(0,51))+150
from dual;
--------------------------------------------------------------------------------
-- [피봇(pivot) 설명]

--ㄱ.
select job
from emp;

[결과]
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

--ㄴ. 각 job(업무) 를 몇 명이 하고 있는지 파악.
select job, count(*)
from emp
group by job;

[결과]
CLERK	    3 
SALESMAN	4
PRESIDENT	1
MANAGER	    3
ANALYST  	1

--ㄷ. 가로 형식으로 조회하려고 함.
-- decode, case, count

select count(*)
      ,count (decode(job, 'CLERK', '0')) "CLERK" 
      ,count (decode(job, 'SALESMAN', '0')) "SALESMAN" 
      ,count (decode(job, 'PRESIDENT', '0')) "PRESIDENT" 
      ,count (decode(job, 'MANAGER', '0')) "MANAGER"
      ,count (decode(job, 'ANALYST', '0')) "ANALYST"
from emp;

--ㄹ. PIVOT(피봇) 함수
--      ㄴ 축을 중심으로 (회전시키다.)
--      ㄴ 모니터 가로/세로 - 피봇 기능

SELECT * 
  FROM (피벗 대상 쿼리문)
 PIVOT (그룹함수(집계컬럼) FOR 피벗컬럼 IN(피벗컬럼 값 AS 별칭...))
 
[출처] [Oracle] 오라클 PIVOT(피벗)함수|작성자 끄니;


SELECT * 
  FROM (
        select job
        from emp
       )
 PIVOT (count(job) FOR job IN('CLERK','SALESMAN','PRESIDENT','MANAGER','ANALYST'));
------------------------------------
SELECT * 
  FROM (SELECT 
         job ,
         TO_CHAR(hiredate, 'FMMM') || '월' hire_month
         from emp
       )
   PIVOT(
         count(*)
          FOR hire_month IN ('1월', '2월')
        )
[출처] [Oracle] 오라클 PIVOT(피벗)함수|작성자 끄니
------------------------------------
-- [문제] emp 테이블에서 (각 부서별로 )+ 각 job별로 인원수를 가로 출력(조회)
--1) 피봇 대상 찾기
;
select *
from (
        select deptno, job
        from emp
     )
pivot(count(job) for job in ('CLERK','SALESMAN','PRESIDENT','MANAGER','ANALYST'))
order by deptno;
--           ㄴ칼럼 null 아니면 마음대로 (이유는 아래 참고)
-----------------------------------------
select count(*), count(empno), count(comm)
from emp;
-----------------------------------------
-- 위에 출력결과에 40  0 0 0 0 0 추가 하려면?

select *
from(
select d.deptno, job
from emp e right outer join dept d on e.deptno = d.deptno
)
pivot (count(job)  for job in ( 'CLERK','SALESMAN','PRESIDENT','MANAGER','ANALYST'))
order by deptno;

--------------------------------------------------------------------------------
