--SYS--
--(1) ����Ŭ ����� Ȯ�� -DATE ����� Ȯ��.

SELECT *
FROM DICTIONARY
WHERE table_name LIKE '%WORDS%';

-- Ű����(�����) ���̺�
SELECT *
FROM V$RESERVED_words
where keyword = 'DATE';

--ORA-00942: table or view does not exist emp ���̺��� �������� �ʴ´�.
SELECT *
--FROM ��Ű��.���̺��(��ü��) => ������ �༭ ���� ���ϰ� �� �� => �ó��(SYNONYM)
FROM SCOTT.emp;
FROM emp;

SELECT *
FROM dba_tables
WHERE OWNER = 'SCOTT';

--�ó�� ����1)SYS   DBA ���� - PUBLIC SYNONYM ����

--�ó�� ����2)
CREATE PUBLIC SYNONYM arirang --SYNONYM ARIRANG��(��) �����Ǿ����ϴ�.
  	FOR SCOTT.emp;
    
SELECT *
FROM arirang;

- PUBLIC SYNONYM ����
DROP PUBLIC SYNONYM arirang;
--SYNONYM ARIRANG��(��) �����Ǿ����ϴ�.

-- synonnym Ȯ��
SELECT *
FROM all_synonyms;
FROM user_synonyms;

