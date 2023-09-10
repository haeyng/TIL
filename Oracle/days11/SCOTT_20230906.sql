
--JOIN : 두 개 이상의 테이블을 연걸 -> 조회
--JOIN 종류 : EJ, NEJ, IJ, OJ(L,R,F), SJ, CJ, AJ, SJ

--문제) 책ID, 책제목, 단가, 판매수량, 서점(고객), 판매금액 조회

-- BOOK : [B_ID], TITLE
-- DANGA : [B_ID], PRICE
-- PANMAI : [B_ID], [G_ID] FK , P_SU   자식테이블
-- GOGAEK :         [G_ID] PK , G_NAME 부모테이블
-- 판매금액 : PRICE * P_SU

SELECT B.B_ID, TITLE, PRICE , P_SU , G_NAME, PRICE * P_SU "판매금액"
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
            JOIN PANMAI P ON B.B_ID = P.B_ID
            JOIN GOGAEK G ON P.G_ID = G.G_ID;

--------------------------------------------------------------------------------
--[문제] 출판된 책들이 각각 총 몇 권이 판매되었는지 조회
-- (책ID, 책제목, 총판매권수, 단가)

--BOOK : B_ID, TITLE
--DANGA : PRICE
--총 판매 권수 P_SU 의 합


SELECT B.B_ID, TITLE     
     , PRICE
--   , SUM(P_SU) "총판매권수" ORA-00979: not a GROUP BY expression
     , SUM(P_SU) "총판매권수"
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
            JOIN PANMAI P ON B.B_ID = P.B_ID
GROUP BY b.b_id, TITLE, PRICE
ORDER BY b.b_id;
--------------------------------------------
--중복된 데이터도 조회된다.
select b.b_id, title, price, p_su
    ,(select sum(p_su) from panmai where b_id = b.b_id) 총판매권수
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
            JOIN PANMAI P ON B.B_ID = P.B_ID;
--------------------------------------------------------------------------------
--[문제] 책 판매된 적이 있는 책ID, 제목 조회
-- 판매테이블 조회

SELECT B.B_ID, TITLE, PRICE
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
WHERE B.B_ID IN(
SELECT DISTINCT B_ID
FROM PANMAI);


--[문제] 책이 한번도 판매된 적이 없는 책ID, 제목 조회
--[ANTI JOIN]
SELECT B.B_ID, TITLE, PRICE
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
WHERE B.B_ID NOT IN(
SELECT DISTINCT B_ID
FROM PANMAI);
----------------------------------
WITH E AS (
SELECT b.B_ID as b_id, title, price 
,SUM(p_su) 총판매수
FROM book b  
LEFT JOIN danga d ON b.b_id = d.b_id
LEFT JOIN PANMAI p ON b.b_id = p.b_id
GROUP BY b.B_ID, title, price)
SELECT E.b_id, E.title
FROM E
WHERE E.총판매수 IS NULL;
--------------------------------------------------------------------------------
--[문제] 출판된 책들이 각각 총 몇 권이 판매되었는지 조회
-- (책ID, 책제목, 총판매권수, 단가)
-- 판매된 적이 없는 책도 0으로 포함해서 출력
-- INNER JOIN은 양쪽 테이블의 공통적인것만 조회됨
-- 판매유무에 상관없이 첵 제목이 모두 출력되게 해야함 -> OUTER JOIN 사용해야함
SELECT B.B_ID, TITLE , PRICE, NVL( SUM(P_SU), 0 ) "총판매권수"   
FROM BOOK B LEFT OUTER JOIN DANGA D ON B.B_ID = D.B_ID
            LEFT OUTER JOIN PANMAI P ON B.B_ID = P.B_ID
GROUP BY b.b_id, TITLE, PRICE
ORDER BY b.b_id;
-- BOOK과 DANGA 테이블 IJ/L OJ
SELECT B.B_ID, TITLE, PRICE
FROM BOOK B LEFT OUTER JOIN DANGA D ON B.B_ID = D.B_ID;
--------------------------------------------------------------------------------
--[문제] 가장 판매권수가 많은 책에 대한 정보를 출력
--(B_ID, TITLE, 총판매권수)

