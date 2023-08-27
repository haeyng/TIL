-- �Ǿտ� -- �� REM�� �Է��ϸ� �ּ�ó���� �ȴ�.
-- �ּ�ó�� 
REM �ּ�ó��

-- ��� ����� ������ ��ȸ�ϴ� DQL��
SELECT *
FROM dba_users;

SELECT *
FROM all_users;

-- SQL���� ��ҹ��ڸ� �������� �ʴ´�.
sELEct *
FROM All_users;



-- 1) ������ ����
SHOW USER;
-- USER��(��) "SYS"�Դϴ�.

-- 2) ������ scott ��й�ȣ tiger ���ο� ����� ���� ����
CREATE USER ������ IDENTIFIED BY ��й�ȣ;
CREATE USER scott IDENTIFIED BY tiger;



-- [������ �ο��ϴ� ����] GRANT ���� ����1,2 TO ������ �� �����
-- [������ �����ϴ� ����] REVOKE ���� ����1,2 FROM ������ ������ �����

-- CREATE SESSION �ý��� ������ �ο��Ϸ��� ��
-- 1) SYS ���� ���� Ȯ�� �Ѵ�.
SHOW USER;
-- 2) �����ͺ��̽� ���� ���� �ο� (���� ������ �� �� �ִ� ������ �ɼ��� ���� ����) 
GRANT CREATE SESSION TO scott;

GRANT CONNECT TO scott; -- ���� �ο��ϴ� ��
GRANT CONNECT, RESOURCE TO scott;
-- CONNECT DBMS �����ϱ� ���� ����
-- RESOURCE ��ü(����,����,����), ������(�Է�,����,��ȸ,����) ����
-- DBA �ý��� ������ �ʿ��� ��� ����

-- 3) �ο��� ������ ȸ���Ϸ��� ��
REVOKE CREATE SESSION FROM scott;


-- �̸� ���ǵ� �Ѱ� �ü�������� ��
-- 1) ����Ŭ ��ġ �� �̸� ���ǵ� ���� ��ȸ�ϴ� DQL��
SELECT *
FROM dba_roles;



-- scott ���� ����
-- 1) SYS ����
DROP USER scott CASCADE;
-- ORA-01940: cannot drop a user that is currently connected 
-- ������ �ִ� ���� ���� ���Ѵٴ� �����߻�
-- ���콺 ������ ��ư ������ �������� ����
-- User SCOTT��(��) �����Ǿ����ϴ�.
-- ���ӵǾ� �ִ� scott�� �����ָ� ��

SELECT *
FROM all_users;
