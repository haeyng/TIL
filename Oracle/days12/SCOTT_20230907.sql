-- [데이터베이스(DB) 모델링]
1) 1단계 : 요구 사항 분석 - 요구 분석서(요구 사항 명세서)
2) 2단계 : 개념적 모델링(설계) - E-R 다이어그램
3) 3단계 : 논리적 모델링 - 릴레이션 스키마
                      - 정규화
4) 4단계 : 물리적 모델링 - 물리적 스키마
                      - DBMS, 역정규화, 인덱스
5) 5단계 : 구현


-- 2단계 : 개념적 모델링(설계)
    1) 요구 분석서를 가지고 데이터 요소(ENTITY==개체)를 추출한다.
        -> 데이터 요소를 추출한다는 것은 개체의 속성(Attribute)을 추출한다는 의미도 포함된다.
        -> 키(PK) 속성을 선별한다.
    2) 개체(ENTITY) 간의 관계(Relational)를 파악한다.
        -> ER Diagram 작성
    
    ㄱ. 실체 = 개체 = Entity
        - 업무 수행을 위해 데이터로 관리되어지는 사람, 사물, 장소, 사건 등을 '실체'라고 한다.
        - 구축하고자 하는 업무의 목적, 범위, 전략에 따라 데이터로 관리되어지는 항목을 파악해야한다.
        예) 회원제
            ㄴ 회원(Entity)에 주소, 직업, 연봉을 저장할지 생각해야한다.
        - 실체는 학생, 회원, 교수 등과 같이 물리적으로 존재하는 유형이 될 수 있고,
          학과, 과목 등의 개념적으로 존재하는 무형이 될 수도 있다. => 유형, 무형 둘다 가능.
        - 실체를 파악하는 요령 : 가장 중요한 것이 관련 업무의 지식이다.
    
    ㄴ. 속성(Attribute)을 추출한다.
        - 속성이란? 실체의 저장할 필요가 있는 정보이다. (=실체의 정보)
        - 속성은 실체의 성질, 분류, 수량, 상태, 특징 등의 실체의 세부 항목을 의미한다.
        - 속성의 관리 목적과 활용 방향에 따라 속성을 파악해야 한다.
        - 속성은 10개 내외가 적당하다.(중요하지는 않음)
        - 속성은 칼럼으로 정의되어진다.
        예) 회원 실체가 있다면
            ㄴ 회원ID, 회원명, 주소, 연락처가 속성이 되어질 수 있다.
            부서 실체가 있다면
            ㄴ 부서번호, 부서명, 지역명이 속성이 되어질 수 있다.
               => 관리 목적에 활용 방향이 있는 것을 파악해 추가한다.
        - 속성의 유형
            1) 기초속성 : 기본적으로 원래 가지고 있는 속성.
                학생(Entity) - 학번, 이름 등
            2) 추출속성 : 기초속성으로부터 가공처리해서 얻을 수 있는 속성.
                예) 회원(Entity) - 나이 속성(칼럼)을 만들지? 매번 바뀌기 때문에 속성으로 만들 필요없지만 성능이나 활용 목적에 따라서 만들어주기도 한다.
                                    => 주민등록번호를 기초속성이 되고 이것으로 부터 생년월일, 나이, 성별 등을 얻어올 수 있다.
            3) 설계속성 : 실제로 존재하지는 않으나 시스템의 효율성을 위해서 설계자가 임의로 부여하는 속성.
                예) 주문(Entity) - 주문번호, 고객, 상품, 일자, 수량, 금액 등 -> 속성
                                  주문상태(설계속성) : 결제완료, 배송준비중, 배송중, 배송완료 등
        - 속성 도메인 설정
            ㄴ 속성이 가질 수 있는 값들의 범위, 제약조건, 특성 등 전체적으로 정의해 주는 것을 '속성의 도메인 설정'이라고 한다.
            ㄴ 도메인 설정은 추후 개발 및 실체를 데이터베이스로 생성할 때 유용하게 사용된다.
            ㄴ 도메인을 정의할 때는 
                속성의 이름, 
                자료형, 
                자료형의 크기, 
                자료형의 형식, 
                허용되는 값의 제약조건, 
                유일성, 
                유효값, 
                초기값 등의 사항을 파악해야한다.
            ㄴ 도메인 무결성
            
     3)식별자(Identifier)
       - 식별자?
         한 실체 내에서 각각의 인스턴스를 구분할 수 있는 단일 속성 또는 속성그룹
       - 식별자가 없으면 수정, 삭제할 때 문제가 생긴다.
       - 식별자의 종류
        (1) 후보키(Candidate key)
           실체를 구분할 수 있는 속성
           예) 사원 - 사원번호, 주민번호, 이메일, 전화번호 등으로 사원을 구분할 수 있다.
        (2) 기본키(Primary key)
           후보키 중에 가장 적합한 키
           업무적 활용도나 크기(자료형의 크기는 성능을 위해서 작은 것이 좋음) 등을 파악해 사용한다.
           예) 활용도, 크기 : 사원번호를 기본키로 한다.
        (3) 대체키(Alternate key) = 후보키 - 기본키
           Index(인덱스)로 활용한다.
        (4) 복합키(Composite key)
           하나의 속성으로 기본키가 될 수 없을때나 둘 이상의 속성을 묶어서 식별자(PK)로 정의한 경우에 사용한다.
           복합키 구성 시 고려 사항 : 어떤 컬럼을 먼저 둘 것인지를 고려한다.
               ㄴ이유 : 복합키 중에 먼저 오는 컬럼에 Index, Unique 이 적용되기 때문이다.
           예) 어떤 사원의 '급여 지급 내역(Entity)' 날짜에 대해서 데이터를 저장하려고 할 때
               
               후보키, 기본키가 없다.
               [급여지급날짜 + 사원번호] 합쳐서 복합키로 선언한다.
               
               급여지급날짜     사원번호   지급일자  급여액
               202301월        1111      25일    ...
               202301월        1112      25일    ...
               202302월        1111      25일    ...

              <먼저 오는 컬럼에 Index, Unique 이 적용>
              [급여지급날짜(index) + 사원번호]
              [사원번호(index) + 급여지급일자]
        
        (5) 대리키(Surrogate key)
           --대리기사
           식별자가 너무 길거나 여러 개의 복합키로 구성된 경우
           -> 인위적으로 역정규화해서 속성(식별자)을 추가해서 사용한다.
           <대리키>
          일련번호(PK)      급여지급날짜      사원번호   지급일자  급여액
             1              202301월        1111      25일    ...
             2              202301월        1112      25일    ...
             3              202302월        1111      25일    ...
 
     4) 관계(Relational)
        - 관계란? 실체와 실체 간의 업무의 연관성을 의미한다.
        - 관계도 속성을 가질 수 있다.
        예) [학생]  수강관계  [강의]
            [고객]  주문관계  [상품]
        - 실체   [직사각형]
          속성   (타원)
          식별자  ____
          관계   <마름모>
          - 관계가 있는 두 실체는 실선으로 연결하고 관계를 부여한다.
          - 관계차수 : 
          예) 남편실체  혼인관계   아내실체 1:1
              부서실체  소속관계  사원실체 1:N
              고객실체  주문관계  상품실체 N:N
          - 선택성도 표시해야한다.
        
