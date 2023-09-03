-- 1. insa 테이블에서 각 부서별 사원수 조회
-- 문제 풀이 순서
1)
select *
from insa;
2) 부서 확인
select distinct buseo
from insa;
3) union 사용해서 고정값 부서 넣어서 조회
select '총무부', count(*) from insa where buseo = '총무부'
union
select '개발부', count(*) from insa where buseo = '개발부';
4) group by 절 사용해서 조회
select buseo, count(*)
from insa
group by buseo; -- group by 절을 사용하는 것은 집계를 나타내겠다는 의도가 있다.
-----------------------------------------------------
-- group by를 사용하고 이름도 출력하려고 할 때 나는 오류
-- ORA-00979: not a GROUP BY expression 
-- : group by절에 없는 칼럼은 select 절에 집계 함수를 제외하고는 올 수 없다. -- 외우기
select buseo, name, count(*)
from insa
group by buseo;
-----------------------------------------------------
5) 상관 서브 쿼리를 사용해서 조회 (s 서브쿼리 m 메인쿼리 cnt 사원수)
select buseo
    , (select count (*) 
       from insa s 
       where s.buseo = m.buseo) cnt
from insa m;
-- 중복된 데이터가 출력됨 중복이 나오지 않게 제거해야 함 
-- distinct 추가
select distinct buseo
    , (select count (*) 
       from insa s 
       where s.buseo = m.buseo) cnt
from insa m;
-----------------------------------------------------
-- 윗 코딩 with절 , 상관서브쿼리 사용
with m AS (
select distinct buseo
from insa m
)
select buseo,(select count (*) 
       from insa s 
       where s.buseo = m.buseo) cnt
FROM M
;
--------------------------------------------------------------------------------

-- [상관서브쿼리 예제] emp 테이블에서 각 부서별 사원수 조회.
-- [상관서브쿼리 예제] emp 테이블에서 급여(pay)의 등수 조회.
select ename, sal + nvl(comm,0) pay
      , ( select count(*) + 1
          from emp 
          where sal + nvl(comm,0) > e.sal + nvl(e.comm,0) ) pay_rank 
          -- 상관 서브 쿼리 안에 있는 것만은 실행 안됨, 
          -- 메인쿼리와 연관되어 있어서 메인쿼리와 함께 실행해야 한다.
from emp e;
-----------------------------------------------------
-- [추가 문제] insa 테이블에서 남자 사원 수, 여자 사원 수 를 조회.
(내가 푼 것)
select e.*
from(
     select name
     , decode( mod(substr(ssn, -7, 1),2), '1' , '남자', '여자') 
     from insa
     )e;
-----------------------------------------------------
(강사님)
1)
select 성별, count(*)
from insa
group by 성별로 그룹
2)
select mod(substr(ssn, -7, 1),2) , count(*)
from insa
group by mod(substr(ssn, -7, 1),2);
3)nullif(), nvl2(), 1,0 -> '남자사원수','여자사원수'
-----------------------------------------------------
decode() 사용한 풀이
select decode (mod(substr(ssn, -7, 1),2),1,'남자사원수','여자사원수'), count(*)
from insa
group by mod(substr(ssn, -7, 1),2);
-----------------------------------------------------
decode() 사용한 풀이-2)
select count(*) '전체사원수' -- ORA-00923: FROM keyword not found where expected
                           -- alias 에는 '전체사원수' 가 아닌 "전체사원수" 쌍따옴표를 붙인다.
from insa;
--------------------------
select count(*) "전체사원수"
      ,count(decode(mod(substr(ssn, -7, 1),2),1, '남자사원수')) "남자사원수"
      ,count(decode(mod(substr(ssn, -7, 1),2),0, '여자사원수')) "여자사원수"
