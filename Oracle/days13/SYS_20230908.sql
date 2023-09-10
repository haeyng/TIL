
1. 테이블 입력
2. 회원 정보 입력
3. 설문 입력
4. 옵션 입력
5. 투표 
6. 설문 조회
7. 설문 수정
8. 설문 삭제
설문하는작업?

--------------------------------------------------------------------------------
-- 1) 테이블 입력

DROP TABLE user_info;
DROP TABLE SURVEY;
DROP TABLE vote;
DROP TABLE SURVEY_OPTION;
DROP TABLE vote_seq;
----------------------------------------
CREATE TABLE user_info(
    user_id NVARCHAR2(20) CONSTRAINT pk_user_info_user_id PRIMARY KEY CHECK(LENGTH(user_id) >= 4)
    , password NVARCHAR2(20) NOT NULL CHECK(LENGTH(password) >= 8)
    , name NVARCHAR2(5) NOT NULL
    , email NVARCHAR2(20) NOT NULL UNIQUE
    , ROLE NVARCHAR2(3) DEFAULT '일반' NOT NULL
)
----------------------------------------
CREATE TABLE SURVEY
(
SURVEY_ID NUMBER PRIMARY KEY NOT NULL 
,USER_ID NVARCHAR2(20)
,START_DATE DATE DEFAULT SYSDATE NOT NULL
,END_DATE DATE NOT NULL
,TITLE VARCHAR2(100) NOT NULL
,STATE VARCHAR(20) DEFAULT '일반'
,SURVEY_ALLCNT NUMBER(10) DEFAULT 0 
,CONSTRAINT FK_SURVEY_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_INFO(user_id) ON DELETE SET NULL
,REGDATE DATE DEFAULT SYSDATE
);

----------------------------------------
CREATE TABLE SURVEY_OPTION
(
SURVEY_ID NUMBER   NOT NULL
,CONTENT_ID VARCHAR2(10)
,OPTION_CNT NUMBER(4)
,OPTION_CONTENT VARCHAR2(20)
,CONSTRAINT FK_OPTION_SURVEY_ID FOREIGN KEY(SURVEY_ID) REFERENCES SURVEY(SURVEY_ID) ON DELETE CASCADE
, CONSTRAINT survey_option_pk PRIMARY KEY(survey_id, content_id)
);
----------------------------------------
CREATE TABLE vote(
    user_id NVARCHAR2(20) CONSTRAINT fk_user_info_user_id REFERENCES user_info(user_id) CHECK(LENGTH(user_id) >= 4)
    , SURVEY_ID NUMBER(4) NOT NULL 
    , ITEM_ID VARCHAR2(10) NOT NULL     
    ,FOREIGN KEY (ITEM_ID, SURVEY_ID) REFERENCES SURVEY_OPTION(CONTENT_ID, SURVEY_ID)
    , CONSTRAINT vote_pk PRIMARY KEY(survey_id, user_id)
); 

----------------------------------------
CREATE SEQUENCE vote_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
       

-- survey 시퀀스
CREATE SEQUENCE survey_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 9999
NOCYCLE
NOCACHE
NOORDER;       
----------------------------------------
       INSERT INTO SURVEY_OPTION VALUES (1,'1',0,'test1');
       INSERT INTO SURVEY_OPTION VALUES (1,'2',0,'test2');
        SELECT * FROM SURVEY_OPTION;
       INSERT INTO VOTE VALUES (vote_seq.NEXTVAL,'pilot',1,'1');
       SELECT * FROM vote;
       
       
       rollback;
--------------------------------------------------------------------------------
-- 2) 회원 정보 등록
INSERT INTO USER_INFO VALUES ('teamleader','pw123123','신기범','tlsrlqja@gmail.com','관리자');
INSERT INTO USER_INFO VALUES ('team1','pw124124','고경림','rhrudfla@gmail.com','회원');
INSERT INTO USER_INFO VALUES ('team2','pw125125','송해영','thdgodud@gmail.com','회원');
INSERT INTO USER_INFO VALUES ('team3','pw126126','이경서','dlrudtj@gmail.com','회원');
INSERT INTO USER_INFO VALUES ('team4','pw127127','이상문','dltkdans@naver.com','회원');
INSERT INTO USER_INFO VALUES ('team5','pw128128','이주영','dlwndud@gmail.com','회원');
INSERT INTO USER_INFO VALUES ('team6','pw129129','임경재','dlarudwo@gmail.com','회원');