-- 3단계 : 논리적 모델링
 - ER-Diagram 작성
   -> 1) 5가지 규칙 (매핑룰(Mapping Rule)) : 개념적 모델링에서 도출된 개체 타입과 관계타입의 테이블 정의
   -> [릴레이션(==관계,테이블)스키마] 변환
   -> 변환만 하면 이상현상 문제가 발생할 수 있다.
   -> 2) 정규화 작업
   
   -- 용어 정리
   1) 부모테이블, 자식테이블 구분하는 기준 : 관계의 주체에 따라서 구분한다. 
      예) 고객테이블 -<주문관계>- 상품테이블
           부모                  자식
        

      예) 사원테이블 -<소속관계>- 부서테이블
           자식                  부모
        관계 형성 시기를 확인해야 한다.
        부서가 먼저 생성(정의)된 후에 사원의 부서를 정의할 수 있기 때문에   
 
   2) 기본키(PK)  참조키
      외래키(FK)
      
   3) 식별관계
        부모테이블(PK) -> 자식테이블 (FK, PK)
        BOOK             DANGA
        b_id(PK)         b_id(FK,PK)
            
      비식별관계
        부모테이블(PK) -> 자식테이블 (FK) PK (X) 일반칼럼
 
 
 
   -- 릴레이션 스키마 변환 규칙 (매핑룰)
 규칙1: 모든 개체는 릴레이션(테이블)으로 변환한다
 규칙2: 다대다(n:m) 관계는 릴레이션으로 변환한다
 규칙3: 일대다(1:n) 관계는 외래키로 표현한다
 규칙4: 일대일(1:1) 관계를 외래키로 표현한다
 
 예)
 
 남자
 1 홍길동
 2 신종혁
 
 여자
 1 홍길여
 2 신종여
 
 혼인T   FK     FK     결혼날짜   결혼식장
 1     남자1   여자2 
 
 규칙5: 다중 값 속성은 릴레이션으로 변환한다
 
 고객(회원)테이블
 회원ID, 회원명,...  취미 : "운동, 영화, 독서, 여행" (X)
                   취미 속성에 여러개의 속성값을 가진다.
                   취미 테이블을 따로 만들어야 한다.

   --정규화
   정규화 작업 2가지
   1) 이상현상 제거하는 작업을 한다.
   2) 서로 관련있는 속성들로만 테이블을 구성하도록 한다.  -> 테이블을 중복되지 않게 분리한다.
   
 - 정규화의 필요성과 이상 현상의 의미
 - 이상 현상의 종류
   1)삽입 이상
   2)갱신 이상
   3)삭제 이상

 - 함수적 종속성(FD;Functional Dependency)
   하나의 릴레이션(테이블)을 구성하는 속성(칼럼) 
   투플(하나의 레코드)에 속성들의 부분 집합을 X,Y라고 할 때,
   X 결정자 (레코드를 구별할 수 있는 고유한 키) PK 가 Y
   Y는 X의 함수적으로 종속되어 있다.
   모든 칼럼은 사원번호PK에 종속되어 있다.

   ㄴ완전 함수적 종속
   ㄴ부분 함수적 종속
   ㄴ이행 함수적 종속
   
   --완전 함수적 종속, 부분 함수적 종속
   여러 개의 속성이 모여서 하나의 기본키를 이룰 때 (=복합키일때) 복합키 전체에 어떤 속성이 종속적일 때
   "완전 함수적 종속"이라고 한다.
   
   완전 함수적 종속이 아니면 "부분 함수적 종속"이라고 한다.
   
   예)   
   [테이블]
                                        제2정규화 : 부분함수적 종속을 제거하는 작업
        <복합키>           완전함수적종속  고객ID(부분함수적종속) 부분함수적종속
   [고객ID] + [이벤트ID]    당첨여부        등급                고객명
    hong      E001          Y           gold                홍길동


    --이행 함수적 종속
    empno(PK)  ename
    X를 결정자, Y를 종속자 라고 한다
    
    X -> Y 
    Y는 X의 함수적 종속이다.
 
    X -> Y, Y -> Z 일때 다시 X -> Z
