-- 1. emp 테이블에서 sal가 상위 20% 사원 정보 조회.
-- 순위함수 사용
---------------------------
select count(*)--총사원수 12
from emp;
---------------------------
select 12*20/100 --20% 인원수
from dual;
---------------------------
select t.*
from(
select deptno, ename, sal
     , rank() over( order by sal desc) sal_rank
from emp
) t
where sal_rank <= (select count(*) from emp) * 20/100;
--------------------------------------------------------------------------------
--2. emp 에서 각 사원의 급여가 전체급여의 몇 %가 되는 지 조회.
       ( % 소수점 3자리에서 반올림하세요 )
           무조건 소수점 2자리까지는 출력.. 7.00%,  3.50%     
           
ENAME             PAY   TOTALPAY 비율     
---------- ---------- ---------- -------
SMITH             800      27125   2.95%
ALLEN            1900      27125   7.00%
WARD             1750      27125   6.45%
JONES            2975      27125  10.97%
MARTIN           2650      27125   9.77%
BLAKE            2850      27125  10.51%
CLARK            2450      27125   9.03%
KING             5000      27125  18.43%
TURNER           1500      27125   5.53%
JAMES             950      27125   3.50%
FORD             3000      27125  11.06%
MILLER           1300      27125   4.79%
;
-- 총 급여합
select sum(sal + nvl(comm,0))
from emp;
-----------------------------------
select ename, sal + nvl(comm,0) pay 
      ,round( (sal + nvl(comm,0))/(select sum(sal + nvl(comm,0))from emp)*100, 2) || '%' "TOTALPAY 비율"
from emp;

-----------------------------------
SELECT T.*, TO_CHAR ( ROUND(PAY/TOTALPAY*100,2), '999.00') || '%' 비율
FROM(
select ename, sal + nvl(comm,0) pay 
      ,(select sum(sal + nvl(comm,0))from emp) "TOTALPAY"
from emp
)T;
--------------------------------------------------------------------------------
-- 3. insa 에서 사원들의 만나이 계산해서 출력
-- ( 만나이 = 올해년도 - 출생년도          - 1( 생일이지나지 않으면) )

올해년도 SYSDATE TO_CHAR()
출생년도 성별 SUBSTR(ssn,-7,1) CASE 1,2 END 1900, 1800, 2000
        + 년도 SUBSTR(ssn,0,2)
세는나이 = 올해년도 - 출생년도 + 1
만나이 = 올해년도 - 출생년도 -1 .. 생일여부에 따라서

주민등록번호 TO_DATE(SUBSTR(SSN,3,4),'MMDD') '23/04/23'
오늘날짜                               TRUNC('23/09/01')
SIGN(양수, 0 , 음수) 1 0 -1 ..
--------------------------------------------------------------------------------
4. insa 테이블에서 아래와 같이 결과가 나오게
 [총사원수]  [남자사원수] [여자사원수] [남사원들의 총급여합][여사원들의 총급여합][남자-max(급여)] [여자-max(급여)]
---------- ---------- ---------- ---------- ---------- ---------- ----------
     60         31         29      51961200             41430400         2650000          2550000

select 성별 집계함수
from insa
group by 성별;
--------------
select decode ( mod(substr(ssn,-7,1),2),1,'남자',0,'여자','전체') || '사원수', count(*) 
from insa
group by rollup(mod(substr(ssn,-7,1),2))
union   ------------------------------------------------------------------------
select decode ( mod(substr(ssn,-7,1),2),1,'남자',0,'여자','전체') || '급여합', sum(basicpay) 
from insa
group by cube(mod(substr(ssn,-7,1),2));
---------------------------------------
select count(*) --총사원수
      ,count(decode(mod(substr(ssn,-7,1),2),1,0)) "남자사원수"
      ,count(decode(mod(substr(ssn,-7,1),2),0,0)) "여자사원수"
      ,sum(decode(mod(substr(ssn,-7,1),2),1,basicpay+sudang)) "남자총급여합"
      ,sum(decode(mod(substr(ssn,-7,1),2),0,basicpay+sudang)) "여자총급여합"
      ,max(decode(mod(substr(ssn,-7,1),2),1,basicpay+sudang)) "남자최고급여"
      ,max(decode(mod(substr(ssn,-7,1),2),0,basicpay+sudang)) "여자최고급여"