from insa;
--------------------------
--[중요]
--count(decode(mod(substr(ssn, -7, 1),2),1, '남자사원수')) "남자사원수" 가 31로 나오는 이유
--count 함수는 null인 값을 빼고 counting 한다.
--count(*) null을 포함한 counting.
--COUNT(*)를 제외한 모든 그룹함수는 NULL을 무시하기 때문에 NVL 함수를 이용하여 NULL값을 다른 값으로 치한시켜 주어야 한다.
select count(comm), count(sal), count(mgr), count(*)  
from emp;

select sum(comm) , count(comm)
     , sum(comm)/count(comm) 
     , sum(comm)/count(*) -- sum(comm)는 null은 제외한 것들의 총 합.
     , avg(comm) -- avg() null은 제외한 평균을 낸다.
from emp;

select decode(mod(substr(ssn, -7, 1),2), 1, 'O', 'X')
--select decode(mod(substr(ssn, -7, 1),2), 1, 'O') 'X'를 빼면 여자는 NULL이 찍힌다. 'O'는 NULL만 만들지 않겠다는 의도로 사용한다.
select count (decode(mod(substr(ssn, -7, 1),2), 1, 'O')) -- COUNT가 NULL을 빼고 COUNTING 하기 때문에 31이 출력된다.
from insa;
-----------------------------------------------------
union set 연산자 사용 풀이
select '전체사원수', count(*)
from insa
union
select '남자사원수', count(*)
from insa
where mod(substr(ssn, -7, 1),2) = 1
union
select '여자사원수', count(*)
from insa
where mod(substr(ssn, -7, 1),2) = 0;
-----------------------------------------------------
--[추가 풀이] EMP 테이블의 각 부서별 사원수 + 총 인원이 나오게 출력
--ORA-01789: query block has incorrect number of result columns
--결과 열의 수가 잘못 되었다는 오류
--union 사용할 때 주의할 점 : 열의 수를 맞춘다

select deptno, count(*)
from emp
group by deptno
union
select null, count(*)
from emp
order by deptno;
--------------------------
--[문제 제시] 사원이 존재하지 않는 40번 부서는 0으로 출력 자체가 되지 않는데
-- 아래처럼 출력하기를 원하면 어떻게?
10	3
20	3
30	6
40  0
	12
    
--ORA-00937: not a single-group group function
select
    count(*)
    , COUNT (decode(deptno, 10, 'O') )"10번 사원수"
    , COUNT (decode(deptno, 20, 'O') )"20번 사원수"
    , COUNT (decode(deptno, 30, 'O') )"30번 사원수"
    , COUNT (decode(deptno, 40, 'O') )"40번 사원수" 
from emp;

-- 피봇(pivot) 기능 : [1]처럼 세로로 출력 된 것을 [2]처럼 가로로 바꾸는 것
--[1]
20
30
30
20
30
30
10
10
30
30
20
--
--[2]
  COUNT(*)    10번 사원수    20번 사원수    30번 사원수    40번 사원수
---------- ---------- ---------- ---------- ----------
        12          3          3          6          0
-----------------------------------------------------
-- 2. insa 테이블에서 각 부서별 급여를 가장 많이 받는 사원의 pay를 출력
-- 1) UNION ALL 사용해서 풀기

select name, basicpay + sudang
from insa
where buseo = '총무부' 
and basicpay + sudang >= all(select basicpay + sudang
                          from insa 
                          where buseo = '총무부');
                          
and basicpay + sudang >= (select max(basicpay + sudang) 
                          from insa 
                          where buseo = '총무부');
union
:
:
-----------------------------------------------------
-- 2) GROUP BY  사용해서 풀기
--ORA-00979: not a GROUP BY expression
--basicpay + sudang 에 max 집계함수 안써서 오류
select buseo, max(basicpay + sudang)
from insa
group by buseo;
-----------------------------------------------------
-- 3) 상관 서브쿼리 사용해서 풀기
select buseo, basicpay + sudang
from insa
where basicpay + sudang = 그 해당부서 최고 급여액;
---------------
select buseo, basicpay + sudang
from insa m
where basicpay + sudang = (select max(basicpay + sudang)
                           from insa 
                           where buseo = m.buseo);
