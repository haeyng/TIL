## Oracle 실습

### 1. Ora_Help.zip 압축 풀어서 C드라이브에 저장한다. <br>
- 오라클 수업 교재를 Ora_Help로 대신한다. <br>
- ora_help.exe는 관리자 권한으로 실행한다.
- 관리자 권한으로 실행하지 않으면 실행되지 않을 때도 있다.
### 2. C:\Class\WorkSpace 경로에 OracleClass 폴더 생성한다.
C:\Class\WorkSpace<br>
  └ OracleClass <br>
    └ days01 <br>

### 3. Oracle 11g XE 설치한다. 
https://www.oracle.com/database/technologies/xe-prior-release-downloads.html<br>

    Oracle Database 11g == grid (숫자는 버전)
    Oracle Database 21c == cloud
    Oracle Database  9i == internet

    오라클 종류(edition)
     : EE, SE, SEO, XE([ex]press):무료버전(1개밖에 설치 못한다.), PE(DB서버 혼자 쓰는 개인용)

### 4. Windows 64-bit with JDK 11 included 다운로드
https://www.oracle.com/database/sqldeveloper/technologies/download/

### 5. Oracle Database 11gR2 Express Edition for Windows x64 다운로드 (오라클 설치)
https://www.oracle.com/database/technologies/xe-prior-release-downloads.html
```
- OracleXE112_Win64.zip 압축해제 후 setup.exe 파일 실행
- SYS, SYSTEM DB관리자(DBA) 계정 + 비밀번호 [ ss123$ ]
- TNS Port : 1521
- MTS Port : 2030
- HTTP Port : 8080
- 오라클 설치화면을 저장한다.
```
![1](https://github.com/haeyng/TIL/assets/141481323/483f0a51-839c-4c6c-8dba-486fae03d37c)<br>

### 6. Oracle Database 11gR2 XE Documentation 설명서 참고
https://docs.oracle.com/cd/E17781_01/index.htm
    Getting Started 클릭

### 7. Oracle 11g XE 설치하고 난 후 확인 작업
1. C:\oraclexe 폴더 생성 되었는지 확인한다.<br>
2. 제어판 - 시스템 및 보안 - 관리도구 - 서비스<br>
	- Oracle 실행 안될 때 ? <br>
      서비스 -> OracleServiceXE가 시작이 되어 있는지 확인 후 시작 안되어 있으면 시작하기.<br>

- OracleService + SID(시스템식별자) 유료는 이름을 부여해야하고, 기본은 ORCL로 되어 있다.(무료는 XE가 기본)<br>
- 하나의 서버 안에 여러 개의 오라클 서버를 설치 할 수 있다.<br>
- 설치 된 것중 하나를 찾으려고 할 때 각각 가지고 있는 고유한 이름(SID)을 찾으면 된다.<br>
- OracleXETNSListener가 시작되어 있는지 확인해야 하고 시작 안 되어 있으면 시작해준다.<br>
- OracleService + SID + TNSListener<br>

### 9.클라이언트 도구  다운로드 + 설치 
- 오라클 서버에 연결해서 관리하는 클라이언트 도구가 필요하기 때문에 SQL Developer 23.1를 설치한다.<br>
- sqldeveloper-22.2.1.234.1810-x64 압축풀어서 C 드라이브에 복사 + 붙이기 <br>
     -> 바탕화면에 바로가기 - sqldeveloper-22.2.1.exe<br>

### 10. SID와 전역 데이터베이스 이름, OracleXETNSListener
- SID(시스템식별자) 는 교육원에서 사용하는 것은 XE이다.
- 전역 데이터베이스 이름도 XE이다.
- OracleXETNSListener - 네트워크를 통해서 오라클을 사용하는 클라이언트가 오라클 서버와 연결을 담당하는 관리 프로그램이다.

### 11. Oracle 삭제 방법
1. 윈도우 서비스 실행 - 오라클과 관련된 서비스 모두 중지한다.<br>
2. 메뉴 - uninstall, deinstall 클릭해서 삭제. (무료 버전에는 메뉴에 버튼이 없음)<br>
	    프로그램 추가/삭제 -> oracle 제거하면 된다.<br>
3. 2번을 수행해도 C:\oraclexe에 설치 폴더는 남아 있기 때문에 폴더를 삭제한다.<br>
4. (무료버전은 해당없음) <br>
    레지스터리 삭제 해야 한다. -> 레지스터리 편집기 실행 -> LOCAL_MACHINE에서 4군데를 삭제한다.--- 검색해서 찾아보기<br>

### 12. 오라클서버 연결 바꾸기
클라이언트 도구(본인PC) ----연결---> 오라클서버(본인PC)<br>
              ⇊<br>
클라이언트 도구(본인PC) ----연결---> 오라클서버(팀장PC)<br>

1. 1521 포트 방화벽을 해제해야 한다. → 방화벽 상태 확인 클릭 → <br>
   고급설정 클릭 -→ 인바운드(밖->안) 규칙 클릭 → 새 규칙 → <br>
   포트 클릭 → 다음 → 특정 로컬 포트 1521 입력 후 다음 (여러개는 ,로 추가해서 입력 가능하다.) -><br>
   연결 허용 다음 → 3개 전부 체크 다음 → 이름 오라클1521 입력 마침.<br>

### 13. cmd에서 sqlplus 실행
- cmd 에서 sqlplus
		sqlplus /?
	   1) SQL 실행 할 수 있다.
	   2) PL / SQL 실행
	   3) SQL*PLUS 명령어 실행

