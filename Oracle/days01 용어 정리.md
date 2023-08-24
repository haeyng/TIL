## Oracle 용어 정리

### 1. 데이터 (Data)
- 재료, 자료, 논거라는 뜻인 'datum'의 복수형
- 넓은 의미에서 데이터는 의미있는 정보를 가진 값이다.
- 사람, 자동 기기가 생성 또는 처리하는 형태로 표시된 것이다.
- 정보(Information) - 의미를 부여한 값(결과)

### 2. 데이터베이스 ( DataBase == DB )
- Data(자료) + Base(저장소)
- 공유되어 사용 될 목적으로 통합 관리되는 데이터의 집합을 뜻한다.
- 현실세계에 존재하는 유형, 무형 등 방대한 정보 집합을 데이터베이스라고 한다.
- 효과적으로 데이터를 추출, 분류, 새로운 데이터의 저장 등이 가능해 데이터베이스를 사용한다.

### 3. DBMS ( [D]ata[B]ase + [M]anagement [S]ystem )
- DBMS는 데이터베이스를 운영하고 관리하는 시스템 (소프트웨어) 이다.
- 자바는 DBMS 중 Oracle, MySQL, MS SQL 등 을 많이 사용한다.

### 4. 사용하는 클라이언트 도구
- SQL Developer 23.1 (sqlplus를 GUI로 작성할 수 있도록 개선한 프로그램) <br>
     - GUI(graphical user interface)란? <br>
      - 사용자가 편리하게 사용할 수 있도록 입출력 등의 기능을 알기 쉬운 아이콘 따위의 그래픽으로 나타낸 것이다.
- SQL*PLUS 툴 (오라클을 설치하면 자동으로 설치된다.)
- 토드(Toad) (유료라서 교육원에서 사용하지 않는다.)

### 5. 데이터 모델
- 컴퓨터에 데이터를 저장하는 방식을 정의해놓은 개념적인 모델이다.
- 데이터 모델의 종류 <br>
(1) 계층형 (Hierarchical)<br>
(2) 네트워크형 (Network)<br>
(3) 관계형 (Relational)         ----> 오라클은 관계형 데이터 모델을 사용<br>
(4) 객체지향형 (Object-Oriented)<br>

### 6. 관계형 데이터 모델 + DBMS = 관계형 데이터베이스 관리 시스템(RDBMS)
- 관계형이란? 데이터 간 관계에 초점을 둔 모델을 말한다.
- 데이터 저장소(테이블)과 테이블 간 관계에 초점을 둔 모델이 관계형 데이터베이스 모델이다.

### 7. 관계형 데이터 모델의 핵심 구성 요소
- 개체(Entity) - 데이터를 저장하는 가장 작은 단위이다.<br> 
    RDBMS에서는 가장 작은 단위를 ( table == 릴레이션 ) 이라고 한다.
- 속성(Attribute) - 개체의 특징, 종류, 상태를 말한다.<br>
    RDBMS에서는 컬럼(column)(==열)이라고 한다.
- 관계(Relationship) - 개체와 개체 간의 연관성을 나타낸다.<br>
```
예) 부서의 정보를 저장할 개체(table) : dept
	부서 개체가 가지고 있는 속성(column)에는 부서번호, 부서명, 부서장... 등이 될 것이다.	    
    사원 개체 (table) : employee
	사원 개체가 가지고 있는 속성(column)에는 사원번호, 사원명, 입사일자.. 등이 될 것이다.
	<한명의 사원은 반드시 하나의 부서에 소속이 된다> 고 가정을 해보면
	부서 개체 (table)------소속관계------사원 개체(table) 간의 연관성을 관계(relationship)라고 한다.
```

### 8. DBA = DB(DataBase) + A(adminstrator)
- DBA는 데이터베이스 관리자를 뜻한다.
    - SYS : 모든 권한을 가진 최고 DBA이다.
    - SYSTEM : SYS와 유사한 권한을 가지고 있지만 DB생성과 삭제 권한은 없다. (생성된 DB를 운영,관리하기 위한 관리자 계정)

### 9. 테이블 스페이스(tablespace)
- 테이블(table) - 데이터를 저장하는 가장 작은 단위의 공간<br>
    - [행(ROW) == 레코드]   <br>
- 논리적 단위
    - 데이터블록 < 익스텐트 < 세그먼트 < 테이블 스페이스
	- 레코드가 데이터블록에 저장됨 ->  데이터 블록 -> 익스텐트...
