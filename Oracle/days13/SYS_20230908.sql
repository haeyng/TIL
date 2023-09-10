
1. ���̺� �Է�
2. ȸ�� ���� �Է�
3. ���� �Է�
4. �ɼ� �Է�
5. ��ǥ 
6. ���� ��ȸ
7. ���� ����
8. ���� ����
�����ϴ��۾�?

--------------------------------------------------------------------------------
-- 1) ���̺� �Է�

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
    , ROLE NVARCHAR2(3) DEFAULT '�Ϲ�' NOT NULL
)
----------------------------------------
CREATE TABLE SURVEY
(
SURVEY_ID NUMBER PRIMARY KEY NOT NULL 
,USER_ID NVARCHAR2(20)
,START_DATE DATE DEFAULT SYSDATE NOT NULL
,END_DATE DATE NOT NULL
,TITLE VARCHAR2(100) NOT NULL
,STATE VARCHAR(20) DEFAULT '�Ϲ�'
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
       

-- survey ������
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
-- 2) ȸ�� ���� ���
INSERT INTO USER_INFO VALUES ('teamleader','pw123123','�ű��','tlsrlqja@gmail.com','������');
INSERT INTO USER_INFO VALUES ('team1','pw124124','��渲','rhrudfla@gmail.com','ȸ��');
INSERT INTO USER_INFO VALUES ('team2','pw125125','���ؿ�','thdgodud@gmail.com','ȸ��');
INSERT INTO USER_INFO VALUES ('team3','pw126126','�̰漭','dlrudtj@gmail.com','ȸ��');
INSERT INTO USER_INFO VALUES ('team4','pw127127','�̻�','dltkdans@naver.com','ȸ��');
INSERT INTO USER_INFO VALUES ('team5','pw128128','���ֿ�','dlwndud@gmail.com','ȸ��');
INSERT INTO USER_INFO VALUES ('team6','pw129129','�Ӱ���','dlarudwo@gmail.com','ȸ��');

SELECT * FROM USER_INFO;

rollback;
--------------------------------------------------------------------------------
-- 3)���� �Է� 4) �ɼ� �Է�

INSERT INTO SURVEY VALUES (survey_seq.NEXTVAL,'admin',SYSDATE,'2023/9/15','���� ���ϴ���', '������',7,SYSDATE);
INSERT INTO survey_option VALUES(0001, '6', 2, '�ణ ����');
INSERT INTO survey_option VALUES(0001, '7', 2, '�ణ ����');
INSERT INTO survey_option VALUES(0001, '7', 2, '�̴�');


INSERT INTO SURVEY VALUES (survey_seq.NEXTVAL,'teamleader',SYSDATE,'2023/09/08','���� ���� �޴�','����',6,SYSDATE);
INSERT INTO SURVEY_OPTION VALUES (0002,'1',4,'������');
INSERT INTO SURVEY_OPTION VALUES (0002,'2',4,'�Ľ�Ÿ');
INSERT INTO SURVEY_OPTION VALUES (0002,'3',4,'���');


INSERT INTO SURVEY VALUES (survey_seq.NEXTVAL,'team1',SYSDATE,'2023/10/09','�����ϴ� ���̵� ����','������',3,SYSDATE);
INSERT INTO survey_option VALUES(0003, '6', 2, 'Ȳ����');
INSERT INTO survey_option VALUES(0003, '6', 2, '�輺��');
INSERT INTO survey_option VALUES(0003, '6', 2, 'XIA�ؼ�');
INSERT INTO survey_option VALUES(0003, '6', 2, 'ī����');
INSERT INTO survey_option VALUES(0003, '6', 2, 'ī����');


INSERT INTO survey VALUES(survey_seq.NEXTVAL,'team1',SYSDATE,'2023/09/07','���� �� ��õ','������',3,SYSDATE);
INSERT INTO survey_option VALUES(0004,'1',3,'��Ʈ');
INSERT INTO survey_option VALUES(0004,'2',3,'��Ʈ');
INSERT INTO survey_option VALUES(0004,'3',3,'������');

INSERT INTO survey VALUES(survey_seq.NEXTVAL,'team5',SYSDATE,'2023/07/25','�ް��� ��õ','��������',4,SYSDATE);
INSERT INTO survey_option VALUES(0005,'1',4,'����');
INSERT INTO survey_option VALUES(0005,'2',4,'���ֵ�');
INSERT INTO survey_option VALUES(0005,'3',4,'����');
INSERT INTO survey_option VALUES(0005,'4',4,'�λ�');

INSERT INTO survey VALUES(survey_seq.NEXTVAL,'team6',SYSDATE,'2023/10/26','�Ϸ� �޴��� �̿� �ð�','������',6,SYSDATE);
INSERT INTO survey_option VALUES(0006,'1',6,'0~2�ð�');
INSERT INTO survey_option VALUES(0006,'2',6,'2~4�ð�');
INSERT INTO survey_option VALUES(0006,'3',6,'4~6�ð�');
INSERT INTO survey_option VALUES(0006,'4',6,'6~8�ð�');
INSERT INTO survey_option VALUES(0006,'5',6,'8~10�ð�');
INSERT INTO survey_option VALUES(0006,'6',6,'10�ð� �̻�');


SELECT * FROM SURVEY;
SELECT * FROM SURVEY_OPTION;
ROLLBACK;
--------------------------------------------------------------------------------
-- 5) ��ǥ ������ ��

INSERT INTO VOTE VALUES (�������̵�,�����̾��̵�,����Ʈ���̵�);
INSERT INTO VOTE VALUES ('team1' ,1,'a0001');

SELECT v.user_id, v.survey_id, item_id, option_cnt, option_content
FROM VOTE v, SURVEY_OPTION s
where v.SURVEY_ID = s.SURVEY_ID;

--------------------------------------------------------------------------------
-- 6) ���� ��� ���
CREATE OR REPLACE VIEW COUNT_SURVEY AS
SELECT SURVEY_ID, COUNT(*)votec
FROM VOTE
GROUP BY SURVEY_ID;

SELECT s.survey_id, title, start_date, end_date, NVL(votec,0), state
FROM survey s,COUNT_SURVEY c
WHERE s.survey_id = c.survey_id(+)
ORDER BY survey_id desc;