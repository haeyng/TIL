-- Github 수업 참고 자료 다운로드
https://github.com/madvirus/spring4.git -- Download ZIP
spring4-master.zip

-- Oracle scott
-- 방명록
create table guestmessage
(
      id NUMBER(8) PRIMARY KEY
    , name VARCHAR2(100)
    , message CLOB
    , creationTime DATE
);
-- 시퀀스 추가
create SEQUENCE seq_guestmessage;

-- https://spring.io/
-- https://mvnrepository.com/artifact/javax.servlet/jstl/1.2
![2023-11-22 21 27 27](https://github.com/haeyng/TIL/assets/141481323/211f7d76-0595-4f9f-ab75-18312147c157)


-- 현재 이클립스 버전 2021-09(4.21.0)
   (주의) STS도 이클립스와 같은 버전으로 사용해야한다.
   STS3 과 STS4의 차이? 3에는 Spring Legacy만 있고, 4에는 Spring Legacy와 Spring Boot가 존재한다.

-- 다운로드 링크 및 정보 
https://github.com/spring-attic/toolsuite-distribution/wiki/Spring-Tool-Suite-3
위 링크로 들어가 Latest STS3 Downloads 를 찾고
Spring Tool Suite 3.9.18
full distribution on Eclipse 4.21 버전을 다운로드 한다.
https://download.springsource.com/release/STS/3.9.18.RELEASE/dist/e4.21/spring-tool-suite-3.9.18.RELEASE-e4.21.0-win32-x86_64.zip 
다운로드 후 경로(D:\Class\Workspace\SpringClass) 잡아주고 Launch


-- 설치 후 롬복 설정하기
   1. lombok.jar 실행해 STS가 설치된 경로를 잡아준다.
   2. STS.exe 실행
   (주의) 바탕화면에 바로가기를 만들 시 바로가기를 삭제하고 롬복을 설정한 다음 다시 바로가기를 해야 롬복이 뜬다.
   확인 - Help
         About Spring Tool Suite3 클릭 롬복 설치 확인 
         Lombok v1.18.28 "Envious Ferret" is installed. https://projectlombok.org/)

![2023-11-22 21 07 38](https://github.com/haeyng/TIL/assets/141481323/337fb6fc-d657-439e-a919-40fb6b070184)


 