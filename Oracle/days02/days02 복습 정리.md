### 1. SQL 이란 ?
구조화된 질의 언어로 테이블을 대상으로 수행된다.<br>
질의 + DB 생성, 삭제 테이블 생성 등 운영 작업<br>

### 1-2) SQL의 5가지 종류 <br>
   ㄱ. DQL 데이터 조회 SELECT<br>
   ㄴ. DDL 데이터 정의 CREATE, DROP, ALTER <br>
   ㄷ. DML 데이터 조작 INSERT, UPDATE, DELETE, RENAME, TRUNCATE<br>
        (INSERT,UPDATE -> COMMIT, ROLLBACK )<br>
   ㄹ. DCL 데이터 권한 GRANT<br>
   ㅁ. TCL 트랜잭션 조작과 관련된 언어 COMMIT, ROLLBACK, SAVEPOINT <br>

### 2. PL/SQL 이란 ? <br>
   PL(Procedural Language) + SQL<br>
   절차적인 언어 문법<br>

### 3. RDBMS 란 ? 
    1) DATA : 의미를 가진 정보를 가진 값
    2) DATABASE : 공유되어 사용될 목적으로 통합 관리되는 데이터의 집합
    3) DBMS : 데이터베이스를 운영하고 관리하는 시스템
    4) R + DBMS : 관계형 데이터 모델 + DBMS = 관계형 데이터베이스 관리 시스템
        데이터 테이블과 테이블 간의 관계에 초점을 둔 관계형 데이터베이스 모델이다.
    
### 4. SQL을 작성하세요. ( SCOTT 사용자 접속 후 )
   ㄱ. 현재 접속한 사용자 정보 조회<br>
	show user;<br>
   ㄴ. 모든 사용자 정보를 조회하는 SQL을 작성하세요.<br>
	SELECT *<br>
	FROM all_users;<br>
   ㄷ. 현재 접속한 사용자가 소유한 테이블 정보 조회<br>
	SELECT *<br>
	FROM tabs;<br>
   ㄹ. hong/1234 계정 생성<br>
	CREATE USER hong IDENTIFIED BY 1234;<br>
   ㅁ. hong 권한 부여<br>
	GRANT CREATE SESSION TO hong;<br>
   ㅂ. hong 부여한 권한 제거<br>
	REVOKE CREATE SESSION FROM hong;<br>
   ㅅ. hong 계정 삭제<br>
	DROP USER hong CASCADE;<br>
    
### 5. DBA 란 ? 
데이터베이스 관리자<br>
sys 모든 권한을 가진 최고관리자<br>
system sys과 유사한 권한을 가지고 있지만 db 생성,삭제 권한은 없다.<br>
<br>
<br>
[ 용어 구분]<br>
오라클 서버<br>
오라클 데이터베이스 : 전역 데이터베이스 이름<br>
오라클 인스턴스       : SID<br>

### 6. SID 란 ? 
시스템 식별자<br>
오라클 인스턴스를 식별하기 위한 유일한 이름ㅇ니다.<br>
전역 데이터베이스 이름에서 도메인명을 삭제하면 SID 이름과 동일하다.<br>
오라클 인스턴스 = SGA 메모리 영역 + 백그라운드 프로세스 영역<br>
SGA 메모리 영역에는 Shared Pool, DataBase, Redo Log 3가지로 되어 있다.<br>

### 6-2) 전역 데이터베이스 이름 이란?      
데이터베이스 이름을 구분하기 위한 이름<br>

### 7. "데이터 모델"이란 ?  
컴퓨터에 데이터를 저장하는 방식을 정의해놓은 개념적인 모델<br>
1)개체형<br>
2)네트워크형<br>
3)관계형<br> -- 오라클은 관계형 데이터 모델 사용
4)객체지향형<br>

### 8. 관계형 데이터 모델의 핵심 구성 요소 
  ㄱ. 개체 - 데이터를 저장하는 가장 작은 단위<br>
  ㄴ. 속성 - 개체의 특징, 종류, 상태<br>
  ㄷ. 관계 - 개체간의 연관성을 나타낸다<br>
  
### 9. 테이블 ( table )?  
  데이터를 저장하는 가장 작은 단위의 공간<br>

### 9-2) 테이블 스페이스 ?   
 데이터가 저장하는 단위 중 가장 상위의 개념

### 10. 단축키를 적으세요.
  ㄱ. SQL 작성 후 실행하는 방법    :<br>
      (1)  crtl + enter<br>
      (2)  f5<br>

  ㄴ. 주석 처리하는 방법           :  
	--<br>
	rem<br>

### 11. 오라클 삭제하는 순서를 적으세요. 
   ㄱ. 윈도우 서비스 > 오라클 관련 중지<br>
   ㄴ. 메뉴 - uninstall deinstall 클릭<br>
   ㄷ. c드라이브에 oraclexe 폴더 전체 삭제<br>
   ㄹ. 레스트리 편집기 > local_machine > ora 검색후 4가지 삭제<br>

### 12. Sqlplus.exe 를  사용해서 

   ㄱ. sys 계정으로 로그인하고    
	sqlplus sys/ss123$ as sysdba   <br> 
   ㄴ. 로그인한 계정을 확인하고 <br>
	show user  <br>
   ㄷ. 모든 사용자 계정 조회하고<br>
	SELECT *<br>
  2  FROM all_users;<br>
   ㄹ. 연결종료하는 코딩을 하세요.<br>
	exit > exit<br>

### 13. tnsname.ora 파일의 용도를 설명하세요. 
    네트워크 환경 설정
    클라이언트와 오라클 DB 서버와 연결할 때 설정 정보를 가지고 있는 파일
    C:\oraclexe\app\oracle\product\11.2.0\server\network\ADMIN
    
### 14.  오라클 설치 후 주요 오라클 서비스 2가지       ***  
  ㄱ.  OracleSIDService<br>
  ㄴ.  OracleSIDListener<br>

### 15. SQL은 기본 [ (1)   ] , [ (2) ) ]을 대상으로 수행된다.    
	테이블, 뷰<br>
FROM절 뒤에 오는것<br>
스키마.테이블명<br>
스키마.뷰<br>