sqlplus [ [<option>] [{logon | /nolog}] [<start>] ]

	<logon> is: {<username>[/<password>]
	   [@<connect_identifier>] | / } //내꺼 말고 다른 사람꺼 할때는 생략X
               [AS {SYSDBA | SYSOPER | SYSASM}] [EDITION=value]

	<connect_identifier>
	@[<net_service_name> | [//]Host[:Port]/<service_name>] //중요

### 14. SQL>로 변경
    cmd에
	sqlplus sys/ss123$ as SYSDBA 입력.

	Connected to:	
	Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

	연결 되었다는 뜻 SQL>로 바뀌어 있다.

show user 입력
	USER is "SYS" 

	disconnect 입력
	SQL> disconnect
	Disconnected from Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production
	SQL> exit
	빠져나옴
	C:\Users\user> 
    C:\Users\user>sqlplus / as sysdba 입력 (아이디 비밀번호 지정안했지만 로컬에서는 접근가능)
	SQL> show user
	USER is "SYS"
	SQL>

	SQL> SELECT * 입력    
	  2  FROM all_user
	    3  ;             SQL문 에는 명령 종결 ; 세미콜론 필요
	FROM all_user
	     *
	ERROR at line 2:
	ORA-00942: table or view does not exist
	
	
	SQL>


	SQL> SELECT *
 	  2  FROM all_users; 모든 유저를 최고관리자가 조회함


	exit -> exit 입력하면 종료됨

    내일 명령문 시험!
show user
SELECT *
FROM_all_users;
sqlplus sys/ss123$ as sysdba
sqlplus / as sysdba

### 15.
14) SQL Developer 23.1
	
	exe 파일 실행 -> 임포트 아니오-> + 초록색 버튼 ->localhostSYS 이름 정하고 컬러 빨간색 -> 이름, 비밀번호 입력, 비밀번호 저장 체크 -> 접속
	
	C:\Users\user>sqlplus / as sysdba 한것과 같음

   사용자 조회할때?
	SELECT *
	FROM all_users;


Ora_Help 에서 sql 검색해서 확인해보기!

### 16. 
19) 계정 생성은 DDL(Data Definition Language)문을 사용한다. DDL중에서 CREATE를 사용한다.
	1) 관리자 계정으로 접속해야 한다. (SYS, SYSTEM)          계정 생성할 수 있는 권한이 있는 사람이
		SHOW USER; 입력하면 확인 됨. //USER이(가) "SYS"입니다.
	
	   scott 계정
	   tiger 비밀번호

scott 계정 생성 하기 전에 확인하는 코딩
계정 생성,비밀번호 하는 코딩

   20) scott 생성된 계정으로 접속하기

	C:\Users\user>sqlplus scott/tiger 입력

	SQL*Plus: Release 11.2.0.2.0 Production on 수 8월 23 15:07:29 2023
	
	Copyright (c) 1982, 2014, Oracle.  All rights reserved.

	ERROR:
	ORA-01045: user SCOTT lacks CREATE SESSION privilege; logon denied
	 권한이 없다.

	SQL> 
 	 CREATE SESSION 권한이 없어서 로그인 실패.
  	해결 방법 
  	 1) 권한을 부여할 수 있는 계정(SYS)이 
	 2) CREATE SESSION 권한을 scott계정에게 부여하면 됨.
	     - DB 접속(연결) 권한


시험
--미리 정의된 롤과 운영체제에서의 롤
--1) 오라클 설치 후 미리 정의된 롤을 조회하는 DQL문
SELECT *
FROM dba_roles;

스캇 계정 있는지 확인작업- > 생성
로그인할 수 있는 롤, 권한 부여-> 로그인 해보고
다시 계정 삭제하고 삭제되었는지 확인.

### 17.
23) 계정 삭제

   24) 데이터베이스 객체? 데이터베이스 내에 존재하는 논리적인 저장 구조이다.
	예) 테이블, 뷰, 인덱스, 시노님, 시퀀스, 함수, 프로시저, 트리거, 패키지 등이 데이터베이스 객체이다.

   25) scott 계정 생성 -> Schema scott 생성 : 모든 DB 객체들의 묶음(집합) - [테이블], 인덱스, 뷰, 함수.. 등
	테이블 생성 + SQL 연습
	
scott.sql 파일에 tiger  tiger를 대문자->소문자로 바꿈
CONNECT SCOTT/tiger tiger를 대문자->소문자로 변경
GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT IDENTIFIED BY tiger; // 롤부여와 동시에 비밀번호도 변경하겠다는 코딩
ALTER~ 계정수정
CONNECT SCOTT/tiger 다시 scott으로 접속

sql 파일 끌어다놓기