--[문제] 판매권수가 TOP 3인 책에 대한 정보를 출력
--(B_ID, TITLE, 총판매권수)

--1)TOP-N 분석 방법

SELECT T.*
FROM(
    SELECT B.B_ID, TITLE     
         , PRICE
         , SUM(P_SU) "총판매권수"
    FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
                JOIN PANMAI P ON B.B_ID = P.B_ID
    GROUP BY b.b_id, TITLE, PRICE
    ORDER BY 총판매권수 DESC
)T
WHERE ROWNUM <= 3;
WHERE ROWNUM = 1;
--WHERE ROWNUM BETWEEN 3 AND 5; XX

--2) RANK 순위 함수
WITH T AS(
SELECT B.B_ID, TITLE     
         , PRICE
         , SUM(P_SU) "총판매권수"
         , RANK() OVER(ORDER BY SUM(P_SU)DESC) "판매순위"
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
            JOIN PANMAI P ON B.B_ID = P.B_ID
GROUP BY b.b_id, TITLE, PRICE
)
SELECT *
FROM T
WHERE 판매순위 <= 3;
WHERE 판매순위 = 1;
--------------------------------------------------------------------------------
--[문제] 년도별 월별 판매 현황 조회.
-- 판매년도, 판매월, 판매금액(P_SU * PRICE)
--PANMAI : P_DATE (판매년도, 판매월), P_SU
--DANGA : PRICE
--GROUP BY 판매년도 + 판매금액 집계

SELECT TO_CHAR(P.P_DATE,'YYYY') "판매년도"
      ,TO_CHAR(P.P_DATE,'MM') "판매월"
      ,SUM(P.P_SU * D.PRICE) "판매금액"
FROM PANMAI P JOIN DANGA D ON P.B_ID = D.B_ID
GROUP BY TO_CHAR(P_DATE,'YYYY'), TO_CHAR(P.P_DATE,'MM')
ORDER BY 판매년도, 판매월;

[결과]
2000	03	6000
2000	07	1600
2000	10	10500
2023	09	41661
--------------------------------------------------------------------------------
--[문제] 년도별, 서점별(고객) 판매현황 조회
-- 년도/서점ID/서점명/총판매금액

--PANMAI : P_DATE, P_SU
--GOGAEK : G_ID, G_NAME
--DANGA : PRICE
--판매금액(P_SU * PRICE)

SELECT TO_CHAR(P.P_DATE,'YYYY') "판매년도"
     , G.G_ID
     , G.G_NAME
     , SUM(P.P_SU * PRICE) "판매금액"
FROM PANMAI P JOIN GOGAEK G ON P.G_ID = G.G_ID
              JOIN DANGA D ON P.B_ID = D.B_ID
GROUP BY TO_CHAR(P_DATE,'YYYY'), G.G_ID, G.G_NAME
ORDER BY TO_CHAR(P_DATE,'YYYY'), G.G_NAME;
--------------------------------------------------------------------------------
--[문제] 올해 서점별 판매현황

--1) 올해 - G_ID, g_NAME, 총판매금액합(SUM(P_SU,PRICE))
SELECT  G.G_ID "서점코드"
      , G_NAME "서점명"
      , SUM(P.P_SU * D.PRICE) "올해서점별판매금액"
      ,(SELECT SUM(P.P_SU * PRICE) "올해총판매액"
        FROM PANMAI P JOIN DANGA D ON P.B_ID = D.B_ID
        WHERE TO_CHAR(P_DATE,'YYYY') = TO_CHAR(SYSDATE,'YYYY')
        ) "올해총판매액"
FROM PANMAI P JOIN GOGAEK G ON P.G_ID = G.G_ID
              JOIN DANGA D ON P.B_ID = D.B_ID
WHERE TO_CHAR(P_DATE,'YYYY') = TO_CHAR(SYSDATE,'YYYY')
GROUP BY G.G_ID, G_NAME ;

