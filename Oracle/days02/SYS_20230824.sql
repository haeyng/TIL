--SYS--
SELECT *
FROM V$sga; --크기 value를 나타냄
FROM V$instance; -- 실행중인 인스턴스를 나타냄

-- 테이블 스페이스 생성하게 되면 물리적으로 만들어지는 데이터 파일(.DBF) 조회
select tablespace_name, file_name 
from dba_data_files;

show parameter db_block_size; -- db_block_size integer 8192   

--현재 오라클 서버에 존재하는 tablespace의 이름을 조회하는 SQL
select name
FROM v$tablespace;

-- dba_extnets : extent에 대한 설정 정보를 조회하는 SQL
--65536 BYTES
select owner, segment_name, extent_id, bytes, blocks
from dba_extents;

--1extent는 8개의 block으로 이루어져 있고 block의 크기는 8192 = 65536
SELECT 8192 *8
FROM dual;

-- dba_xxx     테이블, 뷰인지 모르지만 관리자만 사용할 수 있다.
SELECT *
FROM dba_users;

-- 관리자(SYS) 가 HR 계정을 잠금 해제해야 한다.
-- DDL : CREATE ALTER DROP
CREATE USER
DROP USER;
ALTER USER

CREATE TABLE
DROP TABLE
ALTER TABLE

CREATE TABLESPACE
DROP TABLESPACE
ALTER TABLESPACE

-- 계정을 수정하려고 하니 ALTER 사용
ALTER USER hr ACCOUNT UNLOCK;
ALTER USER hr IDENTIFIED BY lion;

--위 두줄을 아래 한줄로 쓸 수 있음 ora_help에서 alter user 검색
ALTER USER hr IDENTIFIED BY lion ACCOUNT UNLOCK;
--User HR이(가) 변경되었습니다.




