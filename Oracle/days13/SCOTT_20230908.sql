
CREATE TABLE tbl_dept
as(
    select *
    from dept
    where 1 = 0
)


-- deptno PK 설정
ALTER TABLE tbl_dept
ADD constraint PK_TBLDEPT_DEPTNO PRIMARY KEY(deptno);

select *
from tbl_dept;

drop table tbl_dept;

--------------------------------------------------------------------------------
사원테이블
 ㄴ 정규직 사원
 ㄴ 비정규직 사원
 (1) 슈퍼 타입 : 전체를 하나의 테이블로 관리.
  공통속성(컬럼)
  [][][][][][][][][정규직][정규직][정규직][비정규직][비정규직]
  
 (2) 서브 타입 : 정규직, 비정규직 사원 각각 서브 타입의 갯수만큼 테이블로 관리
  정규직사원 테이블
  [][][][][][][][][정규직][정규직][정규직][정규직]
  
  비정규직사원 테이블
  [][][][][][][][][비정규직][비정규직][비정규직][비정규직]
  
 (3)
  사원테이블                     정       비
  1. [홍길동][][][][][][][]     1       NULL
  2. [홍길동2][][][][][][][]    NULL     2
  
  정규직 테이블
  1(PK) 1(F).[정규직][정규직][정규직][정규직]
  [정규직][정규직][정규직][정규직]
  [정규직][정규직][정규직][정규직]
  
  비정규직 테이블
  1 [비정규직][비정규직][비정규직][비정규직]
  2 [비정규직][비정규직][비정규직][비정규직]
  3 [비정규직][비정규직][비정규직][비정규직]
 
-- * 설문조사에 필요한 쿼리 정리하기 
--   -> JDBC로 해보고 -> html, css, js로 작성 -> JSP/Servlet 처리
 
--------------------------------------------------------------------------------
--시퀀스(SEQUENCE)
--자동 일련번호 생성
--dept 테이블의 deptno를 시퀀스를 생성해서 사용.
;
select MAX(deptno) + 10
from dept;

desc dept;
-------------------------------
    DROP SEQUENCE seq_deptno;
    --Sequence SEQ_DEPTNO이(가) 삭제되었습니다.
    
    CREATE SEQUENCE seq_deptno
    INCREMENT BY 10
    START WITH 50
    MAXVALUE 90
    NOCYCLE
    NOCACHE;
    --Sequence SEQ_DEPTNO이(가) 생성되었습니다.
    
    -- INSERT INTO dept VALUES (  select MAX(deptno) + 10 from dept  );
    INSERT INTO dept VALUES (  seq_deptno.NEXTVAL, 'QC', NULL  );
    
    SELECT *
    FROM user_sequences;
    
    SELECT seq_deptno.CURRVAL
    FROM dual;
    
    ROLLBACK;
    
    SELECT *
    FROM dept;
-------------------------------
    CREATE SEQUENCE seq_deptno;

	CREATE SEQUENCE 시퀀스명
	INCREMENT BY 1   10
	START WITH 1     50
	MAXVALUE 9999999999999999999999999999   90
	MINVALUE 1
	                         NOCYCLE
	CACHE 20                 NOCACHE; 
   
-------------------------------
    CREATE USER
    CREATE TABLE
    CREATE OR REPLACE VIEW
    CREATE SEQUENCE seq_deptno; 
-------------------------------
SELECT *
FROM user_sequences;
from seq;  -- user tables == tabs

--------------------------------------------------------------------------------
--Pseudo 컬럼을 이용한 시퀀스의 사용
--CURRVAL이 참조되기 전에 NEXTVAL이 먼저 사용되어야 한다.

create sequence seq_test;

select seq_test.currval
from dual;
--ORA-08002: sequence SEQ_TEST.CURRVAL is not yet defined in this session
--currval 를 사용하려면 NEXTVAL를 최소한 한번은 사용해야한다.

rollback;

drop sequence seq_test;
drop sequence seq_deptno;

--------------------------------------------------------------------------------
--PL/SQL ( Procedural Language extensions to SQL )
--절차적 언어(변수,제어문) + 확장된 SQL
--블록 구조로 된 언어
--형식
[DECLARE]
 1) 선언 블럭
BEGIN
 2) 실행 블럭
 /*
 SELECT
 INSERT
 UPDATE
 SELECT
 DELETE
 */
[EXCEPTION]
 3) 예외 처리 블럭
END
--------------------------------------------------------------------------------
--PS/SQL의 6가지 종류
    1)anonymous procedure  (익명 프로시저)
    2)stored procedure (저장 프로시저)
    3)stored function (저장 함수)
    4)package (패키지)
    5)trigger (트리거)
    -- 6)object type (객체)