--2) 올해총판매액
SELECT SUM(P.P_SU * PRICE) "올해총판매액"
FROM PANMAI P JOIN DANGA D ON P.B_ID = D.B_ID
WHERE TO_CHAR(P_DATE,'YYYY') = TO_CHAR(SYSDATE,'YYYY');

--3)

WITH T AS(
SELECT  G.G_ID "서점코드"
      , G_NAME "서점명"
      , SUM(P.P_SU * D.PRICE) "올해서점별판매금액"
      ,(SELECT SUM(P.P_SU * PRICE) 
        FROM PANMAI P JOIN DANGA D ON P.B_ID = D.B_ID
        WHERE TO_CHAR(P_DATE,'YYYY') = TO_CHAR(SYSDATE,'YYYY')
        ) "올해총판매금액"
FROM PANMAI P JOIN GOGAEK G ON P.G_ID = G.G_ID
              JOIN DANGA D ON P.B_ID = D.B_ID
WHERE TO_CHAR(P_DATE,'YYYY') = TO_CHAR(SYSDATE,'YYYY')
GROUP BY G.G_ID, G_NAME 
)
SELECT 서점코드, 서점명, 올해서점별판매금액
      ,ROUND(올해서점별판매금액/올해총판매금액*100) || '%'
FROM T;

--------------------------------------------------------------------------------
--[문제] 책의 총 판매금액이 15000원 이상 팔린 책의 정보를 조회
--(책ID, 제목, 단가, 총판매권수, 총판매금액)
--BOOK : B_ID, TITLE
--DANGA : PRICE
--PANMAI : P_SU , 총판매금액(P_SU*PRICE)
SELECT B.B_ID, TITLE, PRICE
      ,SUM(P_SU) "총판매권수"
      ,SUM(P_SU*PRICE) "총판매금액"
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
            JOIN PANMAI P ON B.B_ID = P.B_ID
GROUP BY B.B_ID, TITLE, PRICE
HAVING SUM(P_SU*PRICE) >= 15000;


--[문제] 총 판매권수가 10권 이상 판매된 책의 정보 조회(-HAVING 절)--------------★★★★★★★
--(책ID, 제목, 가격, 총판매량)
--BOOK : B_ID, TITLE
--DANGA : PRICE
--PANMAI : P_SU
SELECT B.B_ID, TITLE, PRICE
      ,SUM(P_SU) "총판매량"
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
            JOIN PANMAI P ON B.B_ID = P.B_ID
GROUP BY B.B_ID, TITLE, PRICE
HAVING SUM(P_SU)) >= 10;
--------------------------------------------------------------------------------
--VIEW 뷰
-- FROM 테이블 또는 뷰
-- USER_TABLES, USER_CONSTRAINTS, USER_USERS --> 뷰
--1) 가상테이블 : 한개 이상의 테이블 또는 뷰를 통해서 만들어지는 가상 테이블
--2) 전체 데이터 중에서 일부만 접근할 수 있도록 제한하기 위한 기법.
--3) 뷰는 데이터 사전 테이블에 뷰에 대한 정의.

--권한 확인
SELECT *
FROM USER_SYS_PRIVS;


--뷰 생성
--매번 자주 조회하는 쿼리 사용.

SELECT B.B_ID, TITLE, PRICE , P_SU , G_NAME, PRICE * P_SU
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
            JOIN PANMAI P ON B.B_ID = P.B_ID
            JOIN GOGAEK G ON P.G_ID = G.G_ID;

--뷰
CREATE TABLE
CREATE USER
CREATE TABLESPACE
-- 단순뷰(X), 복합뷰(O) DML문을 사용할 수 있지만 제한적이다.
CREATE OR REPLACE VIEW panView --OR REPLACE 없으면 뷰를 생성하고 있으면 수정
AS
--(
SELECT B.B_ID, TITLE, PRICE ,G.G_ID, G_NAME ,P_DATE, P_SU
       ,P_SU * PRICE amt
FROM BOOK B JOIN DANGA D ON B.B_ID = D.B_ID
            JOIN PANMAI P ON B.B_ID = P.B_ID
            JOIN GOGAEK G ON P.G_ID = G.G_ID
order by p_date desc
--ORA-00907: missing right parenthesis
--)
;
--View PANVIEW이(가) 생성되었습니다.
-- 편리성, 보안성이 장점이다.
SELECT *
FROM PANVIEW;

