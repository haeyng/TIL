-- �ּ�ó��
REM �ּ�ó��
-- ��� ����� ������ ��ȸ�ϴ� DQL��
SELECT *
FROM dba_users;
FROM all_users;

-- SQL���� ��ҹ��� �������� �ʴ´�.
sELEct *
FROM All_users;

-- 1) ������ ����
SHOW USER;
--USER��(��) "SYS"�Դϴ�.

--2) scott ������ tiger ��й�ȣ ���ο� ����� ���� ����
CREATE USER ������ IDENTIFIED BY ��й�ȣ;
CREATE USER scott IDENTIFIED BY tiger;

-- CREATE SESSION �ý��� ������ �ο��Ϸ��� ��
--1) SYS ���� ���� Ȯ�� �Ѵ�.
SHOW USER;
--2) ���� �ο�. (���� ������ �� �� �ִ� ������ �ɼ��� ����) 
GRANT CREATE SESSION TO scott;

GRANT CONNECT TO scott; --���� �ο��ϴ� ��
GRANT CONNECT,RESOURCE TO scott; -- +����.����.������ �� �ִ� ���� �ο�

--3) �ο��� ������ ȸ���Ϸ��� ��
REVOKE CREATE SESSION FROM scott;

--�̸� ���ǵ� �Ѱ� �ü�������� ��
--1) ����Ŭ ��ġ �� �̸� ���ǵ� ���� ��ȸ�ϴ� DQL��
SELECT *
FROM dba_roles;

-- scott ���� ����
--1) SYS ����
DROP USER scott CASCADE;
--ORA-01940: cannot drop a user that is currently connected 
--������ �ִ� ���� ���� ���Ѵٴ� �����߻�
--���콺 ������ ��ư ������ �������� ����
--User SCOTT��(��) �����Ǿ����ϴ�.
--���ӵǾ� �ִ� scott�� �����ָ� ��
SELECT *
FROM all_users;