SELECT * FROM USER_INFO;

rollback;
--------------------------------------------------------------------------------
-- 3)설문 입력 4) 옵션 입력

INSERT INTO SURVEY VALUES (survey_seq.NEXTVAL,'admin',SYSDATE,'2023/9/15','조장 잘하는지', '진행중',7,SYSDATE);
INSERT INTO survey_option VALUES(0001, '6', 2, '약간 잘함');
INSERT INTO survey_option VALUES(0001, '7', 2, '약간 부족');
INSERT INTO survey_option VALUES(0001, '7', 2, '미달');


INSERT INTO SURVEY VALUES (survey_seq.NEXTVAL,'teamleader',SYSDATE,'2023/09/08','오늘 저녁 메뉴','마감',6,SYSDATE);
INSERT INTO SURVEY_OPTION VALUES (0002,'1',4,'샐러드');
INSERT INTO SURVEY_OPTION VALUES (0002,'2',4,'파스타');
INSERT INTO SURVEY_OPTION VALUES (0002,'3',4,'돈까스');


INSERT INTO SURVEY VALUES (survey_seq.NEXTVAL,'team1',SYSDATE,'2023/10/09','좋아하는 아이돌 고르기','진행중',3,SYSDATE);
INSERT INTO survey_option VALUES(0003, '6', 2, '황민현');
INSERT INTO survey_option VALUES(0003, '6', 2, '김성규');
INSERT INTO survey_option VALUES(0003, '6', 2, 'XIA준수');
INSERT INTO survey_option VALUES(0003, '6', 2, '카리나');
INSERT INTO survey_option VALUES(0003, '6', 2, '카즈하');


INSERT INTO survey VALUES(survey_seq.NEXTVAL,'team1',SYSDATE,'2023/09/07','가을 옷 추천','진행중',3,SYSDATE);
INSERT INTO survey_option VALUES(0004,'1',3,'니트');
INSERT INTO survey_option VALUES(0004,'2',3,'코트');
INSERT INTO survey_option VALUES(0004,'3',3,'맨투맨');

INSERT INTO survey VALUES(survey_seq.NEXTVAL,'team5',SYSDATE,'2023/07/25','휴가지 추천','설문종료',4,SYSDATE);
INSERT INTO survey_option VALUES(0005,'1',4,'속초');
INSERT INTO survey_option VALUES(0005,'2',4,'제주도');
INSERT INTO survey_option VALUES(0005,'3',4,'강릉');
INSERT INTO survey_option VALUES(0005,'4',4,'부산');

INSERT INTO survey VALUES(survey_seq.NEXTVAL,'team6',SYSDATE,'2023/10/26','하루 휴대폰 이용 시간','진행중',6,SYSDATE);
INSERT INTO survey_option VALUES(0006,'1',6,'0~2시간');
INSERT INTO survey_option VALUES(0006,'2',6,'2~4시간');
INSERT INTO survey_option VALUES(0006,'3',6,'4~6시간');
INSERT INTO survey_option VALUES(0006,'4',6,'6~8시간');
INSERT INTO survey_option VALUES(0006,'5',6,'8~10시간');
INSERT INTO survey_option VALUES(0006,'6',6,'10시간 이상');


SELECT * FROM SURVEY;
SELECT * FROM SURVEY_OPTION;
ROLLBACK;
--------------------------------------------------------------------------------
-- 5) 투표 참여자 수

INSERT INTO VOTE VALUES (유저아이디,서베이아이디,컨텐트아이디);
INSERT INTO VOTE VALUES ('team1' ,1,'a0001');

SELECT v.user_id, v.survey_id, item_id, option_cnt, option_content
FROM VOTE v, SURVEY_OPTION s
where v.SURVEY_ID = s.SURVEY_ID;

--------------------------------------------------------------------------------
-- 6) 설문 목록 출력
CREATE OR REPLACE VIEW COUNT_SURVEY AS
SELECT SURVEY_ID, COUNT(*)votec
FROM VOTE
GROUP BY SURVEY_ID;

SELECT s.survey_id, title, start_date, end_date, NVL(votec,0), state
FROM survey s,COUNT_SURVEY c
WHERE s.survey_id = c.survey_id(+)
ORDER BY survey_id desc;