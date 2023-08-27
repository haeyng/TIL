--ALTER USER hr IDENTIFIED BY lion ACCOUNT UNLOCK;
--SYS���� ������� �ϰ� ������
--HR ������ �����ϰ� �ִ� ���� ���̺� ��ȸ
SELECT *
FROM user_tables;
--[���]
--REGIONS
--COUNTRIES
--LOCATIONS
--DEPARTMENTS
--JOBS
--EMPLOYEES
--JOB_HISTORY

--ORA-00942: table or view does not exist
-- : selcet �� ����� ������ �ʴ´�.
--emp ���̺� (��ü)�� ������ �����ڵ� �ƴϰ� SELECT �� �� �ִ� ���ѵ� ���� ������ ���� �߻�
select *
FROM emp;

-- HR ������ �����ϰ� �ִ� ���̺� ���� ��ȸ
SELECT *  
FROM user_tables;

-- ��� ������ �����ϰ� �ִ� ���̺� ��ȸ
SELECT *  
FROM EMPLOYEES;

-- ��� ���� firstname, lastname�� �����ϰ� �ִ� ���̺� ��ȸ
SELECT first_name, last_name
FROM EMPLOYEES;

-- ��� ���� firstname, lastname, name ��Ī���� ���̺� ��ȸ(���)
--SELECT first_name + last_name -- ���� ORA-01722: invalid number
-- ����Ŭ���� + �����ڴ� ���ڿ��� �����ڷ� ����� �� ����.
-- ����Ŭ���� ���ڿ��Ῥ���� 2���� || , concat() 
-- ����Ŭ�� '���ڿ�' '��¥'     ����Ŭ���� ���ڿ��� ���� ��¥�� �� '' ����Ѵ�.
-- concat ('���ڿ�', '���ڿ�')
SELECT first_name, last_name
      ,CONCAT(CONCAT(first_name, ' '), last_name) AS "NAME"
      , first_name || ' '|| last_name AS name   -- ���� ����� -1 �پ ��µ�
FROM EMPLOYEES;

SELECT *
FROM tabs;