### 1. SELECT문의 7가지 절을 적으시고, 처리 순서를 적으세요. 

with절 1<br>
select절 6<br>
from절 2<br>
where절 3<br>
-- 계층절 hierarchical query<br>
group by절 4<br>
having절 5<br>
order by절 7<br>

### 2. HR 소유의 employees 테이블의 구조를 확인 후 이름과 성을 합쳐서 full_name 으로 출력하는 SQL을 작성하세요.

[실행결과]<br>
```oracle
FIRST_NAME     LAST_NAME     FULL_NAME     FULL_NAME                                
--------------------------------------------------
Ellen          Abel          Ellen Abel    Ellen Abel                                    
Sundar         Ande          Sundar Ande   Sundar Ande 
```
SELECT *
FROM employees;

SELECT FIRST_NAME, LAST_NAME<br>
     , concat(FIRST_NAME ,LAST_NAME) FULL_NAME<br>
FROM employees<br>
WHERE FIRST_NAME = 'Ellen' or FIRST_NAME = 'Sundar';<br>


### 3. hr 계정의 유무를 확인하고 만약에 hr 계정 상태가 잠김을 해제하고 비밀번호를 lion으로 변경하는 SQL을 작성하세요.<br>

SELECT *<br>
FROM all_users<br>
where username = 'HR'; -- 주의 : 비밀번호, 검색어 대소문자 구분<br>
-- 오라클 '날짜' '문자열'<br>
   
SELECT *<br>
FROM all_users<br>
where username = UPPER('hr'); // 대소문자 구분x<br>


### 4. emp 테이블의 job의 종류를 조회하고, job의 종류의 갯수를 출력하는 SQL를 작성하세요. 
SELECT ALL JOB<br>
SELECT DISTINCT  JOB<br>
FROM emp;<br>
<br>
SELECT count(DISTINCT job)<br>
FROM emp;<br>

```oracle
 ORA-00937: not a single-group group function
SELECT DISTINCT  job, count(DISTINCT job) -- COUNT() 집계(그룹)함수
-- 종류 조회와 갯수 출력을 동시에 출력해보려고 작성했으나 에러발생
FROM emp;
```

### 5. NULL에 대해서 설명하세요. 
NULL이란 없는 값이 아닌 현재 확인할수없는 값을 말한다 (미확정된값)
NULL에는 = 비교 연산자 사용X    SQL 연산자 중에 IS NULL, IS NOT NULL을 사용한다.

### 5-2) NULL 처리 함수를 적고 설명하세요. 
NVL ()<br>
NVL2 ()<br>
NULLIF ()<br>
COALESCE()<br>
<br>
NVL(NULL처리하려는는컬럼,바꿀값)<br>

### 5-3) emp 테이블에서 comm 이 NULL인 사원만 pay(sal + comm )를 구해서 부서별 오름차순, pay 별 내림차순으로 정렬해서 출력하는 SQL를 작성하세요.
     
[실행결과]<br>
    DEPTNO ENAME       HIREDATE          SAL        COMM         PAY
---------- ---------- -------- ---------- ---------- ----------
        10 KING       81/11/17       5000                  5000
        10 CLARK      81/06/09       2450                  2450
        10 MILLER     82/01/23       1300                  1300
        20 SCOTT      87/04/19       3000                  3000
        20 FORD       81/12/03       3000                  3000
        20 JONES      81/04/02       2975                  2975
        20 ADAMS      87/05/23       1100                  1100
        20 SMITH      80/12/17        800                   800
        30 BLAKE      81/05/01       2850                  2850
        30 JAMES      81/12/03        950                   950

10개 행이 선택되었습니다. 


SELECT DEPTNO, ENAME, HIREDATE, SAL, COMM<br>
        , SAL + NVL(COMM,0) PAY<br>
FROM emp<br>
ORDER BY DEPTNO ASC, PAY DESC;<br>


### 6. 오라클의 비교 연산자를 적으세요. 
같다 = <br>
다르다 != ^= <br>
크다 작다 > < <br>
크거나 같고 작거나 같다 <= >= <br>
대입 연산자 := <br>

### 7. 오라클의 논리 연산자를 적으세요. 
is not<br>
AND<br>
OR<br>

### 8. 오라클의 SQL 연산자를 적으세요.
IS (NOT) NULL<br>
(NOT) BTWEEN a AND b<br>
(NOT) IN ( 목록 )<br>
ANY, ALL, SOME<br>

### 9. insa 테이블에서 출신지역( city )가 수도권이 아닌 사원의 정보를 출력하는  SQL를 작성하세요.
   ( 1차 부서별 , 2차 지역별 오름차순 정렬 )
     
[실행결과]<br>
BUSEO        NAME          SSN       CITY      
--------------- -------------------- -------------- ----------
자재부          심심해               810206-2222222 전북      
자재부          김싱식               800715-1313131 전북      
자재부          문길수               721217-1951357 충남      
총무부          허경운               760105-1458752 경남      
총무부          정정해               790210-2101010 부산      
홍보부          정한국               760909-1333333 강원      
홍보부          정상호               810705-1212141 강원      

18개 행이 선택되었습니다. 

