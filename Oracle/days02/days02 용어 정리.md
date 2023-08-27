## Oracle 용어 정리

### 1. 오라클 인스턴스 2가지
1) SGA 
2) BACKGROUND

- 오라클 인스턴스 : 메모리에 올라가 실행되고 있는 오라클을 뜻한다.
- SGA (오라클 서버가 실행중에만 메모리가 할당. 메모리영역)
- SGA 에는 메모리 영역이 잡히는데 Shared Pool, DataBase, Redo Log 3가지로 되어 있다.

Instance 란 데이터베이스 startup에서 ==> shutdown까지 
Session 란 사용자가 login에서 ==> logout까지 
Schema 란 사용자가 만든 그 사용자의 모든 객체들 

### 2. SID란?
- 시스템 식별자
- 전역데이터베이스 이름에서 도메인명을 삭제하면 SID이름과 동일하다.
- 오라클 인스턴스를 식별하기 위한 유일한 이름이다.
- 오라클 인스턴스 = SGA 메모리 영역 + 백그라운드 프로세스 영역

### 3. SGA의 3가지
1.Shared Pool
2.DataBase
3.Redo Log

### 4. 전역 데이터베이스 이름이란?
- Global Database Name : 전 세계에서 유일한 데이터베이스 이름.
- "데이터베이스명.도메인명"
- 오라클 데이터베이스를 식별하기 위한 유일한 이름(값)이다.

### 5. tnsname.ora 파일의 용도
- 클라이언트와 오라클 DB 서버와 연결할 때 설정 정보를 가지고 있는 파일.
C:\oraclexe\app\oracle\product\11.2.0\server\network\ADMIN

### 6. 오라클 설치 후 주요 오라클 서비스 2가지 - 암기
1. Oracle[SID]Service
2. Oracle[SID]Listener

### 7. SQL은 기본 [Schema.테이블명], [Schema.뷰]를 대상으로 수행된다.
- 간단하게 설명하면 FROM절 뒤에 오는 것을 의미 (테이블과 뷰)

### 8. instance에 대한 정보 조회
v$instance 현재 운용중인 데이터베이스에 설정된 인스턴스에 대한 정보 
v$sga 현재 운용중인 데이터베이스에 설정된 SGA에 대한 정보 
v$parameter SGA에 대한 정보를 추가적으로 제공 
v$option SGA에 대한 정보를 추가적으로 제공 
v$process SGA에 대한 정보를 추가적으로 제공 
v$version SGA에 대한 정보를 추가적으로 제공 