DESC PANVIEW;


-- 뷰를 이용한 총판매금액
select sum(amt)
FROM panview;

--뷰 : DB 객체, 쿼리 자체가 저장된다.
--뷰 소스 확인하기
SELECT TEXT
FROM USER_VIEWS; --쿼리를 확인할 수 있음

--뷰 수정할 때는 CREATE OR REPLACE VIEW 다시 실행하면 수정됨.
--뷰 삭제
DROP VIEW panview;
--View PANVIEW이(가) 삭제되었습니다.
--------------------------------------------------------------------------------
--[문제] 년도, 월, 고객코드, 고객명, 판매금액합(년도별 월별)을 뷰로 작성.
--(년도, 월 오름차순)
panmai - p_date
gogaek - g_id, g_name
danga - price

select to_char(p_date,'yyyy') 판매년도
      ,to_char(p_date,'mm') 판매월
      ,g.g_id
      ,g_name
      --,p_su ,price
      ,sum(p_su * price) 총판매금액
from panmai p join gogaek g on p.g_id = g.g_id
              join danga d on p.b_id = d.b_id
group by to_char(p_date,'yyyy') 
        ,to_char(p_date,'mm')
        ,g.g_id
        ,g_name
order by 1,2;
-------------------------------------
CREATE OR REPLACE FORCE VIEW gogaekView
AS
select to_char(p_date,'yyyy') 판매년도
      ,to_char(p_date,'mm') 판매월
      ,g.g_id
      ,g_name
      --,p_su ,price
      ,sum(p_su * price) 총판매금액
from panmai p join gogaek g on p.g_id = g.g_id
              join danga d on p.b_id = d.b_id
group by to_char(p_date,'yyyy') 
        ,to_char(p_date,'mm')
        ,g.g_id
        ,g_name
order by 1,2    
;

select *
from gogaekView;
--------------------------------------------------------------------------------
--뷰 목록을 검색할 때
select *
from tab --user_talbes
where tabtype = 'VIEW';

--뷰(view) : DML 작업 가능 (실습)
--      ㄴ 심플뷰 -> 실제 기존 테이블 수정.
--      ㄴ 복합뷰 x

CREATE TABLE testa (
     aid   NUMBER                      PRIMARY KEY
    ,name  VARCHAR2(20) NOT NULL
    ,tel   VARCHAR2(20) NOT NULL
    ,memo  VARCHAR2(100)
);
--Table TESTA이(가) 생성되었습니다.

CREATE TABLE testb (
     bid NUMBER PRIMARY KEY
    ,aid NUMBER CONSTRAINT fk_testb_aid
        REFERENCES testa(aid)
        ON DELETE CASCADE
    ,score NUMBER(3)
);
--Table TESTB이(가) 생성되었습니다.

INSERT INTO testa (aid, NAME, tel) VALUES (1, 'a', '1');
INSERT INTO testa (aid, name, tel) VALUES (2, 'b', '2');
INSERT INTO testa (aid, name, tel) VALUES (3, 'c', '3');
INSERT INTO testa (aid, name, tel) VALUES (4, 'd', '4');

INSERT INTO testb (bid, aid, score) VALUES (1, 1, 80);
INSERT INTO testb (bid, aid, score) VALUES (2, 2, 70);
INSERT INTO testb (bid, aid, score) VALUES (3, 3, 90);
INSERT INTO testb (bid, aid, score) VALUES (4, 4, 100);

COMMIT;


SELECT *
from testa;

SELECT *
from testb;

-- 단순뷰 생성 + DML 작업
desc testa;
TEL  NOT NULL VARCHAR2(20) 

create or replace view aView
as
SELECT aid, name, memo
FROM testa;
--View AVIEW이(가) 생성되었습니다.