from insa;
--------------------------------------------------------------------------------
-- 5. 순위(RANK) 함수 사용해서 풀기 
   emp 에서 각 부서별 최고급여를 받는 사원의 정보 출력
   
    DEPTNO ENAME             PAY DEPTNO_RANK
---------- ---------- ---------- -----------
        10 KING             5000           1
        20 FORD             3000           1
        30 BLAKE            2850           1
        
        
-- 첫번째 방법:순위함수X)
-- ORA-00979: not a GROUP BY expression : GROUP BY 에 집계 함수 외에 X
select deptno, ename, MAX(sal + nvl(comm,0)) MAX_pay --ENAME 삭제
from emp
GROUP BY deptno;
----------------
select deptno, MAX(sal + nvl(comm,0)) MAX_pay
from emp
GROUP BY deptno;
----------------
--JOIN
select e.deptno, e.ename, (e.sal + nvl(comm,0)) pay -- ,t.deptno, t.max_pay
FROM(
    select deptno, MAX(sal + nvl(comm,0)) MAX_pay
    from emp
    GROUP BY deptno
)t, emp e
where t.deptno = e.deptno --join 조건
      AND e.sal + nvl(comm,0) = t.max_pay;

--두번째 방법:순위함수O) - 부서별로
select t.deptno, t.ename, t.pay, t.pay_deptno_rank AS deptno_rank
from(
select deptno, ename, sal + nvl(comm,0) pay
      , rank() over(order by sal + nvl(comm,0) desc) pay_rank
      , rank() over(partition by deptno order by sal + nvl(comm,0) desc) pay_deptno_rank
from emp 
order by deptno
)t
where pay_deptno_rank = 1; 
--------------------------------------------------------------------------------
-- 6. emp테이블에서 각 부서의 사원수, 부서총급여합, 부서평균을 아래와 같이 출력하는 쿼리 작성.
결과)
    DEPTNO       부서원수       총급여합    	     평균
---------- ---------- 		---------- 	----------
        10          3      	 8750    	2916.67
        20          3     	  6775    	2258.33
        30          6     	 11600    	1933.33   

select deptno
     , count(*) "부서원수"
     , sum(sal) "총급여합"
     , round(avg(sal),2) "평균급여"
from emp
group by deptno
order by deptno;
--------------------------------------------------------------------------------
--7.  insa 테이블에서 
[실행결과]
                                           부서사원수/전체사원수 == 부/전 비율
                                           부서의 해당성별사원수/전체사원수 == 부성/전%
                                           부서의 해당성별사원수/부서사원수 == 성/부%
                                           
부서명     총사원수 부서사원수 성별  성별사원수  부/전%   부성/전%   성/부%
개발부	    60	    14	      F	    8	    23.3%	  13.3%	    57.1%
개발부	    60	    14	      M	    6	    23.3%	  10%	    42.9%
기획부	    60	    7	      F	    3	    11.7%	    5%	    42.9%
기획부	    60	    7	      M	    4	    11.7%	6.7%	    57.1%
영업부	    60	    16	      F	    8	    26.7%	13.3%	    50%
영업부	    60	    16	      M	    8	    26.7%	13.3%	    50%
인사부	    60	    4	      M	    4	    6.7%	6.7%	    100%
자재부	    60	    6	      F	    4	    10%	    6.7%	    66.7%
자재부	    60	    6	      M	    2	    10%	    3.3%	    33.3%
총무부	    60	    7	      F	    3	    11.7%	5%	        42.9%
총무부	    60	    7	      M 	4	    11.7%	6.7%	    57.1%
홍보부	    60	    6	      F	    3	    10%	    5%	        50%
홍보부	    60	    6	      M	    3	    10%	    5%	        50%    

SELECT 
     temp.*
    ,round(부서사원수/총사원수*100,1) || '%' "부/전%"
    ,round(성별사원수/총사원수*100,1) || '%' "부성/전%"
    ,round(성별사원수/부서사원수*100,1) || '%' "성/부%"