예) 익명 프로시저 작성
변수 값을 할당하는 방법
jAVA : String name ;
       name = '홍길동'; -- 대입연산자
Oracle PL/SQL
       1) :=  대입연산자
       2) select절, fetch절 : INTO문


-- 익명 프로시저 -- declare 부터 시작
DECLARE
  --[일반변수  V], 매개변수  P
  --선언 블럭 : 변수 선언
  --vname VARCHAR2(20);
  --vpay NUMBER(10);
  
  vname insa.name%TYPE := '익명'; --TYPE형 변수.
  vpay NUMBER(10) := 0 ;
  vpi CONSTANT NUMBER := 3.141592; -- 상수 선언 CONSTANT
  vmessage VARCHAR2(100);
  
--desc insa;


BEGIN
  --실행 블럭
  SELECT name, basicpay + sudang
         INTO vname, vpay
  FROM insa
  WHERE num = 1001;
  --출력

--java : system.out.prinf();
--oracle : DBMS_OUTPUT 패키지 사용해 출력
  --DBMS_OUTPUT.PUT_LINE('사원명='||vname);
  --DBMS_OUTPUT.PUT_LINE('급여='||vpay);
  vmessage := vname || ', ' || vpay;
  DBMS_OUTPUT.PUT_LINE('결과 : '||vmessage);
--EXCEPTION
END;

--PL/SQL 프로시저가 성공적으로 완료되었습니다.
-------------------------------------------------------------------------------- 
--문제) 30번 부서의 지역명을 얻어와서 10번 부서의 지역명으로 설정.(익명프로시저 작성)

select *
from dept;

10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON


declare
  vloc dept.loc%TYPE;
begin
  select loc  INTO vloc
  from dept
  where deptno = 30;
  
  update dept
  set loc = vloc
  where deptno = 10;
  
  --commit;
  
--exception
  --ROLLBACK;
end;
--PL/SQL 프로시저가 성공적으로 완료되었습니다.
--------------------------------------------------------------------------------
--[문제]10번 부서원 중에 최고 sal을 받는 사원의 정보 조회
--1)TOP-N

select *
from(
    select *
    FROM emp
    WHERE deptno = 10
    order by sal desc
)
where rownum = 1;
--2) rank함수
select *
from(
select e.*
    ,rank() over(order by sal desc) sal_rank
from emp e
where deptno = 10
)
where sal_rank = 1;
--3) 서브쿼리

select *
from emp
where deptno = 10 and sal = (select max(sal)
                             from emp
                             where deptno = 10
                            );
--4) 익명 프로시저 사용해서 처리.
declare
 vmax_sal_10 emp.sal%type; -- 타입형 변수 선언
 vempno emp.empno%type; 
 vename emp.ename%type; 
 vjob emp.job%type; 
 vsal emp.sal%type; 
 vhiredate emp.hiredate%type; 
 vdeptno emp.deptno%type;
begin
--exception
 select max(sal) into vmax_sal_10
 from emp
 where deptno = 10;

 select empno, ename, job, sal, hiredate, deptno
    into vempno, vename, vjob, vsal, vhiredate, vdeptno
 from emp
 where deptno = 10 and sal = vmax_sal_10;
 
 DBMS_OUTPUT.PUT_LINE('사원번호 : '||vempno);
 DBMS_OUTPUT.PUT_LINE('사원명 : '||vename);
 DBMS_OUTPUT.PUT_LINE('입사일자 : '||vhiredate);
end;
--------------------------------------------------------------------------------
--4-2) 익명 프로시저 사용해서 처리.
declare
 vmax_sal_10 emp.sal%type; -- 타입형 변수 선언
 vrow emp%rowtype; --한 레코드를 모두 저장할 수 있는 변수 (레코드형 변수 선언)
begin
--exception
 select max(sal) into vmax_sal_10
 from emp
 where deptno = 10;

 select empno, ename, job, sal, hiredate, deptno
    into vrow.empno, vrow.ename, vrow.job, vrow.sal, vrow.hiredate, vrow.deptno
 from emp
 where deptno = 10 and sal = vmax_sal_10;
 
 DBMS_OUTPUT.PUT_LINE('사원번호 : '||vrow.empno);
 DBMS_OUTPUT.PUT_LINE('사원명 : '||vrow.ename);
 DBMS_OUTPUT.PUT_LINE('입사일자 : '||vrow.hiredate);
