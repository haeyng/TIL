### Github 수업 참고 자료 다운로드<br>
https://github.com/madvirus/spring4.git -- Download ZIP<br>
spring4-master.zip<br>
<br>

### Oracle scott<br>
```
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
```
<br>
<br>

https://spring.io/<br>
https://mvnrepository.com/artifact/javax.servlet/jstl/1.2<br>

![2023-11-22 21 27 27](https://github.com/haeyng/TIL/assets/141481323/211f7d76-0595-4f9f-ab75-18312147c157)
<br>
<br>
<br>

### 현재 이클립스 버전 2021-09(4.21.0)<br>
   (주의) STS도 이클립스와 같은 버전으로 사용해야한다.<br>
   STS3 과 STS4의 차이? 
      3에는 Spring Legacy만 있고, <br>
      4에는 Spring Legacy와 Spring Boot가 존재한다.<br>
<br>
-- 다운로드 링크 및 정보 <br>
https://github.com/spring-attic/toolsuite-distribution/wiki/Spring-Tool-Suite-3<br>
위 링크로 들어가 Latest STS3 Downloads 를 찾고<br>
Spring Tool Suite 3.9.18<br>
full distribution on Eclipse 4.21 버전을 다운로드 한다.<br>
https://download.springsource.com/release/STS/3.9.18.RELEASE/dist/e4.21/spring-tool-suite-3.9.18.RELEASE-e4.21.0-win32-x86_64.zip <br>
다운로드 후 경로(D:\Class\Workspace\SpringClass) 잡아주고 Launch<br>
<br>
<br>

### 설치 후 롬복 설정하기<br>
   1) lombok.jar 실행해 STS가 설치된 경로를 잡아준다.<br>
   2) STS.exe 실행<br>
   (주의) 바탕화면에 바로가기를 만들 시 바로가기를 삭제하고 롬복을 설정한 다음 다시 바로가기를 해야 롬복이 뜬다.<br>
   확인 
        - Help -> <br>
        - About Spring Tool Suite3 클릭 롬복 설치 확인  -> <br>
        - Lombok v1.18.28 "Envious Ferret" is installed. https:// projectlombok.org/)<br>