FROM(
    SELECT buseo "부서명"
         , (SELECT COUNT(*) FROM INSA) "총사원수"
         , (SELECT COUNT(*) FROM INSA WHERE buseo = t.buseo) "부서사원수" -------------★★★★
         , gender "성별" -- GROUP BY절에 넣어주기
         , COUNT(*) "성별사원수" -- 각 부서별 성별 사원수
    FROM(
         select buseo, name, ssn
        ,decode(mod(substr(ssn,-7,1),2),1,'M','F') gender
         from insa
    ) t
    group by buseo, gender
    order by buseo, gender

) temp;
--------------------------------------------------------------------------------
--8. PATITION  OUTER JOIN 문제 ( 부서에서 사원이 없는 출신지역도 출력 ~ ) -------------★★★★
--  insa테이블에서 각 부서별 출신지역별 인원수 출력

개발부	강원	1
개발부	경기	3
개발부	경남	1
개발부	경북	1
개발부	부산	1
개발부	서울	2
개발부	인천	6
개발부	전남	1
개발부	전북	1
개발부	제주	1
개발부	충남	1

기획부	강원	1
기획부	경기	2
기획부	경남	1
기획부	경북	1
기획부	부산	1
기획부	서울	3
기획부	인천	1
기획부	전남	1
기획부	전북	1
기획부	제주	1
기획부	충남	1
영업부	강원	1 
 :
-- 각 부서별 사원수
select buseo, count(*)
from insa
group by buseo;
---------------------------
select buseo, city, count(*)
from insa
group by buseo, city  --city 추가
order by buseo, city; --city 추가


select distinct city
from insa;

--[문제] emp 테이블에서 job별 사원수 조회.
select deptno, job, count(*)
from emp
group by deptno, job
order by deptno, job;
-----------------------------
select deptno, j.job, count(empno)
from emp e partition by (deptno) right outer join (select distinct job from emp) job j on j.job=e.job -- right 오른쪽 칼럼은 값이 있거나 없거나 출력되게
group by deptno, j.job
order by deptno, j.job;
--------------------------------------------------------------------------------
--9-1.  COUNT(), DECODE() 사용.
  [실행결과]
       CLERK   SALESMAN  PRESIDENT    MANAGER    ANALYST
---------- ---------- ---------- ---------- ----------
         3          4          1          3          1
select 
     count (decode (job, 'CLERK', 0)) CLERK
    ,count (decode (job, 'SALESMAN', 0)) SALESMAN
    ,count (decode (job, 'PRESIDENT', 0)) PRESIDENT
    ,count (decode (job, 'MANAGER', 0)) MANAGER
    ,count (decode (job, 'ANALYST', 0)) ANALYST   
from emp;
--------------------------------------------------------------------------------
-- 9-2.  PIVOT() 사용.
  [실행결과]
       CLERK   SALESMAN  PRESIDENT    MANAGER    ANALYST
---------- ---------- ---------- ---------- ----------
         3          4          1          3          1

-- 피봇 대상 쿼리
select job
from emp;

--
select *
from (
    select job
    from emp
    )
pivot( count(job) for job in ('CLERK','SALESMAN','PRESIDENT','MANAGER','ANALYST'
));
--------------------------------------------------------------------------------
--10. emp 테이블에서 각 JOB별 입사년도별 1월~ 12월 입사인원수 출력.  ( PIVOT() 함수 사용 ) 
    [실행결과]
    ANALYST		1981	0	0	0	0	0	0	0	0	0	0	0	1
    CLERK		1980	0	0	0	0	0	0	0	0	0	0	0	1
    CLERK		1981	0	0	0	0	0	0	0	0	0	0	0	1
    CLERK		1982	1	0	0	0	0	0	0	0	0	0	0	0
    MANAGER		1981	0	0	0	1	1	1	0	0	0	0	0	0
    PRESIDENT	1981	0	0	0	0	0	0	0	0	0	0	1	0
    SALESMAN	1981	0	2	0	0	0	0	0	0   0	0	0	0	              

select *
from (
     SELECT job, 
       , to_char(hiredate,'yyyy') h_year
       , extract(month from hiredate) h_month
       ,
       
    FROM EMP
)
pivot (count(*) for h_month in(1,2,3,4,5,6,7,8,9,10,11,12));
--------------------------------------------------------------------------------
-- 11. SMS 인증번호  임의의  6자리 숫자 출력 ( dbms_random  패키지 사용 )

