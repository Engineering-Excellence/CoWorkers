-- 테이블 생성
CREATE TABLE "CRUNCH"."POSITION" 
(	"POSITIONCODE" NUMBER NOT NULL ENABLE, 
	"POSITIONNAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"ADMIN" CHAR(3 BYTE) DEFAULT 'no' NOT NULL ENABLE, 
	 CONSTRAINT "POSITION_PK" PRIMARY KEY ("POSITIONCODE")
);

-- position code select
select * from position order by positioncode asc;

-- 시퀀스 생성 및 제거
delete from userinfo;
drop sequence position_positioncode_seq; 
create sequence position_positioncode_seq;

-- position insert
insert into position (positioncode, positionname, admin) values (1, '사원', 'no');
insert into position (positioncode, positionname, admin) values (2, '주임', 'no');
insert into position (positioncode, positionname, admin) values (3, '대리', 'no');
insert into position (positioncode, positionname, admin) values (4, '과장', 'no');
insert into position (positioncode, positionname, admin) values (5, '차장', 'no');
insert into position (positioncode, positionname, admin) values (6, '부장', 'no');
insert into position (positioncode, positionname, admin) values (7, '이사', 'no');
insert into position (positioncode, positionname, admin) values (8, '상무이사', 'no');
insert into position (positioncode, positionname, admin) values (9, '전무이사', 'no');
insert into position (positioncode, positionname, admin) values (10, '부사장', 'no');