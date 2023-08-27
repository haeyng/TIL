--SYS--
--(1) 오라클 예약어 확인 -DATE 예약어 확인.

SELECT *
FROM DICTIONARY
WHERE table_name LIKE '%WORDS%';

-- 키워드(예약어) 테이블
SELECT *
FROM V$RESERVED_words
where keyword = 'DATE';

--ORA-00942: table or view does not exist emp 테이블이 존재하지 않는다.
SELECT *
--FROM 스키마.테이블명(객체명) => 별명을 줘서 쓰기 편하게 한 것 => 시노님(SYNONYM)
FROM SCOTT.emp;
FROM emp;

SELECT *
FROM dba_tables
WHERE OWNER = 'SCOTT';

--시노님 생성1)SYS   DBA 접속 - PUBLIC SYNONYM 생성

--시노님 생성2)
CREATE PUBLIC SYNONYM arirang --SYNONYM ARIRANG이(가) 생성되었습니다.
  	FOR SCOTT.emp;
    
SELECT *
FROM arirang;

- PUBLIC SYNONYM 삭제
DROP PUBLIC SYNONYM arirang;
--SYNONYM ARIRANG이(가) 삭제되었습니다.

-- synonnym 확인
SELECT *
FROM all_synonyms;
FROM user_synonyms;