--------------------------------------------------------------------------------
1. DB 모델링
2. DB 모델링 과정
3. 요구 분석 - 요구 사항 명세서(요구 분석서)
4. 개념적 모델링 - E, A, R -> ER-Diagram 작성
5. 논리적 모델링
    ER-D -> 릴스변환5가지규칙(매핑룰)->[관계스키마]
                                    1)이상현상 - 삽,삭,갱 이상제거
                                    2)관련되지 않은 속성은 분리(분해)
                                    함수적 종속성
                                    ㄱ. 완전함수적 종속
                                    ㄴ. 부분함수적 종속
                                    ㄷ. 이행함수적 종속
--------------------------------------------------------------------------------           
-- 정규화(normalization)
-- 정규형(NF;Normal Form) : 릴레이션이 정규화된 정도

제1정규형(1NF)
 : 릴레이션에 속한 모든 속성의 도메인이 원자 값(atomic value)으로만 구성되어 있으면 제1정규형에 속한다.
---------------
회원테이블
회원ID(PK).. 취미
            영화,운동,독서 -> 원자값을 가지는 것이 아니기 때문에 정규화 해야한다.
            
홍길동       영화 INSERT 자체가 되지 않는다. 
홍길동       운동 INSERT 자체가 되지 않는다. 
홍길동       독서 INSERT 자체가 되지 않는다. 
---------------


-----------------
[취미테이블 생성]
취미번호(PK)  취미명
  1           운동
  2           영화
  3           독서
-----------------
  

------------------------------------------------ 
 회원 : 취미 는 다대다 관계 N:M -----> 새로운 테이블이 생성된다(이상현상을 제거한)
    순번 PK , 회원ID을 참조하는 FK 생성, 취미번호(FK) -----> 회원취미테이블 생성
       1      홍길동                    2
       2      홍길동                    1
       3      홍길동                    3
    
    ========> 제 1 정규형
------------------------------------------------ 