--[단순뷰를 사용해서 INSERT ]
INSERT INTO aView (aid, name, memo) VALUES (5, 'f', '5');
--ORA-01400: cannot insert NULL into ("SCOTT"."TESTA"."TEL")
INSERT INTO testa (aid, name, memo) VALUES (5, 'f', '5');
--ORA-01400: cannot insert NULL into ("SCOTT"."TESTA"."TEL")
-- 오류난 이유? tel 이 not null 제약조건을 가지고 있기 때문에 제약조건에 맞는 유효한 값을 주어야 한다.


--뷰 수정
--memo 칼럼이 없지만 제약조건이 not null이 아니어서 가능
create or replace view aView
as
SELECT aid, name, tel
FROM testa;
--View AVIEW이(가) 생성되었습니다.

INSERT INTO aView (aid, name, tel) VALUES (5, 'f', '5');
--1 행 이(가) 삽입되었습니다.

commit;

delete from aView
where aid = 5;
--1 행 이(가) 삭제되었습니다.

commit;

drop view aView;
--View AVIEW이(가) 삭제되었습니다.



--복합뷰 생성
create or replace view abView
as
    select 
         a.aid, name, tel --testa
       , bid, score       --testb
    from testa a join testb b on a.aid = b.aid
;
--View ABVIEW이(가) 생성되었습니다.

insert into abView (aid, name, tel, bid, score)
            values (10,  'x' , 55 ,20  ,70);
--ORA-01779: cannot modify a column which maps to a non key-preserved table
-- 하나의 insert문으로 동시에 두 테이블의 내용을 각각 insert 할 수 없다.

insert into abView(aid, name, tel) values (5, 'f', '5');
--ORA-01779: cannot modify a column which maps to a non key-preserved table


--복합뷰를 사용해서 수정 : 한 테이블의 내용만 수정 가능.
update abView
set score = 99
where bid = 1;
--1 행 이(가) 업데이트되었습니다.

rollback;

--복합뷰를 사용해서 수정 : 두 테이블의 내용을 수정할 수 없다.


--삭제
delete from abView 
where aid = 1;
--1 행 이(가) 삭제되었습니다.


select *
from testa;
select *
from testb;

-- DELETE CASCADE 옵션에 의해서 참조당하는 테이블에도 삭제가 되어진다.

rollback;



--점수가 90점 이상인 뷰 생성
create or replace view bView
as
    select bid, aid, score
    from testb
    where score >= 90
;
--View BVIEW이(가) 생성되었습니다.


--bid 가 3인 행의 score = 70점으로 수정
update bview -- bview는 score >= 90 조건만 가져오는 가상 테이블이다.
set score = 70 
where bid = 3;

select *
from bview;

rollback;


--점수가 90점 이상인 뷰 생성 + with check option constraint
create or replace view bView
as
    select bid, aid, score
    from testb
    where score >= 90
    with check option constraint ck_bView
    ;
--View BVIEW이(가) 생성되었습니다.


select *
from bview;

--bid 가 3인 행의 score = 70점으로 수정
update bview
set score = 70 
where bid = 3;
--ORA-01402: view WITH CHECK OPTION where-clause violation
--체크 제약조건 절에 위배된다.  --90점 이하로는 update 불가능.


--
drop view aView;
drop view bView;
drop view abView;

select *
from tab
where tabtype = 'VIEW';

drop view gogaekView;


--[MATERIALIZED VIEW (물리적 뷰)]
--실제 데이터를 가지고 있는 뷰이다.

--[계층적 질의]
SELECT LEVEL
FROM dual;
--LEVEL 컬럼?
--ORA-01788: CONNECT BY clause required in this query block
--CONNECT BY절이 필요하다.

SELECT LEVEL
FROM dual
CONNECT BY LEVEL <= 31; -- 조건절


SELECT *
FROM EMP;

LEVEL -> CONNECT BY -> LEVEL 도움말 검색 -> [계층적 질의]
 LEVEL은 계층적 구조(관계)를 나타날 때 사용하는 의사 칼럼이다. CONNECT BY 절이 반드시 있어야 한다.