-----------------------------------------------------
--3. 이번 달이  몇 일까지 있는 지 출력하세요. 
-- 해당 날짜의 마지막 날짜를 가져오는 함수 : last_day()
-- 마지막 날짜(일) : to_char() 날짜 -> 년,월,[일],시간,분,초 문자형태로 반환
--                 extract() 숫자 형태로 반환
select sysdate
      , last_day(sysdate)
      , to_char(last_day(sysdate), 'dd')
      , to_extract(day from last_day(sysdate)) -- 오류남
from dual;
-----------------------------------------------------
-- 4. 다음 주 월요일은 휴강일이다.. 몇 일인가요 ? 
select sysdate
       , next_day(sysdate, '월요일')
from dual;
-----------------------------------------------------
--5. emp 테이블에서 각 사원들의 입사일자를 기준으로 10년 5개월 20일째 되는 날 ? 

select ename, hiredate
     , hiredate + 20
     , add_months(hiredate, 10*12 +5) + 20 -- 10년 5개월 20일째
from emp;

날짜 - 날짜 = 일수
날짜 + 숫자 = 날짜
날짜 - 숫자 = 날짜
날짜 + 시간 = 날짜
      숫자/24
-----------------------------------------------------
--6.  insa테이블에서 1001, 1002 사원의 입사일자 월/일 만 오늘 날짜로 수정하는 쿼리를 작성   
--1001번 1002번 입사일자 확인
select num, name, ibsadate
from insa
where num in ( 1001, 1002 );
--
select num, name
     , ibsadate
     , to_char (ibsadate, 'yy')
     , substr (ibsadate, 1, 2)
from insa
where num in ( 1001, 1002 );
-- to_char() , extract() 둘 중 하나 사용
select sysdate
      , to_char (sysdate, 'mm') 월 --월 --'08'
      , to_char (sysdate, 'dd') 일 --일 --'30'
from dual;
-- 날짜 수정하는 쿼리
update insa  
set ibsadate =  '98/08/30'
where num in ( 1001, 1002 );
commit;
--
update insa  
set ibsadate =  to_char (ibsadate, 'yy') || '/' || to_char (sysdate, 'mm') || '/' ||to_char (sysdate, 'dd') --'98/08/30'
where num in ( 1001, 1002 );
--2개 행 이(가) 업데이트되었습니다.
commit;
--커밋 완료.
-----------------------------------------------------
--[생년월일 수정하기]
update insa  
set ssn = substr(ssn,0,2) || to_char(sysdate, 'mmdd')||substr(ssn,7)
where num in ( 1001, 1002 );
--2개 행 이(가) 업데이트되었습니다.
commit;
--커밋 완료.


-----------------------------------------------------
--6-2.  insa테이블에서 오늘('2023.08.30')을 기준으로 아래와 같이 출력하는 쿼리 작성.  
-- 오늘 날짜 월일 0830 - 생일월일  =  양수(생일 지남) or 0(오늘 생일) or 음수(생일 전)
select num, name, ssn
--      ,to_char (sysdate, 'mmdd') t_md
--      ,substr(ssn,3,4) b_md
--      ,to_char (sysdate, 'mmdd') - substr(ssn,3,4)
      ,sign(to_char (sysdate, 'mmdd') - substr(ssn,3,4)) s
      ,decode ( sign(to_char (sysdate, 'mmdd') - substr(ssn,3,4))
                , -1 , '생일 전' , 1 , '생일 후', '오늘 생일') d
from insa;

-- sign()의 결과가 -1이면 생일 지나지 않은 것, 0이면 오늘 생일, 1이면 생일 지난 것
-----------------------------------------------------
-- 6-3. insa테이블에서 오늘('2023.08.30')기준으로 이 날이 생일인 사원수,지난 사원수, 안 지난 사원수를 출력하는 쿼리 작성. 