<br>
![2023-11-22 21 07 38](https://github.com/haeyng/TIL/assets/141481323/337fb6fc-d657-439e-a919-40fb6b070184)
<br>
<br>
<br>

### 프로젝트 생성
1. SpringClass 폴더 생성
2. 스프링 MVC 프로젝트 생성
   프로젝트명 : SL00_DefaultSettings

 ![2023-11-22 21 55 54](https://github.com/haeyng/TIL/assets/141481323/6207d305-944e-402a-b6ca-695f188bca3c)

file -> new -><br>
Spring Starter Project 부트<br>
Spring Legacy Project 레거시 -- 클릭<br>

![2023-11-22 22 00 14](https://github.com/haeyng/TIL/assets/141481323/bf3a9344-5ff3-4345-a57a-19f4d4728530)
<br>
<br>
- Spring MVC Project -> Next 클릭 -><br>
- import 다운로드 경고창 뜨면 -><br>
(이때 인터넷 문제 생기면 프로젝트 다운로드가 제대로 되지 않는다.)<br>
- yes 클릭 -> <br>
최상위 패키지 이름 정하기 org.doit.ik -> <br>
(전세계 사용자들과 구분하기 위해서 보통 도메인을 많이 씀)<br>
- finish 누르면 우측 하단에 프로젝트 생성 중 -> <br>
다 되면 프로젝트에 X마크가 사라진다.<br>


### STS 설정
좌측 하단에 내장 서버 삭제 하고 톰캣으로 사용하려고 함<br>
서버 추가 해서 톰캣 8.5 클릭후 경로 찾아서 설정<br>
서버 add하고 finish 클릭 -> <br>
서버에 server.xml에 서버포트 80번으로 설정<br>
순서 하단 사진 참조

![2023-11-22 22 09 59](https://github.com/haeyng/TIL/assets/141481323/414612f9-8f05-4503-82d8-122bc1377d8a)

![2023-11-22 22 10 48](https://github.com/haeyng/TIL/assets/141481323/0c91169a-1c56-46af-a2af-f7bd7815554d)

![2023-11-22 22 12 41](https://github.com/haeyng/TIL/assets/141481323/baec0285-2588-4480-b01d-a234d5ce026c)


1) preferences 들어가서 <br>
Encoding 설정  : UTF-8 ->JRE 검색해서 JDK 잡기 -> 컴파일러 11 확인 <br>

     - 프로젝트 아이콘에 M은 MAVEN으로 프로젝트를 만들었다는 의미 <br>
S는 스프링 프로젝트라는 의미<br>
메이븐 빌더 도구를 사용해서 스프링 프로젝트를 만들었다는 의미<br>
     - src/test/resources 폴더는 테스트 할 때 사용하는 폴더<br>
pom.xml 은 jar 파일들을 관리하는 파일<br>
:  jar 파일이 필요하면 pom.xml에 추가하면 됨
2) 프로젝트 우클릭 project facets 클릭 java 11로 변경 -> javaCompiler 에 11로 설정
3) 프로젝트 하단에 jre system library [javaSE -11]로 변경되었는지 확인
4) 웹 프로젝트 세팅 클릭하면 처음에 최상위 패키지명 줬던것 뜸
JSP는 프로젝트명으로 떴었음
5) 윈도우 -> 브라우저 -> 크롬으로 변경
<br>
<br>
<br>

### 1. JSP MVC 패턴 구현

  웹서버(Tomcat) 시작 될 때 web.xml 읽기작업을 한다.<br>

	-> ㄱ. MV[C] 컨트롤러 서블릿이 자동으로 load on 할때 첫번째 실행되도록 등록(생성)됨
		-> commandHandler.properties에 의해서
		-> init() 함수 호출
         { key, value map 쌍으로 호출 = "/board/list.do", ListHandler.java에 매핑}
	-> ㄴ.모든 요청에 utf-8을 사용할수있는 필터가 생성(등록)
	-> ㄷ.DBCP 설정 정보 (메타 데이터 폴더에 content.xml.. 등 에 있음)
			
      /board/list.do -> 모든 *.do 요청은 ㄱ.에 등록한 서블릿을 거친다
	      -> ListHandler.process()에서 ArrayList<BoardDTO> list로 받아옴
	      -> ListService 호출               -> boardDAO -> 
	         list = selectService()	       list = selectBoard()
	
               ->ListHandler.process()
		request.setAttribute("list", list);
		return "/board/list.jsp";
	      ->MV[C] 컨트롤러
		포워딩
      /board/list.jsp응답 <-


### contextPath
jsp에서 contextPath 는 webapp까지이다.<br>
톰캣 클릭 -> Modules클릭 -> Path를 /ik에서 / 로 고쳐둠 <br>
--- 이렇게 하면 contextPath 붙이지 않아도 된다.<br>
(자주 확인해서 Path가 /인지 확인하기)  ---> 저장해야된다.<br>

```
web.xml
	<servlet-mapping>
		<servlet-name>appServlet</servlet-name>
		<url-pattern>/</url-pattern> ------> / 와 /* 차이점?
	</servlet-mapping>
```

270 페이지<br>
spring bean(핸들러매핑) : 객체가 요청url과 그에 맞는 핸들러를 dispatcherServlet에 알려준다.

실질적으로 일처리하는 4번 컨트롤러가 서비스 호출, 
서비스에서 dao 호출 arraylist를 담아오면 돌려주는 등의 일을 한다.

결과를 리턴해서 dispatcherServlet로 돌아간다.

바로 view로 가는것이 아니라 뷰를 검색하는 작업을 함(viewResolver가 함) 응답형식이 jsp가 아닐수도 있다. (jsp 외 가능 하다는 의미)


### 2. Spring MVC 패턴 구현 


* 톰캣서버 시작했을때 로그 분석하기

```
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: 서버 버전 이름:    Apache Tomcat/8.5.93
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: Server 빌드 시각:  Aug 23 2023 22:43:14 UTC
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: Server 버전 번호:  8.5.93.0
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: 운영체제 이름:     Windows 10
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: 운영체제 버전:     10.0
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: 아키텍처:          amd64
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: 자바 홈:           C:\Program Files\Java\jdk-11
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: JVM 버전:          11.0.19+9-LTS-224
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: JVM 벤더:          Oracle Corporation
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: CATALINA_BASE:     E:\Class\Workspace\SpringClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp0
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: CATALINA_HOME:     C:\apache-tomcat-8.5.93
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: 명령 행 아규먼트:  -Dcatalina.base=E:\Class\Workspace\SpringClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp0
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: 명령 행 아규먼트:  -Dcatalina.home=C:\apache-tomcat-8.5.93
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: 명령 행 아규먼트:  -Dwtp.deploy=E:\Class\Workspace\SpringClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: 명령 행 아규먼트:  --add-opens=java.base/java.lang=ALL-UNNAMED
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: 명령 행 아규먼트:  --add-opens=java.base/java.io=ALL-UNNAMED
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: 명령 행 아규먼트:  --add-opens=java.base/java.util=ALL-UNNAMED
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: 명령 행 아규먼트:  --add-opens=java.base/java.util.concurrent=ALL-UNNAMED
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: 명령 행 아규먼트:  --add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.VersionLoggerListener log
INFO: 명령 행 아규먼트:  -Dfile.encoding=MS949
11월 22, 2023 4:20:07 오후 org.apache.catalina.core.AprLifecycleListener lifecycleEvent
INFO: 프로덕션 환경들에서 최적의 성능을 제공하는, APR 기반 Apache Tomcat Native 라이브러리가, 다음 java.library.path에서 발견되지 않습니다: [C:\Program Files\Java\jdk-11\bin;C:\WINDOWS\Sun\Java\bin;C:\WINDOWS\system32;C:\WINDOWS;C:\Program Files\Java\jdk-11bin;C:\oraclexe\app\oracle\product\11.2.0\server\bin;C:\Program Files\Common Files\Oracle\Java\javapath;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\iCLS\;C:\Program Files\Intel\Intel(R) Management Engine Components\iCLS\;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\DAL;C:\Program Files\Intel\Intel(R) Management Engine Components\DAL;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\IPT;C:\Program Files\Intel\Intel(R) Management Engine Components\IPT;C:\apache-tomcat-8.5.93\bin;C:\Program Files\Bandizip\;E:\Class\Download\Git\cmd;C:\Program Files\Git\cmd;C:\Program Files\Java\jdk-11bin;C:\Users\user\AppData\Local\Programs\Python\Python311\Scripts\;C:\Users\user\AppData\Local\Programs\Python\Python311\;C:\Users\user\AppData\Local\Microsoft\WindowsApps;C:\Users\user\AppData\Local\Programs\Microsoft VS Code\bin;;.]
11월 22, 2023 4:20:07 오후 org.apache.coyote.AbstractProtocol init
INFO: 프로토콜 핸들러 ["http-nio-80"]을(를) 초기화합니다.
11월 22, 2023 4:20:07 오후 org.apache.catalina.startup.Catalina load
INFO: Initialization processed in 1011 ms
11월 22, 2023 4:20:07 오후 org.apache.catalina.core.StandardService startInternal
INFO: 서비스 [Catalina]을(를) 시작합니다.
11월 22, 2023 4:20:07 오후 org.apache.catalina.core.StandardEngine startInternal
INFO: 서버 엔진을 시작합니다: [Apache Tomcat/8.5.93]
11월 22, 2023 4:20:09 오후 org.apache.jasper.servlet.TldScanner scanJars
INFO: 적어도 하나의 JAR가 TLD들을 찾기 위해 스캔되었으나 아무 것도 찾지 못했습니다. 스캔했으나 TLD가 없는 JAR들의 전체 목록을 보시려면, 로그 레벨을 디버그 레벨로 설정하십시오. 스캔 과정에서 불필요한 JAR들을 건너뛰면, 시스템 시작 시간과 JSP 컴파일 시간을 단축시킬 수 있습니다.
11월 22, 2023 4:20:09 오후 org.apache.catalina.core.ApplicationContext log
INFO: No Spring WebApplicationInitializer types detected on classpath
11월 22, 2023 4:20:09 오후 org.apache.catalina.core.ApplicationContext log
INFO: Initializing Spring root WebApplicationContext
INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext: initialization started
INFO : org.springframework.web.context.support.XmlWebApplicationContext - Refreshing Root WebApplicationContext: startup date [Wed Nov 22 16:20:09 KST 2023]; root of context hierarchy
INFO : org.springframework.beans.factory.xml.XmlBeanDefinitionReader - Loading XML bean definitions from ServletContext resource [/WEB-INF/spring/root-context.xml]
INFO : org.springframework.beans.factory.support.DefaultListableBeanFactory - Pre-instantiating singletons in org.springframework.beans.factory.support.DefaultListableBeanFactory@da47a76: defining beans []; root of factory hierarchy
INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext: initialization completed in 1228 ms
11월 22, 2023 4:20:11 오후 org.apache.catalina.util.SessionIdGeneratorBase createSecureRandom
WARNING: [SHA1PRNG] 알고리즘을 사용하여, 세션 ID를 생성하기 위한 SecureRandom 객체를 생성하는데, [172] 밀리초가 소요됐습니다.
11월 22, 2023 4:20:11 오후 org.apache.catalina.core.ApplicationContext log
INFO: Initializing Spring FrameworkServlet 'appServlet'
INFO : org.springframework.web.servlet.DispatcherServlet - FrameworkServlet 'appServlet': initialization started
INFO : org.springframework.web.context.support.XmlWebApplicationContext - Refreshing WebApplicationContext for namespace 'appServlet-servlet': startup date [Wed Nov 22 16:20:11 KST 2023]; parent: Root WebApplicationContext
INFO : org.springframework.beans.factory.xml.XmlBeanDefinitionReader - Loading XML bean definitions from ServletContext resource [/WEB-INF/spring/appServlet/servlet-context.xml]
INFO : org.springframework.context.annotation.ClassPathBeanDefinitionScanner - JSR-250 'javax.annotation.ManagedBean' found and supported for component scanning
INFO : org.springframework.context.annotation.ClassPathBeanDefinitionScanner - JSR-330 'javax.inject.Named' annotation found and supported for component scanning
INFO : org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor - JSR-330 'javax.inject.Inject' annotation found and supported for autowiring
INFO : org.springframework.beans.factory.support.DefaultListableBeanFactory - Pre-instantiating singletons in org.springframework.beans.factory.support.DefaultListableBeanFactory@7208edf1: defining beans [org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping#0,org.springframework.format.support.FormattingConversionServiceFactoryBean#0,org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter#0,org.springframework.web.servlet.handler.MappedInterceptor#0,org.springframework.web.servlet.mvc.method.annotation.ExceptionHandlerExceptionResolver#0,org.springframework.web.servlet.mvc.annotation.ResponseStatusExceptionResolver#0,org.springframework.web.servlet.mvc.support.DefaultHandlerExceptionResolver#0,org.springframework.web.servlet.handler.BeanNameUrlHandlerMapping,org.springframework.web.servlet.mvc.HttpRequestHandlerAdapter,org.springframework.web.servlet.mvc.SimpleControllerHandlerAdapter,org.springframework.web.servlet.resource.ResourceHttpRequestHandler#0,org.springframework.web.servlet.handler.SimpleUrlHandlerMapping#0,org.springframework.web.servlet.view.InternalResourceViewResolver#0,homeController,org.springframework.context.annotation.internalConfigurationAnnotationProcessor,org.springframework.context.annotation.internalAutowiredAnnotationProcessor,org.springframework.context.annotation.internalRequiredAnnotationProcessor,org.springframework.context.annotation.internalCommonAnnotationProcessor,org.springframework.context.annotation.ConfigurationClassPostProcessor$ImportAwareBeanPostProcessor#0]; parent: org.springframework.beans.factory.support.DefaultListableBeanFactory@da47a76
INFO : org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping - Mapped "{[/],methods=[GET],params=[],headers=[],consumes=[],produces=[],custom=[]}" onto public java.lang.String org.doit.ik.HomeController.home(java.util.Locale,org.springframework.ui.Model)
INFO : org.springframework.web.servlet.handler.SimpleUrlHandlerMapping - Mapped URL path [/resources/**] onto handler 'org.springframework.web.servlet.resource.ResourceHttpRequestHandler#0'
INFO : org.springframework.web.servlet.DispatcherServlet - FrameworkServlet 'appServlet': initialization completed in 1201 ms
11월 22, 2023 4:20:12 오후 org.apache.coyote.AbstractProtocol start
INFO: 프로토콜 핸들러 ["http-nio-80"]을(를) 시작합니다.
11월 22, 2023 4:20:12 오후 org.apache.catalina.startup.Catalina start
INFO: Server startup in 5212 ms
INFO : org.doit.ik.HomeController - Welcome home! The client locale is ko_KR.
INFO : org.doit.ik.HomeController - Welcome home! The client locale is ko_KR.
WARN : org.springframework.web.servlet.PageNotFound - No mapping found for HTTP request with URI [/favicon.ico] in DispatcherServlet with name 'appServlet'
```


스프링 컨테이너의 역할 : bean객체를 생성하고 조립<br>
XmlWebApplicationContex : xml 파일을 설정 정보로 읽어서 bean객체를 생성하고 조립<br>


INFO : org.springframework.beans.factory.xml.<br>
XmlBeanDefinitionReader - Loading XML bean definitions from <br>
ServletContext resource [/WEB-INF/spring/root-context.xml]<br>
root-context.xml