-- sys.dbms_random() 오라클 패키지 != 자바 패키지
-- PL/SQL 5가지 종류 중에 하나.
select   trunc(sys.dbms_random.value(100000, 1000000))
       , sys.dbms_random.string('L',5)
from dual;
--------------------------------------------------------------------------------
-- 12. 아래와 같이 출력하세요 .  ( LISTAGG 함수 사용 ) 
[실행결과]
10	CLARK/MILLER/KING
20	FORD/JONES/SMITH
30	ALLEN/BLAKE/JAMES/MARTIN/TURNER/WARD
40  사원없음

SELECT deptno, ename
FROM emp
order by deptno;

--LISTAGG( 컬럼명, 구분자 ) 
select deptno
    --,LISTAGG(컬럼명, 구분자) CLARK/MILLER/KING
    --,LISTAGG(ename, '/') --ORA-02000: missing WITHIN keyword
    --,LISTAGG(ename, '/') WITHIN --ORA-00952: missing GROUP keyword
      ,LISTAGG(ename, '/') WITHIN group (order by ename asc)
FROM emp
group by deptno;

[결과]
10	CLARK/KING/MILLER
20	FORD/JONES/SMITH
30	ALLEN/BLAKE/JAMES/MARTIN/TURNER/WARD

select d.deptno
      ,nvl( LISTAGG(ename, '/') WITHIN group (order by ename asc), '사원없음')
FROM emp e right outer join dept d on d.deptno = e.deptno
group by d.deptno;
--------------------------------------------------------------------------------
-- 13.  emp 테이블에서 30번인 부서의 최고, 최저 SAL을 출력하는 쿼리 작성.
-- 사원들 중에 최고, 최저 급여 sal
select max(sal), min(sal)
from emp;

-- 30번 부서원들 중에 max, min sal
select max(sal), min(sal)
from emp
where deptno = 30;
--------------------------------------------------------------------------------
--13-2. emp 테이블에서 30번인 부서의 최고, 최저 SAL를 받는 사원의 정보 출력하는 쿼리 작성.
(deptno, ename, hiredate, sal);

select 
       max (sal)
     , min (sal)
from emp
where deptno = 30;
-------------------
select deptno
     , max (sal)
     , min (sal)
from emp
group by deptno
having deptno = 30;
-------------------
-- 사원 찾기
select deptno, ename, hiredate, sal
from emp
--where deptno = 30 AND sal in(max (sal), min (sal));
--where deptno = 30 AND sal in(select max (sal), min (sal) from emp where deptno = 30); --ORA-00913: too many values
where deptno = 30 AND sal = (select max (sal) from emp where deptno = 30)
 or sal = (select min (sal) from emp where deptno = 30);

-- IN을 사용하려면
select deptno, ename, hiredate, sal
from emp
where deptno = 30 AND sal IN ( (select max (sal) from emp where deptno = 30),
                               (select min (sal) from emp where deptno = 30)
                              );

--UNION 사용
select deptno, ename, hiredate, sal , '최고급여자'
from emp
where deptno = 30 
    AND sal = (select max (sal) from emp where deptno = 30)

UNION ALL

select deptno, ename, hiredate, sal , '최저급여자'
from emp
where deptno = 30 
    AND sal = (select min (sal) from emp where deptno = 30);

--
WITH temp AS (
SELECT MAX(sal) maxsal, MIN(sal) minsal
FROM emp
WHERE deptno = 30
)
select empno, ename, hiredate, sal
from temp t , emp e 
where e.deptno = 30 AND e.sal = t.maxsal OR e.sal = t.minsal;
--where e.deptno = 30 AND e.sal in (t.maxsal , t.minsal);
--------------------------------------------------------------------------------
-- 14. emp 테이블에서 사원수가 가장작은 부서명과 사원수, 가장 많은 부서명과 사원수 출력