with temp as (
      select  num, name, ssn
             ,sign(to_char (sysdate, 'mmdd') - substr(ssn,3,4)) s      
      from insa
)
select  count (decode (s, -1, 'O')) "생일 전 사원 수"
       ,count (decode (s, 1, 'O')) "생일 후 사원 수"
       ,count (decode (s, 0, 'O')) "오늘 생일 사원 수"
       ,count(*)
from temp;
-----------------------------------------------------
--9. 본인의 생일로부터 오늘까지 살아온 일수, 개월수, 년수를 출력하세요.
--'1994.03.14'
select ceil(abs(sysdate - to_date('1994.03.14'))) -- 살아온 일 수
      ,round (months_between(sysdate, to_date('1994.03.14')),2) -- 살아온 개월 수
      ,round (months_between(sysdate, to_date('1994.03.14'))/12,2) -- 살아온 년수
from dual;
-----------------------------------------------------
-- 10. IW와 WW 의 차이점. (기억해두기)
-- 월의 주차 : w
select sysdate
      , to_char(sysdate, 'w')
from dual;
-- 년의 주차 : ww, iw
ww : 7일마다 다음 주차로 넘어간다
iw : 일요일에서 월요일로 넘어가면 다음 주차로 넘어간다.


select to_char(to_date('2022.1.1'), 'iw') --52주차
      ,to_char(to_date('2022.1.1'), 'ww') -- 1주차
      ,to_char(to_date('2022.1.2'), 'iw') --52주차
      ,to_char(to_date('2022.1.2'), 'ww') -- 1주차
      ,to_char(to_date('2022.1.3'), 'iw') -- 1주차
      ,to_char(to_date('2022.1.3'), 'ww') -- 1주차
      ,to_char(to_date('2022.1.8'), 'iw') -- 1주차
      ,to_char(to_date('2022.1.8'), 'ww') -- 2주차
from dual;
-----------------------------------------------------
--11-1. 이번 달이 몇 일까지 있는 확인.
select sysdate
      ,last_day(sysdate)
      ,to_char(last_day(sysdate), 'dd') --31
      ,add_months(sysdate, 1) 
      ,trunc(add_months(sysdate, 1) , 'year') --2023/01/01
      ,trunc(add_months(sysdate, 1) , 'month') --2023/09/01
      ,trunc(add_months(sysdate, 1) , 'mm')-1 --2023/09/01
from dual;
-----------------------------------------------------
-- [참고]
-- ORA-01861: literal does not match format string : 문자 포맷 형식이 일치하는 것이 없다.
select to_date('2022', 'yyyy') --22/08/01
      ,to_date('2022.02', 'yyyy.mm') --22/02/01
      ,to_date('03', 'mm') --23/03/01
from dual;
-----------------------------------------------------
-- 11-2. 오늘이 년중 몇 째 주, 월중 몇 째주인지 확인.
select sysdate
,to_char(sysdate, 'w')
,to_char(sysdate, 'iw')
,to_char(sysdate, 'ww')
from dual;
-----------------------------------------------------
-- 12. emp 에서  pay 를 NVL(), NVL2(), COALESCE()함수를 사용해서 출력하세요.
select ename
      ,sal + nvl(comm, 0) pay
      ,sal + nvl2(comm,comm,0) pay
      ,coalesce(sal + comm, sal, 0) pay
from emp;
-----------------------------------------------------
--12-2. emp테이블에서 mgr이 null 인 경우 -1 로 출력하는 쿼리 작성
      ㄱ. nvl()
      ㄴ. nvl2()
      ㄷ. COALESCE()
select ename
      , nvl(comm, -1) pay
      , nvl2(comm,comm,-1) pay
      ,coalesce(mgr, -1) pay
from emp;
-----------------------------------------------------
--13. insa 에서  이름,주민번호, 성별( 남자/여자 ), 성별( 남자/여자 ) 출력 쿼리 작성
    ㄱ. DECODE()
    ㄴ. CASE()
    select name, ssn
          ,decode(mod(substr(ssn, -7,1),2),1,'남자','여자') 성별
          -- case()형식