-- 2차원 평면적인 테이블 <-- 계층적 구조 표현(저장, 조회)
-- 실무 조직도, 족보 계층적 구조
--1) 테이블 : 부모-자식 컬럼 추가.
--2) SELECT : START WITH, CONNECT BY 구문을 사용하면 계층적 질의


-- 7698의 직속부하직원들 조회
-- 처리 순서가 start with절, connect by절 처리되고 where mgr = 7698 처리 됨
SELECT empno, ename, sal, LEVEL
FROM emp
WHERE mgr = 7698
START WITH mgr is null --조건절-- 어디서부터 시작?
CONNECT BY PRIOR empno = mgr; -- empno자식 = mgr부모  -- top-down 출력형식 
--         top-down 출력형식 


--------------------------------------------------------------------------------
create table tbl_test(
  deptno number(3) not null primary key,
  dname varchar2(24) not null,
  college number(3),
  loc varchar2(10)
  );
--Table TBL_TEST이(가) 생성되었습니다.



                                            -- deptno / college 부모/자식 계층 컬럼
                                            -- emp / mgr 부모/자식 계층 컬럼
INSERT INTO tbl_test VALUES        ( 101,  '컴퓨터공학과', 100,  '1호관');
INSERT INTO tbl_test VALUES        (102,  '멀티미디어학과', 100,  '2호관');
INSERT INTO tbl_test VALUES        (201,  '전자공학과 ',   200,  '3호관');
INSERT INTO tbl_test VALUES        (202,  '기계공학과',    200,  '4호관');
INSERT INTO tbl_test VALUES        (100,  '정보미디어학부', 10 , null );
INSERT INTO tbl_test VALUES        (200,  '메카트로닉스학부',10 , null);
INSERT INTO tbl_test VALUES        (10,  '공과대학',null , null);
COMMIT;

select *
from tbl_test;
--
select deptno, dname, college, LEVEL
from tbl_test
start with deptno = 10
connect by prior deptno = college;


--
select LPAD('ㄴ',(LEVEL-1)*3) || dname 
from tbl_test
start with dname = '공과대학'
connect by prior deptno = college;
--------------------------------------------------------------------------------
--[계층구조에서 가지 제거 방법]

--WHERE 절을 사용해 가지를 제거한 경우 
SELECT deptno,college,dname,loc,LEVEL
  FROM tbl_test
  WHERE dname != '정보미디어학부' -- 자식(자식노드)은 제거되지 않는다. 
  START WITH college IS NULL
  CONNECT BY PRIOR deptno=college;
--
SELECT deptno,college,dname,loc,LEVEL
  FROM tbl_test
  START WITH college IS NULL
  CONNECT BY PRIOR deptno=college
  AND dname != '정보미디어학부'; -- 자식 노드(가지)까지 제거된다.

--------------------------------------------------------------------------------
1. START WITH 최상위조건 : 계층형 구조에서 최상위 계층의 행을 식별하는 조건
2. CONNECT BY 조건 : 계층형 구조가 어떤 식으로 연결되는지를 기술하는 구문.
   PRIOR : 계층형 쿼리에서만 사용할 수 있는 연산자, '앞서의, 직전의'
   
   예)   
   select empno
        , lpad(' ',4*(level-1)) || ename
        , level
        , sys_connect_by_path(ename,'/') 전체경로--전체 경로를 나타내는 함수
        , connect_by_root ename --최상위 루트 노드를 나타낸다. --KING
        , connect_by_isleaf --0, 1(더이상 자식을 가지지 않는 마지막 노드라면 1)
   from emp
   start with mgr is null
   connect by prior empno = mgr; -- t-d 방식
   
   
3. ORDER [SIBLINGS] BY : 부서명으로 정렬됨과 동시에 계층형 구조까지 보존
4. CONNECT_BY_ROOT : 계층형 쿼리에서 최상위 로우를 반환하는 연산자.
5. CONNECT_BY_ISLEAF : CONNECT BY 조건에 정의된 관계에 따라 
   해당 행이 최하위 자식행이면 1, 그렇지 않으면 0 을 반환하는 의사컬럼