제2정규형(2NF)
 : 릴레이션이 제1정규형에 속하고, 기본키가 아닌 모든 속성이 기본키에 완전 함수 종속되면 제2정규형에 속한다.    
    (부분 함수 종속 제거) -> 완전 종속 함수로 만드는 것이 제2정규화이다.
    
    복합키
    [고객 ID + 이벤트 ID]  당첨여부  등급  할인률]   
    
    이벤트 당첨 여부 테이블
    [고객 ID + 이벤트 ID]  당첨여부
    
    고객 테이블
    [고객 ID]  등급  할인율
    
제3정규형(3NF)
 : 릴레이션이 제2정규형에 속하고, 기본키가 아닌 모든 속성이 기본키에 "이행적 함수 종속"이 되지 않으면 제3정규형에 속한다.
   이행적 함수 종속을 제거하는 작업이 제3정규화이다.

--------------------------   
   empno(PK)    ename
   결정자        종속자
     X    ->      Y
     Y는 X에 함수적 종속이다.
--------------------------  
     X -> Y , Y -> Z 일 때, X -> Z 이면 이행적 함수 종속이라고 한다.

     X      Y     Z
    고객ID  등급  할인율
    홍길동  GOLD   10%
    
    X -> Y
    Y -> Z
    X -> Z
    
    등급 테이블
     등급보다 번호로 순차적으로 잡는게 성능이 낫다.
    등급ID(번호)PK  할인율
    1               10%
    2               20%
    3               30%
    
    [고객 테이블]
    고객ID   등급ID(FK)
    홍길동    gold
    

        BCNF 보이스/코드 정규형 [ Boyce/Codd Normal Form ]
         : 릴레이션의 함수 종속 관계에서 모든 결정자가 후보키이면 보이스/코드 정규형에 속한다.
             복합키(PK) 결정자
           [고객아이디 + 인터넷강좌] 담당강사번호
              X           Y         Z
           
           (X + Y) -> Z
           Z -> Y
           
           홍길동강사 - 자바, 닷넷, MSSQL, html 등
           
           [강사스킬 테이블]
          PK   강사명   과목명
           1   홍길동   자바
           2   홍길동   닷넷
           3   홍길동   MSSQL
제4정규형(4NF)
 :릴레이션이 보이스/코드 정규형를 만족하면서, 
  함수 종속이 아닌 다치 종속(MVD;MultiValued Dependency)을 제거해야 만족할 수 있다.
  
제5정규형(5NF)
 :제5정규형은 릴레이션이 제4정규형을 만족하면서 
  후보키를 통하지 않는 조인 종속(JD;Join Dependency)을 제거해야 만족할 수 있다.





DROP TABLE user_info;

CREATE TABLE user_info(
    user_id NVARCHAR2(20) CONSTRAINT pk_user_info_user_id PRIMARY KEY CHECK(LENGTH(user_id) >= 4)
    , password NVARCHAR2(20) NOT NULL CHECK(LENGTH(password) >= 8)
    , name NVARCHAR2(5) NOT NULL
    , email NVARCHAR2(20) NOT NULL UNIQUE
    , ROLE NVARCHAR2(3) DEFAULT '일반' NOT NULL
);


CREATE TABLE SURVEY
(
SURVEY_ID NUMBER(4) PRIMARY KEY NOT NULL 
,USER_ID NVARCHAR2(20)
,START_DATE DATE DEFAULT SYSDATE NOT NULL
,END_DATE DATE NOT NULL
,TITLE VARCHAR2(20) NOT NULL
,STATE VARCHAR(20) DEFAULT '일반'
,SURVEY_ALLCNT NUMBER(10) DEFAULT 0 
,CONSTRAINT FK_SURVEY_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_INFO(user_id) ON DELETE SET NULL
);



SELECT *
FROM USER_INFO;
        
        
CREATE TABLE vote(
    SEQ NUMBER(10) NOT NULL PRIMARY KEY
    ,user_id NVARCHAR2(20) CONSTRAINT fk_user_info_user_id CHECK(LENGTH(user_id) >= 4)
    ,SURVEY_ID NUMBER(4) NOT NULL 
    ,ITEM_ID NUMBER(10) NOT NULL     
);        

DROP TABLE VOTE;     

SELECT *
FROM vote;


CREATE TABLE SURVEY_OPTION
(
SURVEY_ID NUMBER PRIMARY KEY  NOT NULL
,CONTENT_ID VARCHAR2(10)
,OPTION_CNT NUMBER(4)
,OPTION_CONTENT VARCHAR2(20)
,CONSTRAINT FK_OPTION_SURVEY_ID FOREIGN KEY(SURVEY_ID) REFERENCES SURVEY(SURVEY_ID) ON DELETE CASCADE
);