--          ,case 컬럼명 또는 표현식
--                when 조건 then 값
--                when 조건 then 값
--                :
--                :
--                else 값
--        [case 형식 첫번째]
          ,case mod(substr(ssn, -7,1),2)
                 when 1 then '남자'
                 --when 0 then '여자'
                 else        '여자'
           end gender
--        [case 형식 두번째]           
         ,case 
                 when mod(substr(ssn, -7,1),2) = 1 then '남자'
                 else '여자'
          end gender
    from insa;
--decode() 의 확장된 함수가 case() 함수이다.
-----------------------------------------------------
--6-2. case() 사용 
--insa테이블에서 오늘('2023.08.30')을 기준으로 아래와 같이 출력하는 쿼리 작성.  
--오늘 날짜 월일 0830 - 생일월일  =  양수(생일 지남) or 0(오늘 생일) or 음수(생일 전)

select num, name, ssn
      ,to_char (sysdate, 'mmdd') - substr(ssn,3,4)
      ,case
            when (to_char (sysdate, 'mmdd') - substr(ssn,3,4)) > 0 then '생일 후'
            when (to_char (sysdate, 'mmdd') - substr(ssn,3,4)) < 0 then '생일 전'
            else '오늘 생일'
       end 
from insa;
-----------------------------------------------------
--14. emp 에서 평균PAY 보다 같거나 큰 사원들만의 급여합을 출력.
--전체 사원들의 총 급여의 합 : 27,125
select to_char (sum (sal + nvl(comm, 0)), 'L999,999') sum_pay
from emp;

--평균 급여(PAY) :2260.42
select to_char(avg (sal + nvl(comm, 0)), '9999.00' ) avg_pay
from emp;

--decode() 사용

with a as (
    select to_char(avg (sal + nvl(comm, 0)), '9999.00' ) avg_pay
    from emp
),
b as (
    select empno, ename, sal + nvl(comm, 0) pay
    from emp
)
select *
from b , a -- join 하겠다는 뜻
where b.pay >= a.avg_pay ; -- ORA-00904: "A"."AVG_PAY": invalid identifier : join 안해서 인식하지 못함
-----------------------------------------------------
--14. emp 에서 평균PAY 보다 같거나 큰 사원들만의 급여합을 출력.
--전체 사원들의 급여 : 18925
select sum(t.pay)
from(
select empno, ename, sal + nvl(comm, 0) pay
from emp
where sal + nvl(comm, 0) >= (select avg (sal + nvl(comm, 0)) avg_pay
                             from emp
                             )
) t;
-----------------------------------------------------
--14. emp 에서 평균PAY 보다 같거나 큰 사원들만의 급여합을 출력. --18925
--decode() 사용

-- ORA-00937: not a single-group group function
with temp as (
select empno, ename
      , sal + nvl(comm, 0) pay
      , (select avg(sal + nvl(comm, 0)) from emp) avg_pay
from emp
)
select sum (decode (sign(t.pay - t.avg_pay), -1 ,null, t.pay ))
from temp  t;
-----------------------------------------------------
--case() 사용
with temp as (
select empno, ename
      , sal + nvl(comm, 0) pay
      , (select avg(sal + nvl(comm, 0)) from emp) avg_pay
from emp
)
select sum (decode (sign(t.pay - t.avg_pay), -1 ,null, t.pay ))
      ,sum (
          case 
                when t.pay - t.avg_pay >= 0 then t.pay 
                else                              NULL
          end
           )
from temp  t;
-----------------------------------------------------
--15. emp 에서  사원이 존재하는 부서의 부서번호만 출력

--사원이 존재하는 부서의 부서번호 조회. 
select *
FROM dept;
--[결과]
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON

-- 모든 사원은 반드시 1개의 부서의 소속이다.
select deptno
from emp;

