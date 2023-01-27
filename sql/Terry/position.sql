-- ���̺� ����
CREATE TABLE "CRUNCH"."POSITION" 
(	"POSITIONCODE" NUMBER NOT NULL ENABLE, 
	"POSITIONNAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"ADMIN" CHAR(3 BYTE) DEFAULT 'no' NOT NULL ENABLE, 
	 CONSTRAINT "POSITION_PK" PRIMARY KEY ("POSITIONCODE")
);

-- position code select
select * from position order by positioncode asc;

-- ������ ���� �� ����
delete from userinfo;
drop sequence position_positioncode_seq; 
create sequence position_positioncode_seq;

-- position insert
insert into position (positioncode, positionname, admin) values (1, '���', 'no');
insert into position (positioncode, positionname, admin) values (2, '����', 'no');
insert into position (positioncode, positionname, admin) values (3, '�븮', 'no');
insert into position (positioncode, positionname, admin) values (4, '����', 'no');
insert into position (positioncode, positionname, admin) values (5, '����', 'no');
insert into position (positioncode, positionname, admin) values (6, '����', 'no');
insert into position (positioncode, positionname, admin) values (7, '�̻�', 'no');
insert into position (positioncode, positionname, admin) values (8, '���̻�', 'no');
insert into position (positioncode, positionname, admin) values (9, '�����̻�', 'no');
insert into position (positioncode, positionname, admin) values (10, '�λ���', 'no');