-- 맨앞에 -- 나 REM을 입력하면 주석처리가 된다.
-- 주석처리 
REM 주석처리

-- 모든 사용자 계정을 조회하는 DQL문
SELECT *
FROM dba_users;

SELECT *
FROM all_users;

-- SQL문은 대소문자를 구별하지 않는다.
sELEct *
FROM All_users;



-- 1) 관리자 접속
SHOW USER;
-- USER이(가) "SYS"입니다.

-- 2) 계정명 scott 비밀번호 tiger 새로운 사용자 계정 생성
CREATE USER 계정명 IDENTIFIED BY 비밀번호;
CREATE USER scott IDENTIFIED BY tiger;



-- [권한을 부여하는 형식] GRANT 권한 종류1,2 TO 권한을 줄 사용자
-- [권한을 삭제하는 형식] REVOKE 권한 종류1,2 FROM 권한을 삭제할 사용자

-- CREATE SESSION 시스템 권한을 부여하려고 함
-- 1) SYS 계정 접속 확인 한다.
SHOW USER;
-- 2) 데이터베이스 접속 권한 부여 (관리 권한을 줄 수 있는 관리자 옵션은 주지 않음) 
GRANT CREATE SESSION TO scott;

GRANT CONNECT TO scott; -- 롤을 부여하는 것
GRANT CONNECT, RESOURCE TO scott;
-- CONNECT DBMS 접속하기 위한 권한
-- RESOURCE 객체(생성,변경,삭제), 데이터(입력,수정,조회,삭제) 권한
-- DBA 시스템 관리에 필요한 모든 권한

-- 3) 부여한 권한을 회수하려고 함
REVOKE CREATE SESSION FROM scott;


-- 미리 정의된 롤과 운영체제에서의 롤
-- 1) 오라클 설치 후 미리 정의된 롤을 조회하는 DQL문
SELECT *
FROM dba_roles;



-- scott 계정 삭제
-- 1) SYS 접속
DROP USER scott CASCADE;
-- ORA-01940: cannot drop a user that is currently connected 
-- 접속해 있는 계정 삭제 못한다는 오류발생
-- 마우스 오른쪽 버튼 눌러서 접속해제 해줌
-- User SCOTT이(가) 삭제되었습니다.
-- 접속되어 있는 scott을 끊어주면 됨

SELECT *
FROM all_users;