- 데이터를 저장하는 단위 중 가장 상위의 개념이 테이블스페이스이다.

### 10. SID(시스템식별자)==XE
- 전역 데이터베이스 이름 ==XE
- OracleXETNSListener - 네트워크를 통해서 오라클을 사용하는 클라이언트가 오라클 서버와 연결을 담당하는 관리 프로그램이다.

### 11. SQL이란?
- 서버 : 서비스를 제공하는 쪽
- 클라이언트 : 서비스를 제공받는 쪽
- 클라이언트가 서버에 요청 : request<br>
- 응답(reponse)<br>
<br>
- 오라클DB서버 <---- 요청 ----> 클라이언트 도구(sqlplus, sql developer,toad 등) <br>
- 		도구를 가지고 서버에 요청할 때 사용되는 구조화된 질의 언어가 SQL이다.<br>
<br>

- 클라이언트 도구 -------------------> DB[서버]<br>
		    질의,응답  테이블(table)==릴레이션<br>
	Structured 구조화된<br>
	Query 질의<br>
	Language 언어<br>

### 12. PL / SQL = PL(Procedural Language) + SQL
- 절차적인 언어 문법이 포함되어 확장된 SQL을 말한다.

### 13.SQL 종류 ---- 정보처리기사 출제, 반복해서 복습하기
- DQL (Data Query Language) : 데이터 조회할때 사용되는 언어    SELECT<br>
- DDL (Data Definition Language) : 정의              CREATE, DROP, ALTER<br>
- DML (Data Manupulation Language) : 조작            INSERT, UPDATE, DELETE, RENAME, TRUNCATE<br>
                               INSERT, UPDATE.. 후에 반드시 COMMIT완료, ROLLBACK취소 작업을 해야 한다.<br>
- DCL (Data Control Language) : 권한               GRANT, REVOKE<br>
- TCL (Transcation Control Language) : 트랜잭션 조작과 관련된 언어  COMMIT, ROLLBACK, SAVEPOINT     <br>   

### 14.  SQL 문장 작성법
    1) SQL 문장은 대소문자를 구별하지 않는다.
	2) SQL*PLUS에서 SQL 문장은 SQL프롬프트(>SQL)에 입력되며, 이후의 Line은 줄번호가 붙는다.
		SQL> SELECT *
 	  	 2  FROM all_users;  2가 라인번호

	3) SQL 명령을 종료할 때는 세미콜론(;)을 반드시 붙여야 한다. 세미콜론 끝나야지 SQL문으로 인식함 ; 종결연산자

	4) 맨 마지막 명령어 1개가 SQL buffer에 저장된다      방향키 누르면 전에 입력한거 나오는것

	5) 한 개의 라인에 한 개의 절을 입력하도록 권고된다. (절로 나눠서 입력하기)
		SELECT 절
		FROM 절 

	6) 키워드(의미가 부여된 예약어)는 대문자를 사용하도록 권고된다. 파란색 글씨 

	7) 다른 모든 단어(table명, column명)는 소문자를 사용하도록 권고된다.

	8) 키워드는 단축하거나 줄로 나누어 쓸 수 없다.

	9) 절은 대개 줄을 나누어 쓰도록 권장된다.

### 15. 권한(Privilege) 설명
- 권한 정의
- 권한 부여 방법 2가지<br>
    (1) DBA-----------------------------------> SCOTT(계정)<br>
    (2) DBA----->롤(Role)에 권한 부여----->그 롤을 SCOTT 계정에 부여<br>

### 16. 권한의 종류
- 시스템 권한 : 사용자 생성
- 객체 권한
```	【형식】 //권한을 부여하는 DCL문
    	GRANT 시스템권한명 또는 롤명 TO 사용자명 또는 롤명 또는 PUBLIC
       	[WITH ADMIN OPTION]; //권한 부여받은 사람이 또 부여할수 있음

	    GRANT CONNECT,RESOURCE TO scott;  입력 //Grant을(를) 성공했습니다.
```

### 17. 데이터베이스 객체
- 데이터베이스 내에 존재하는 논리적인 저장 구조이다.<br>
예) 테이블, 뷰, 인덱스, 시노님, 시퀀스, 함수, 프로시저, 트리거, 패키지 등이 데이터베이스 객체이다.