select *
from(
select d.deptno, count(e.empno) cnt
       , rank() over( order by count(e.empno) desc ) cnt_rank
from emp e right outer join dept d on e.deptno = d.deptno
group by d.deptno
order by d.deptno
) t 
where t.cnt_rank = 1;
-------------------------------------------
select *
from(
select d.deptno, count(e.empno) cnt
       , rank() over( order by count(e.empno) desc ) cnt_rank
from emp e right outer join dept d on e.deptno = d.deptno
group by d.deptno
order by d.deptno
) t 
where t.cnt_rank in (1, ( select count(*) from dept));
--------------------------------------------------------------------------------
-- 문제점 (최고는 나오는데 최저는 안나옴)
select *
from(
select deptno, count(empno) cnt
       , rank() over( order by count(empno) desc ) cnt_rank
from emp 
group by deptno
order by deptno
) t 
where t.cnt_rank in (1, ( select count(*) from dept));
--------------------------------------------------------------------------------
-- 첫번째)
with temp as (
    select d.deptno, dname, count(empno) cnt
    from emp e, dept d
    where e.deptno(+) = d.deptno
    group by d.deptno, dname 
)
select *
from temp
where cnt in ( (select max(cnt) from temp)
              ,(select min(cnt) from temp) );
-- 두번째)
with a as (
    select d.deptno, dname, count(empno) cnt
    from emp e, dept d
    where e.deptno(+) = d.deptno
    group by d.deptno, dname 
), b AS (
 SELECT MIN(cnt) mincnt, max(cnt) maxcnt --0, 6
 FROM a

)
select a.deptno, a.cnt
from a , b
where a.cnt in ( b.mincnt , b.maxcnt);
where a.cnt = b.mincnt or a.cnt = b.maxcnt;

-- 세번째) 분석 함수 : first, last
--                   ? 집계함수(count, sum, max, min, avg)와 함께 사용되어
--                     주어진 그룹에 대해 내부적으로 순위를 매겨 결과를 산출하는 함수이다.
with a as (
    select d.deptno, dname, count(empno) cnt
    from emp e, dept d
    where e.deptno(+) = d.deptno
    group by d.deptno, dname 
)
select
     min(deptno) keep(dense_rank first order by cnt asc) "deptno" --cnt값을 가지고 순위를 매겨서 첫번째것 deptno를 가져온다
   , min(cnt) 
   , max(deptno) keep(dense_rank last order by cnt asc) "deptno" 
   , max(cnt)
  
from a;
--------------------------------------------------------------------------------
-- [분석함수] ? 테이블에 있는 행에 대해 특정 그룹별로 집계값을 산출할 때 사용하는 함수.
1)ROW_NUMBER()
2)RANK()
3)DENSE_RANK()
4)CUME_DIST() : 주어진 그룹에 대한 상대적인 누적분포도의 값을 반환하는 함수이다.
                분포도값(비율) : 0 < 사이의 값 <= 1
    예) 부서별 급여에 따른 누적된 분포도 값 조회
    
    SELECT deptno, ename, sal
          ,cume_dist() over( partition by deptno order by sal ) dept_dist
    FROM emp;

5)PERCENT_RANK() : 해당 그룹 내의 백분위 순위
                   0 <=   사이의 값 <= 1
                   백분위순위 ? 그룹 안에서 해당 로우(행)의 값보다 [작은 값의 비율] 
                    
    SELECT deptno, ename, sal
          ,percent_rank() over( partition by deptno order by sal ) "percent"
    FROM emp;

-- 
 SELECT deptno, ename, sal
    ,cume_dist() over( partition by deptno order by sal ) dept_dist
    ,percent_rank() over( partition by deptno order by sal ) "percent"
 FROM emp
 where deptno = 30;
 
                    CUME_DIST() 누적분포도 값                             PERCENT_RANK() 백분위순위
30	JAMES	950  	0.1666666666666666666666666666666666666667(1명/6명)	0
30	WARD	1250	0.5(3/6)                                            0.2 (1/5)
30	MARTIN	1250	0.5(3/6)                                            0.2 (1/5)
30	TURNER	1500	0.6666666666666666666666666666666666666667(4/6)     0.6 (3/5)
30	ALLEN	1600	0.8333333333333333333333333333333333333333(5/6)     0.8 (4/5)
30	BLAKE	2850	1 (6/6)                                              1  (5/5)