6. SYS_CONNECT_BY_PATH(column, char)  : 루트 노드에서 시작해서 자신의 행까지 
   연결된 경로 정보를 반환하는 함수.
7. CONNECT_BY_ISCYCLE : 오라클의 계층형 쿼리는 루프(반복) 알고리즘을 사용한다. 
  그래서, 부모-자식 관계 잘못 정의하면 무한루프를 타고 오류 발생한다.   
  이때는 루프가 발생하는 원인을 찾아 잘못된 데이터를 수정해야 하는 데, 
  이를 위해서는 
    먼저  CONNECT BY절에 NOCYCLE 추가
    SELECT 절에 CONNECT_BY_ISCYCLE 의사 컬럼을 사용해 찾을 수 있다. 
  즉, 현재 로우가 자식을 갖고 있는 데 동시에 그 자식 로우가 부모로우 이면 1,
     그렇지 않으면 0 반환.
--------------------------------------------------------------------------------
-- 1) 7566 JONES의 mgr을 7839에서 7369로  수정
-- 무한루프
UPDATE emp
SET mgr = 7369
WHERE empno = 7566;
-- 2)
SELECT  deptno, empno, LPAD(' ', 3*(LEVEL-1)) ||  ename
, LEVEL
, SYS_CONNECT_BY_PATH(ename, '/')
FROM emp   
START WITH  mgr IS NULL
CONNECT BY PRIOR  empno =  mgr   ;
-- 3)
ROLLBACK;
-- 4)
SELECT  deptno, empno, LPAD(' ', 3*(LEVEL-1)) ||  ename
, LEVEL
, SYS_CONNECT_BY_PATH(ename, '/')
, CONNECT_BY_ISCYCLE IsLoop
FROM emp   
START WITH  mgr IS NULL
CONNECT BY NOCYCLE PRIOR  empno =  mgr   ;
--------------------------------------------------------------------------------
-- 데이터 베이스 모델링
1. 데이터 베이스 모델링 정의 + 쿼리작성(SQL + PL/SQL)
   - 현실 세계의 업무적인 프로세스를 물리적으로 데이터베이스화 시키는 과정을 데이터 베이스 모델링이라고 한다.
   - 1)~4) 과정이 반복됨.
   
   예) 고객 --- 주문, 결제, 취소  ---  상품
   
     1) 현실세계
     현실세계의 업무 프로세스를 파악해야된다.
     (업무분석서(요구분석서)) -- 제일 중요한 작업!
     
     2) 개념적 DB 모델링을 한다.
     만들어지는 결과물이 entity  , (ER-Diagram)

     3) 논리적 모델링을 한다.
     ER-Diagram을 보고 정규화 하는 작업.
     
     4) 물리적 모델링(역정규화)
     DBMS를 무엇을 사용할지 결정, 자료형, 크기.. 등을 정한다.
     역정규화는 성능을 위해서 한다.
     
     
----------------------------
UPDATE emp
set deptno = 10
where empno = 7839; -- king
commit;
-----------------------------


2. 데이터베이스 모델링 단계
 1) ***업무분석***(중요)
    ㄱ. 관련 업무에 대한 기본 지식과 상식이 필요하다.
       예)국민은행 사이트 + 앱
          용어, 지식 X
          회계 관련 용어, 지식(대차대조표, 손실, 자산 등..)
    ㄴ. 신입사원부터 업무 처리 관련된 모든 프로세스를 분석해야 한다.
    ㄷ. 담당자 인터뷰
    ㄹ. 회사에서 사용되는 모든 문서(서류, 장표, 보고서)를 파악해 데이터로 관리되어지는 항목들을 정확하게 파악해야한다.
    ㅁ. 백그라운드 프로세스 파악한다. 다양한 업무의 다양한 경우의 수를 파악할 필요가 있음.
    ㅂ. 사용자의 [요구 분석서]를 작성한다.