SELECT BUSEO,NAME,SSN,CITY<br>
FROM insa<br>
-- WHERE NOT (city IN('서울','인천','경기'));<br>
-- WHERE city NOT IN('서울','인천','경기');<br>
WHERE NOT (city = '서울' or city = '인천' or  city = '경기')<br>
ORDER BY BUSEO, CITY;<br>

### 10. emp 테이블에서 10번 또는 20번 부서원 정보를 출력하는  SQL를 작성하세요. 

[실행결과]<br>
    DEPTNO ENAME      HIREDATE
---------- ---------- --------
        10 KING       81/11/17
        10 MILLER     82/01/23
        10 CLARK      81/06/09
        20 SCOTT      87/04/19
        20 FORD       81/12/03
        20 ADAMS      87/05/23
        20 JONES      81/04/02
        20 SMITH      80/12/17

8개 행이 선택되었습니다.

SELECT DEPTNO, ENAME, HIREDATE<br>
FROM emp<br>
WHERE DEPTNO IN(10,20)<br>
--WHERE DEPTNO = 10 OR DEPTNO = 20<br>
ORDER BY DEPTNO;<br>


### 11.  insa 테이블에서 급여가   2,000,000 <=    급여 <= 2,500,000  인 사원의 부서명, 이름 , 급여(월급)를 부서별 오름차순, 급여별 내림차순으로 정렬해서 출력하는  SQL를 작성하세요.  

[실행결과]<br>
```oracle
BUSEO           NAME                        PAY
-----------------------------------------------
영업부          김정훈                  2124200
인사부          박문수                  2465000
인사부          박세열                  2230000
자재부          문길수                  2450000
총무부          정정해                  2428000
홍보부          이미인                  2053000

17개 행이 선택되었습니다. 
```
SELECT BUSEO,NAME,BASICPAY + SUDANG PAY       <br> 
FROM insa<br>
WHERE BASICPAY + SUDANG BETWEEN 2000000 AND 2500000<br>
--WHERE BASICPAY + SUDANG >= 2500000 AND BASICPAY + SUDANG >= 2000000 <br>
ORDER BY BUSEO, NAME ASC, PAY DESC; <br>


### 12. emp 테이블에서 입사일자(hiredate)가   81년도인 사원 정보를 입사순으로 정렬해서 출력하는  SQL를 작성하세요.  

[실행결과]<br>
     EMPNO ENAME      HIREDATE
---------- ---------- --------
      7499 ALLEN      81/02/20
      7521 WARD       81/02/22
      7566 JONES      81/04/02
      7698 BLAKE      81/05/01
      7782 CLARK      81/06/09
      7844 TURNER     81/09/08
      7654 MARTIN     81/09/28
      7839 KING       81/11/17
      7902 FORD       81/12/03
      7900 JAMES      81/12/03

10개 행이 선택되었습니다. 
```oracle
[첫번째 풀이]
SELECT empno, ename, hiredate
FROM emp
WHERE hiredate BETWEEN '81/1/1' AND '81/12/31';
--WHERE hiredate >= '81/1/1' AND hiredate <= '81/12/31';

[두번째 풀이]
SELECT empno, ename, hiredate
,EXTRACT(year FROM hiredate) h_year
FROM emp
--WHERE TO_CHAR(hiredate, 'YYYY') = 1981 -- 오류나지 않지만 좋은 코딩 아님
--WHERE TO_CHAR(hiredate, 'YYYY') = '1981'
--WHERE EXTRACT (TEAR FROM hiredate) = 1981
ORDER BY hiredate ASC;

[세번째 풀이]
SELECT empno, ename, hiredate
,EXTRACT(year FROM hiredate) h_year
FROM emp
WHERE SUBSTR(hiredate, 1, 2) = '81'
ORDER BY hiredate ASC;
```



### 13. Alias 를 작성하는 3가지 방법을 적으세요.
   SELECT deptno, ename <br>
     , sal + comm   (ㄱ)  AS "PAY"<br>
     , sal + comm   (ㄴ)  PAY     예약어인 경우 X DATE처럼 사용안됨<br>
     , sal + comm   (ㄷ)  AS PAY<br>
    FROM emp;<br>

### 14. emp 테이블에서 직속상사(mgr)가 없는  사원의 정보를 조회하는 쿼리 작성.
```oracle
SELECT *
FROM emp
WHERE mgr is NOT NULL;
```
### 14-2) emp 테이블에서 직속상사(mgr)가 있는  사원의 정보를 조회하는 쿼리 작성.<br>
```oracle
SELECT *
FROM emp
WHERE mgr IS NOT NULL;
```
### 14-3) emp 테이블에서 직속상사(mgr)가 없는  사원의 mgr을 'CEO'로 출력하는 쿼리 작성.<br>
```oracle
SELECT EMPNO, ENAME, JOB
-- ,nvl(mgr,0) mgr --mgr의 0 처리가 가능함
,NVL(TO_CHAR (mgr), 'CEO') mgr --mgr을 문자로 변환 후 NVL 함수를 이용해 'CEO'로 변환했다.
,hiredate, sal, comm,deptno
FROM emp;
```





