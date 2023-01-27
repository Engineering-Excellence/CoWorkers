-- 테이블 생성
CREATE TABLE "CRUNCH"."USERINFO" 
(	"USERID" NUMBER NOT NULL ENABLE, 
	"ACCOUNTID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"ACCOUNTPASSWORD" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"USERNAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"REGISTERNUMBER" CHAR(13 BYTE) NOT NULL ENABLE, 
	"MOBILENUMBER" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
	"GENDER" VARCHAR2(6 BYTE) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"JOINDATE" DATE DEFAULT sysdate, 
	"RETIREDATE" DATE, 
	"POSITIONCODE" NUMBER, 
	 CONSTRAINT "USERINFO_PK" PRIMARY KEY ("USERID")
);

-- 테이블 확인
select * from userinfo;

-- 시퀀스 생성 및 제거
delete from userinfo;
drop sequence userinfo_userid_seq; 
create sequence userinfo_userid_seq;

-- 더미데이터 삽입
insert into userinfo(userid, accountid, accountpassword, username, registernumber, mobilenumber, gender, email, positioncode)
values (userinfo_userid_seq.nextval, 'gemini', '12131415', '김재민', '9101011245124', '01021132323', 'male', 'kjy@naver.com', 3);
insert into userinfo(userid, accountid, accountpassword, username, registernumber, mobilenumber, gender, email, positioncode)
values (userinfo_userid_seq.nextval, 'nokenoke', '10293847', '김녹녹', '8302131256132', '01012314231', 'female', 'knock@naver.com', 4);
insert into userinfo(userid, accountid, accountpassword, username, registernumber, mobilenumber, gender, email, positioncode)
values (userinfo_userid_seq.nextval, 'jjonggu', '12345678', '박지용', '5809231231212', '01021112222', 'male', 'youndu@naver.com', 7);
insert into userinfo(userid, accountid, accountpassword, username, registernumber, mobilenumber, gender, email, positioncode)
values (userinfo_userid_seq.nextval, 'jjanggu', '23456789', '김지용', '6903222849574', '01035083929', 'female', 'mattuiki@naver.com', 6);
insert into userinfo(userid, accountid, accountpassword, username, registernumber, mobilenumber, gender, email, positioncode)
values (userinfo_userid_seq.nextval, 'jjangaa', '34567891', '임창정', '8703132152123', '01078992034', 'male', 'lambda@naver.com', 10);
insert into userinfo(userid, accountid, accountpassword, username, registernumber, mobilenumber, gender, email, positioncode)
values (userinfo_userid_seq.nextval, 'dully', '45678912', '홍길동', '9503211522342', '01044013890', 'male', 'java@naver.com', 1);
insert into userinfo(userid, accountid, accountpassword, username, registernumber, mobilenumber, gender, email, positioncode)
values (userinfo_userid_seq.nextval, 'picolo', '56789123', '장발장', '9412311232232', '01072839281', 'male', 'python@naver.com', 1);
insert into userinfo(userid, accountid, accountpassword, username, registernumber, mobilenumber, gender, email, positioncode)
values (userinfo_userid_seq.nextval, 'ssamjang', '67891234', '피노키오', '9101201231312', '01094613467', 'male', 'jquery@naver.com', 5);
insert into userinfo(userid, accountid, accountpassword, username, registernumber, mobilenumber, gender, email, positioncode)
values (userinfo_userid_seq.nextval, 'jjondiki', '78912345', '쫀디기', '7603192211559', '01045612852', 'female', 'jstl@naver.com', 5);
insert into userinfo(userid, accountid, accountpassword, username, registernumber, mobilenumber, gender, email, positioncode)
values (userinfo_userid_seq.nextval, 'ramyeon', '89123456', '만두라면', '8304222123209', '01089077545', 'female', 'jeondal@naver.com', 7);
insert into userinfo(userid, accountid, accountpassword, username, registernumber, mobilenumber, gender, email, positioncode)
values (userinfo_userid_seq.nextval, 'anirago', '91234567', '아나고', '9109201250991', '01012305991', 'male', 'dramsram@naver.com', 8);
insert into userinfo(userid, accountid, accountpassword, username, registernumber, mobilenumber, gender, email, positioncode)
values (userinfo_userid_seq.nextval, 'kingbat', '13479125', '킹받드', '9102242215167', '01029005899', 'female', 'question@naver.com', 10);
insert into userinfo(userid, accountid, accountpassword, username, registernumber, mobilenumber, gender, email, positioncode)
values (userinfo_userid_seq.nextval, 'punchcrunch', '75369852', '크런치', '9008292214234', '01028761010', 'female', 'rondo@naver.com', 12);

-- 직급 (FK) 설정
alter table userinfo add constraint fk_positioncode foreign key(positioncode) references position(positioncode);

commit;