end;
--------------------------------------------------------------------------------                          
--ORA-01422: exact fetch returns more than requested number of rows
--PL/SQL에서 여러개의 레코드를 가져와서 처리하기 위해서는 커서(CURSOR 담아두는 저장공간)를 사용해야 한다.
DECLARE
  vname insa.name%TYPE := '익명';
  vpay NUMBER(10) := 0 ;
  vmessage VARCHAR2(100);
BEGIN
  SELECT name, basicpay + sudang
         INTO vname, vpay
  FROM insa; -- 모든 사원 정보를 가져옴
  vmessage := vname || ', ' || vpay;
  DBMS_OUTPUT.PUT_LINE('결과 : '||vmessage);
--EXCEPTION
END;
--------------------------------------------------------------------------------
--Java
if(조건식){
}


if(조건식){
}else{
}


if(조건식){
}else if(조건식){
}else if(조건식){
}else if(조건식){
}


--PL/SQL
IF (조건식) THEN
END IF;


IF (조건식) THEN
ELSE
END IF;


IF (조건식) THEN
ELSIF(조건식) THEN
ELSIF(조건식) THEN
ELSIF(조건식) THEN
ELSIF(조건식) THEN
ELSE
END IF;


--문제) 변수를 하나 선언해서 정수를 입력받아서 짝수, 홀수 출력
--ORA-06502: PL/SQL: numeric or value error: character string buffer too small
DECLARE
 vnum NUMBER(4) := 0;
 vresult VARCHAR2(6) := '홀수'; --byte라서 안됨 2말고 6으로 수정해야한다.
BEGIN
 vnum := :bindNumber;
--EXCEPTION
 IF ( MOD(vnum,2) = 0 ) THEN
   vresult := '짝수';
 --ELSE
 --  vresult := '홀수';
 END IF;
 
 DBMS_OUTPUT.PUT_LINE(vnum || ' ' || vresult );
END;
--------------------------------------------------------------------------------
--[문제] 국어 점수 입력받아서 수~가 출력. (익명프로시저 사용)

DECLARE
 vkor NUMBER(3) := 0;
 vgrade VARCHAR2(3) := '수';
BEGIN
 vkor := :bindNumber;
 
     IF (vkor between 0 and 100) THEN   
       IF (vkor >= 90) THEN vgrade := '수';       
       ELSIF (vkor >= 80) THEN  vgrade := '우';
       ELSIF (vkor >= 70) THEN  vgrade := '미';
       ELSIF (vkor >= 60) THEN  vgrade := '양';
       ELSIF (vkor >= 50) THEN  vgrade := '가';
     END IF;
     DBMS_OUTPUT.PUT_LINE(vgrade);
     ELSE
     DBMS_OUTPUT.PUT_LINE('국어점수 0~100점 사이로 입력' );
     END IF;    
END;

---------------------------------------------
--★★★★★★★★
DECLARE
 vkor NUMBER(3) := 0;
 vgrade VARCHAR2(3) := '수';
BEGIN
 vkor := :bindNumber;
 
     IF (vkor between 0 and 100) THEN   
      CASE trunc(vkor/10)
          when 10 then vgrade := '수';  
          when 9 then vgrade := '수';  
          when 8 then vgrade := '우';  
          when 7 then vgrade := '미';
          when 6 then vgrade := '양'; 
          else vgrade := '가'; 
      END CASE;
     DBMS_OUTPUT.PUT_LINE(vgrade);
     ELSE
     DBMS_OUTPUT.PUT_LINE('국어점수 0~100점 사이로 입력' );
     END IF;    
END;

------
DECLARE
 vkor NUMBER(3) := 0;
 vgrade VARCHAR2(3) := '수';
BEGIN
 vkor := :bindNumber;
     IF (vkor between 0 and 100) THEN   
      vgrade := CASE trunc(vkor/10)
          when 10 then '수'  
          when 9 then  '수'  
          when 8 then  '우'  
          when 7 then  '미'
          when 6 then  '양' 
          else  '가'
      END;
     DBMS_OUTPUT.PUT_LINE(vgrade);
     ELSE
     DBMS_OUTPUT.PUT_LINE('국어점수 0~100점 사이로 입력' );
     END IF;    
END;
--------------------------------------------------------------------------------
--LOOP...END LOOP;(단순 반복) 문
--Java :
  while (true){
  //무한루프
  if(조건) break;
  }
  
--Oracle :  
  LOOP
  --
  --
  EXIT WHEN 조건
  END LOOP;
 
예) 1~10 = 55
DECLARE
    vi NUMBER := 1;
    vsum NUMBER := 0;
