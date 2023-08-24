--SYS--
SELECT *
FROM V$sga; --ũ�� value�� ��Ÿ��
FROM V$instance; -- �������� �ν��Ͻ��� ��Ÿ��

-- ���̺� �����̽� �����ϰ� �Ǹ� ���������� ��������� ������ ����(.DBF) ��ȸ
select tablespace_name, file_name 
from dba_data_files;

show parameter db_block_size; -- db_block_size integer 8192   

--���� ����Ŭ ������ �����ϴ� tablespace�� �̸��� ��ȸ�ϴ� SQL
select name
FROM v$tablespace;

-- dba_extnets : extent�� ���� ���� ������ ��ȸ�ϴ� SQL
--65536 BYTES
select owner, segment_name, extent_id, bytes, blocks
from dba_extents;

--1extent�� 8���� block���� �̷���� �ְ� block�� ũ��� 8192 = 65536
SELECT 8192 *8
FROM dual;

-- dba_xxx     ���̺�, ������ ������ �����ڸ� ����� �� �ִ�.
SELECT *
FROM dba_users;

-- ������(SYS) �� HR ������ ��� �����ؾ� �Ѵ�.
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

-- ������ �����Ϸ��� �ϴ� ALTER ���
ALTER USER hr ACCOUNT UNLOCK;
ALTER USER hr IDENTIFIED BY lion;

--�� ������ �Ʒ� ���ٷ� �� �� ���� ora_help���� alter user �˻�
ALTER USER hr IDENTIFIED BY lion ACCOUNT UNLOCK;
--User HR��(��) ����Ǿ����ϴ�.




