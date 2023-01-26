-- EVENT TABLE 생성
DROP TABLE "CRUNCH"."EVENT";
CREATE TABLE "CRUNCH"."EVENT"
(
    "EVENTID"      NUMBER(*,0) NOT NULL,
    "SUBJECT"      VARCHAR2(100 BYTE) NOT NULL,
    "USERNAME"     VARCHAR2(20 BYTE) NOT NULL,
    "CONTENT"      VARCHAR2(2000 BYTE) NOT NULL,
    "EVENTCOLOR"   VARCHAR2(7 BYTE) DEFAULT '#E1E1E0',
    "ALLDAY"       VARCHAR2(5 BYTE) DEFAULT 'FALSE',
    "STARTDATE"    DATE NOT NULL,
    "ENDDATE"      DATE NOT NULL,
    "WRITEDATE"    DATE   DEFAULT SYSDATE,
    "UPDATEDATE"   DATE,
    "DELETEDATE"   DATE,
    "HIT"          NUMBER(*,0) DEFAULT 0,
    "IP"           VARCHAR2(20 BYTE),
    "USERID"       NUMBER(*,0) NOT NULL,
    "COMMENTCOUNT" NUMBER(*,0) DEFAULT 0,
    "GROUPID"      NUMBER DEFAULT 0,
    "TEXTCOLOR"    VARCHAR2(10 BYTE) DEFAULT 'BLACK',
    "BORDERCOLOR"  VARCHAR2(10 BYTE) DEFAULT 'GRAY',
    CONSTRAINT "EVENT_PK" PRIMARY KEY ("EVENTID")
);

ALTER TABLE EVENT
    ADD CONSTRAINT EVENT_FK FOREIGN KEY (USERID) REFERENCES USERINFO (USERID);

-- 테이블 내용 삭제 및 시퀀스 생성, 시퀀스 1로 초기화
DELETE
FROM EVENT;
DROP SEQUENCE EVENT_IDX_SEQ;
CREATE SEQUENCE EVENT_IDX_SEQ;

-- 더미
INSERT INTO EVENT (EVENTID, GROUPID,
                   USERNAME,
                   USERID,
                   SUBJECT,
                   CONTENT,
                   STARTDATE,
                   ENDDATE,
                   EVENTCOLOR,
                   HIT,
                   IP,
                   ALLDAY,
                   COMMENTCOUNT,
                   TEXTCOLOR,
                   BORDERCOLOR)
VALUES (EVENT_IDX_SEQ.NEXTVAL, NULL,
        'EMMA',
        1111,
        'TEST1',
        'TEST1 CONTENT',
        '2023-01-04',
        '2023-01-04',
        '#E1E1E0',
        0,
        '0:0:0:0:0:0:0:1',
        'FALSE',
        0,
        'BLACK',
        'GRAY');

INSERT INTO EVENT (EVENTID, GROUPID,
                   USERNAME,
                   USERID,
                   SUBJECT,
                   CONTENT,
                   STARTDATE,
                   ENDDATE,
                   EVENTCOLOR,
                   HIT,
                   IP,
                   ALLDAY,
                   COMMENTCOUNT,
                   TEXTCOLOR,
                   BORDERCOLOR)
VALUES (EVENT_IDX_SEQ.NEXTVAL, NULL,
        'EMMA',
        1111,
        'TEST2',
        'TEST2 CONTENT',
        '2023-01-04',
        '2023-01-06',
        '#E1E1E0',
        0,
        '0:0:0:0:0:0:0:1',
        'FALSE',
        0,
        'BLACK',
        'GRAY');

INSERT INTO EVENT (EVENTID, GROUPID,
                   USERNAME,
                   USERID,
                   SUBJECT,
                   CONTENT,
                   STARTDATE,
                   ENDDATE,
                   EVENTCOLOR,
                   HIT,
                   IP,
                   ALLDAY,
                   COMMENTCOUNT,
                   TEXTCOLOR,
                   BORDERCOLOR)
VALUES (EVENT_IDX_SEQ.NEXTVAL, NULL,
        'EMMA',
        1111,
        'TEST3',
        'TEST3 CONTENT',
        '2023-01-10',
        '2023-01-16',
        '#E1E1E0',
        0,
        '0:0:0:0:0:0:0:1',
        'FALSE',
        0,
        'BLACK',
        'GRAY');

INSERT INTO EVENT (EVENTID, GROUPID,
                   USERNAME,
                   USERID,
                   SUBJECT,
                   CONTENT,
                   STARTDATE,
                   ENDDATE,
                   EVENTCOLOR,
                   HIT,
                   IP,
                   ALLDAY,
                   COMMENTCOUNT,
                   TEXTCOLOR,
                   BORDERCOLOR)
VALUES (EVENT_IDX_SEQ.NEXTVAL, NULL,
        'EMMA',
        1111,
        'TEST4',
        'TEST4 CONTENT',
        '2023-01-07',
        '2023-01-07',
        '#E1E1E0',
        0,
        '0:0:0:0:0:0:0:1',
        'TRUE',
        0,
        'BLACK',
        'GRAY');


INSERT INTO EVENT (EVENTID, GROUPID,
                   USERNAME,
                   USERID,
                   SUBJECT,
                   CONTENT,
                   STARTDATE,
                   ENDDATE,
                   EVENTCOLOR,
                   HIT,
                   IP,
                   ALLDAY,
                   COMMENTCOUNT,
                   TEXTCOLOR,
                   BORDERCOLOR)
VALUES (EVENT_IDX_SEQ.NEXTVAL, NULL,
        'EMMA',
        1111,
        'TEST5',
        'TEST5 CONTENT',
        '2023-01-08',
        '2023-01-20',
        '#E1E1E0',
        0,
        '0:0:0:0:0:0:0:1',
        'TRUE',
        0,
        'BLACK',
        'GRAY');

SELECT *
FROM EVENT;


COMMIT;



INSERT INTO EVENT (EVENTID, GROUPID,
                   USERNAME,
                   USERID,
                   SUBJECT,
                   CONTENT,
                   STARTDATE,
                   ENDDATE,
                   EVENTCOLOR,
                   HIT,
                   IP,
                   ALLDAY,
                   COMMENTCOUNT,
                   TEXTCOLOR,
                   BORDERCOLOR,
                   WRITEDATE)
VALUES (EVENT_IDX_SEQ.NEXTVAL, NULL,
        'EMMA',
        '1111',
        'INSERTTEST4',
        'INSERTTEST4 CONTENT',
        TO_TIMESTAMP('2023-01-10 11:00:00.0', 'YYYY-MM-DD HH24:MI:SS.FF1'),
        TO_TIMESTAMP('2023-01-12 20:00:00.0', 'YYYY-MM-DD HH24:MI:SS.FF1'),
        '#FAFFCD',
        0,
        '0:0:0:0:0:0:0:1',
        'FALSE',
        0,
        'BLACK',
        'WHITE',
        SYSDATE);