-- 신입 사원이 부서발령 전에는 소속된 부서가 없을 수도 있다.
-- 7839 king을 신입사원으로 수정
update emp
set deptno = null
where empno = 7839;

select distinct deptno
from emp
order by deptno;

rollback;
-----------------------------------------------------
--15-2. emp 에서  사원이 존재하지 않는  부서의 부서번호만 출력
--10,20,30,[40]
select deptno
from dept
minus 
select distinct deptno
from emp;
-----------------------------------------------------
--조인(JOIN)--
--예) emp 테이블에서 부서번호, 부서명, 사원번호, 사원명, 입사일자 조회 

--ORA-00904: "DNAME": invalid identifier
select deptno, dname, empno, ename, hiredate -- dname 을 추가해서 출력하고 싶을때.
from emp;

desc emp; --emp 테이블에 dname 칼럼이 존재하지 않는다.

desc dept;-- dept테이블에 dname 칼럼 존재.

-- [의문점] 애초에 테이블 생성할때 
-- emp테이블에 empno, ename, job, hiredate,... , deptno, dname,loc 로 만들었으면 됐는데 왜 쪼갰을까

-- [RDBMS] 
-- [사원]    <----   소속관계   ---->     [부서]


-- 이상현상 제거를 '정규화' 라고 한다. (논리적 모델링)
-- 데이터베이스 모델링할때 이상현상 때문에 테이블을 쪼갰다.

-- 고유키(사원번호)     dname과 loc는 고유키에 의존하지 않고 부서번호(deptno)에 의존함(정규화에 위배됨) -- 그래서 dept로 잘라내 아래처럼 dept 연결
                                                                                            dept   영업부  부산
                                                                                             10           부산
                                                                                             10           부산                                                                                            
                                                                                             10           부산                                                                                            
                                                                                             
--                   참조키(dept 고유키pk를 참조한다.)
-- empno  ename  ... deptno, dname, loc
1                     10     영업부  서울  -- 영업부의 지역이 다른지역(대구, 등등)로 바뀌어 수정할때 안바뀌는 것들이 있는 이상현상이 있음 
2                     10     영업부  서울
3                     10     영업부  서울
4                     10     영업부  서울
5                     10     영업부  서울
6
7
8
:
:
사원 수천명으로 가정

-----------------------------------------------------
-- 1) join 할때 처음에 테이블이 관계가 맺어져 있는 것을 확인해야 함.
select
from emp, dept -- 두 테이블 join
where 조인 조건절; --두 테이블이 어떤 조건으로 join
-----------------------------------------------------
--2)
-- ORA-00918: column ambiguously defined : 컬럼이 모호하게 선언되었다.
select deptno, dname, empno, ename, hiredate --deptno는 emp에도 있고 dept에도 있어서 누구껀지 스키마를 주어야함.
from emp, dept
where dept.deptno = emp.deptno;
-----------------------------------------------------
--3)
select dept.deptno, dname, empno, ename, hiredate --dept.deptno(d.deptno)는 emp.deptno로 해도 된다.
from emp e, dept d  -- e, d alias
where d.deptno = e.deptno;
-----------------------------------------------------
-- 3)을 JOIN ON 구문으로 수정함.
select d.deptno, dname, empno, ename, hiredate
from emp e join dept d
ON d.deptno = e.deptno;
-----------------------------------------------------
--emp 테이블에서 model 클릭해서 관계 확인
--15-2. emp 에서  사원이 존재하지 않는  부서의 부서번호만 출력
--join 사용해서 다시 풀이
select d.deptno --join의 의미가 없음 emp로도 조회가 가능해서
from dept d join emp e ON d.deptno = e.deptno;
-----------------------------------------------------
select d.deptno , count(*)
from dept d join emp e ON d.deptno = e.deptno
group by d.deptno;
----------------- inner 추가
select d.deptno , count(*)
from dept d inner join emp e ON d.deptno = e.deptno
group by d.deptno;
-----------------------------------------------------
select deptno, count(*)
from emp
group by deptno;
[결과]
30	6
20	3
10	3