6) NTILE(expr 3) : 파티션별로 expr에 명시된 만큼 분할한 결과를 반환하는 함수
   분할하는 수를 버킷(bucket)이라고 한다.
   
   select deptno, ename, sal
         ,NTILE(4) OVER(ORDER BY sal) ntiles
   from emp;  
   
   
   select buseo, name, basicpay
         ,NTILE(2) OVER(PARTITION BY buseo ORDER BY basicpay )
   from insa;

7)WIDTH_BUCKET(expr, min_value,max_value,num_buckets)
    NTILE() 함수와 유사한 함수
    차이점 (최소값, 최대값 설정 가능)
    
    예)
    SELECT deptno, ename, sal
    , NTILE(4) OVER(ORDER BY sal ASC) ntiles
    , WIDTH_BUCKET(sal, 0, 5000, 4) widthbuckets
    FROM emp;
    
8)LAG(expr,offset,default_value)
    : 주어진 그룹과 순서에 따라 다른 행에 있는 값을 참조할 때 사용하는 함수
    앞 (선행 행)
  LEAD(expr,offset,default_value)
    : 주어진 그룹과 순서에 따라 다른 행에 있는 값을 참조할 때 사용하는 함수
    뒤 (후행 행)
    
    select ename, hiredate, sal 
          ,LAG( sal, 1, 0 ) OVER(ORDER BY hiredate ) AS prev_sal
          ,LAG( sal, 2, -1) OVER(ORDER BY hiredate ) AS prev_sal
          ,LEAD(sal, 1, -1) OVER(ORDER BY hiredate ) AS next_sal
    from emp
    where deptno = 30;
--------------------------------------------------------------------------------

select '***ADMIN***'
      ,REPLACE('***ADMIN***','*','')
      ,REPLACE('***AD**MIN***','*','') --문제점[가운데 별도 제거됨]
      ,TRIM( '*' FROM '***AD**MIN***') -- 가운데 별은 제거 안됨
      ,TRIM( ' ' FROM '   AD**MIN   ')
from dual;

--------------------------------------------------------------------------------
-- 오라클의 자료형 --
1)CHAR[size[BYTE|CHAR]]
  CHAR == CHAR(1)
  CHAR(10)
  CHAR(10 byte)
  CHAR(10 char)
  기본값 : 1
  size 크기의 고정 길이 문자 데이터
  ( 1 바이트 ~ 2000 바이트 )
  
  이름 문자열 : ename CHAR    'A'  '홍'           Vsize('홍') = 3바이트
              ename CHAR(10) == CHAR(10byte)    홍길동(9바이트)
              ['k']['e']['n'][][][][][][][] 10바이트
              주민등록번호 14자리 우편번호 5,6자리
              전화번호 010-1234-1234 
              와 같이 정해진 틀을 가진 것들에 사용한다.
              ename CHAR (10 CHAR)
              
              DESC emp;
              
              ENAME             VARCHAR2(10) 

create table test (
   aa char -- aa char(1 byte)
 , bb char(3)  --bb char(e byte)
 , cc char(3 char)
);

select *
from tabs;
from user_tables;

drop table test;

desc test;

--DML 데이터 조작
insert into test (aa, bb, cc) values('a','aaaa','aaaa');
-- ORA-12899: 
-- value too large for column "SCOTT"."TEST"."BB" (actual: 4, maximum: 3)

insert into test (aa, bb, cc) values('a','aaa','aaaa');
-- ORA-12899: value too large for column "SCOTT"."TEST"."CC" (actual: 4, maximum: 3)

insert into test (aa, bb, cc) values('a','aaa','aaa');
-- 1 행 이(가) 삽입되었습니다.

COMMIT;

SELECT *
FROM test;


insert into test values('b','욜','우리');
--1 행 이(가) 삽입되었습니다.

COMMIT;

SELECT *
FROM test;


insert into test values('c','우리','우리');
--ORA-12899: value too large for column "SCOTT"."TEST"."BB" (actual: 6, maximum: 3)

COMMIT;

SELECT *
FROM test;


---------
CHAR 고정된 길이의 문자를 저장하는 자료형(값이 넘치면 오류, 값이 적으면 남는 바이트는 ) 
     2000바이트까지 저장이 가능하다. 
     디폴트 값은 1이다.
ename CHAR == CHAR(1) == CHAR(1byte)