BEGIN
    LOOP
        IF vi = 10 THEN
        DBMS_OUTPUT.PUT(vi);
        ELSE
        DBMS_OUTPUT.PUT(vi || '+'); 
    END IF;    
    vsum := vsum + vi;
    EXIT WHEN vi = 10;
    vi := vi + 1;
    END LOOP;
      --vsum += vi;     
    --EXIT WHEN vi = 10 세미콜론 빠져서 오류 
    /*
    PLS-00103: Encountered the symbol "END" when expecting one of the following:
    * & - + ; / at mod remainder rem <an exponent (**)> and or ||
    multiset
    The symbol ";" was substituted for "END" to continue.
    */  
    DBMS_OUTPUT.PUT_LINE('=' || vsum); --LINE에서 출력이 일어난다.
--EXCEPTION
END;
  
  
--------------------------------------------------------------------------------  
--WHILE...LOOP(제한적 반복) 문
Java :
while(조건식){

}

--oracle :
while (조건식)
LOOP
--
END LOOP;
예)1~10=55

------------------------
DECLARE
    vi NUMBER := 1;
    vsum NUMBER := 0;
BEGIN
    while( vi <= 10 )
    LOOP
        IF vi = 10 THEN DBMS_OUTPUT.PUT(vi);
        ELSE DBMS_OUTPUT.PUT(vi || '+'); 
    END IF;    
    vsum := vsum + vi;
    EXIT WHEN vi = 10;
    vi := vi + 1;
    END LOOP;   
    DBMS_OUTPUT.PUT_LINE('=' || vsum);  
END;


--------------------------------------------------------------------------------
--FOR...LOOP(제한적 반복) 문
--JAVA : FOR문
--ORACLE :

FOR 반복 변수(i) IN [REVERSE] 시작값.. 끝값
LOOP
--반복 처리 구문

END LOOP;
---------------------------------------
--예)1+2+3+4+5+6+7+8+9+10=55

DECLARE 
 vi NUMBER := 1;
 vsum NUMBER := 0;
BEGIN
 FOR vi IN 1..10
 LOOP
   DBMS_OUTPUT.PUT(vi || '+');
   vsum := vsum + vi;
 END LOOP;
 DBMS_OUTPUT.PUT_LINE('=' || vsum);
--EXCEPTION
END;
---------------------------------------
DECLARE 
 --vi NUMBER := 1; FOR문에 사용되는 반복변수는 선언하지 않아도 된다.
 vsum NUMBER := 0;
BEGIN
 FOR vi IN  REVERSE 1.. 10
 LOOP
   DBMS_OUTPUT.PUT(vi || '+');
   vsum := vsum + vi;
 END LOOP;
 DBMS_OUTPUT.PUT_LINE('=' || vsum);
--EXCEPTION
END;
--------------------------------------------------------------------------------
--GO TO문
--DECLARE
BEGIN
--
   GOTO first_proc;
--
   <<second_proc>>
   DBMS_OUTPUT.PUT_LINE('>  2 처리');
   GOTO third_proc;
--
   <<first_proc>>
   DBMS_OUTPUT.PUT_LINE('>  1 처리');
   GOTO second_proc;
   
   <<third_proc>>
   DBMS_OUTPUT.PUT_LINE('>  3 처리');
   
 --EXCEPTION
END;
--------------------------------------------------------------------------------
--구구단(2~9) 출력
1) WHILE LOOP ~ END LOOP 사용 *2 

DECLARE
 vdan NUMBER(2) := 2;
 vi NUMBER(2) := 1;
 BEGIN
 --vdan 2~9
 while vdan <= 9
 LOOP 
  -- 1~9
  vi := 1; -- 중요!
  WHILE vi <= 9
  LOOP
  --2*1=2
  DVMS_OUPUT.PUT(vdan || '*' || vi || '=' || RPAD(vdan*vi,4,' ') )
  vi := vi +1;
  END LOOP;
  DVMS_OUPUT.PUT_LINE(' ')
  vdan := vdan + 1;
 END LOOP;
--EXCEPTION
END;



2) FOR LOOP ~ END LOOP 사용

--DECLARE
-- vdan NUMBER(2):=2 ;
-- vi NUMBER(2) := 1 ;

BEGIN
--EXCEPTION
    FOR vdan IN 2.. 9
    LOOP
        FOR vi IN 1.. 9
        LOOP
        DBMS_OUTPUT.PUT( vdan || '*' || vi || '=' || RPAD( vdan*vi, 4, ' ' ) );
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');   
    END LOOP;
    --EXCEPTION
END;

DECLARE




