[원하는 결과] -- 40을 조회하고 싶음
40  0
30	6
20	3
10	3

select d.deptno , count(*)
from dept d left outer join emp e ON d.deptno = e.deptno
group by d.deptno;
[결과]
10	3
20	3
30	6
40	1 ...? --count(*)에 의해서 null값도 1로 counting 되었다.
-----------------------------------------------------count 수정
select d.deptno , count(e.empno)
from dept d left outer join emp e ON d.deptno = e.deptno
group by d.deptno
order by d.deptno;
-----------------------------------------------------
--0인 것  찾기
select d.deptno , count(e.empno)
from dept d left outer join emp e ON d.deptno = e.deptno
-- where count(e.empno)=0 순서상 쓸수없음
group by d.deptno
HAVING count(e.empno) = 0 --GROUP BY를 하고 난 후의 조건절.
order by d.deptno;
----------------------------------------------------- dname 추가 하려면 group by로!
-- 여기 자체 암기하기 -시험...
select d.deptno , dname -- , count(e.empno)
from dept d left outer join emp e ON d.deptno = e.deptno
-- where count(e.empno)=0 순서상 쓸수없음
group by d.deptno, dname
HAVING count(e.empno) = 0 --GROUP BY절의 조건절.(group by의 결과물에 대한 조건절)
order by d.deptno;
-----------------------------------------------------
--ORA-00979: not a GROUP BY expression
select buseo, jikwi, count(*) -- name x 집계함수를 제외한 일반 함수는 반드시 group by절에 있어야 한다.
from insa
group by buseo --, jikwi
order by buseo, jikwi;
-----------------------------------------------------
-- 16. 아래 코딩을  DECODE()를 사용해서 표현하세요.
    ㄱ. [자바]
        if( A == B ){
           return X;
        }
    
    decode(a,b,x)
    
    ㄴ. [자바]
        if( A==B){
           return S;
        }else if( A == C){
           return T;
        }else{
           return U;
        }
    
    decode(a,b,s,c,t,u)
      
    
    ㄷ.  [자바]
        if( A==B){
           return XXX;
        }else{
           return YYY;
        }
        
        decode(a,b,xxx,yyy)
-----------------------------------------------------
-- 17. emp 테이블에서 10번 부서원들은  급여 15% 인상
--                20번 부서원들은 급여 10% 인상
--                30번 부서원들은 급여 5% 인상
--                40번 부서원들은 급여 20% 인상
--  하는 쿼리 작성. 

select deptno, ename, sal + nvl(comm, 0)
      ,decode(deptno, 10, 15, 20, 10, 30, 5, 40, 20) || '%' "인상률"
      --,-- decode
      ,(sal + nvl(comm, 0)) * ( decode ( deptno, 10, 0.15, 20, 0.1, 30, 0.05, 40, 0.2 )) "인상액"
      --,-- case
      ,(sal + nvl(comm, 0)) * (case deptno
                                when  10 then 0.15 
                                when  20 then 0.1
                                when  30 then 0.05
                                when  40 then 0.2
                                --else           
                                end) "인상액"
from emp;
-----------------------------------------------------
--18. emp 테이블에서 각 부서의 사원수를 조회하는 쿼리
--( 힌트 :  DECODE, COUNT 함수 사용 )  

select count(decode(deptno,10,0)) "10번 부서"
     , count(decode(deptno,20,0)) "20번 부서"
     , count(decode(deptno,30,0)) "30번 부서"
     , count(*) "총 사원수"
from emp;
--------------------------------------------------------------------------------
    select deptno, count(deptno)
    from emp
    group by deptno
    order by deptno;
--------------------------------------------------------------------------------
    select 
    from (select deptno 
          from emp 
          where deptno = 10)e;
    
