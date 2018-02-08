drop sequence mno_seq;
drop sequence seq_rno;
drop sequence memno_seq;
drop sequence SEQ_SCOUNT;
drop sequence seq_cno;
drop sequence seq_ano;
drop sequence seq_ino;
/* 영화 쿼리*/
CREATE SEQUENCE MNO_SEQ
START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_RNO
START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE MEMNO_SEQ
START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_SCOUNT
START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_CNO
START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ANO
START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_INO
START WITH 1 INCREMENT BY 1;
select * from actors
/* 타입 추가*/
INSERT INTO user_type(id,type) 
VALUES (1,'ADMIN');
INSERT INTO user_type(id,type) 
VALUES (2,'USER');
/* 회원 타입 추가*/
insert into user_info_type(memno,user_info_type_id) values (2,1);
insert into user_info_type(memno,user_info_type_id) values (1,2);
/* 상영관 추가(관, 좌석 수) */
INSERT INTO theater VALUES(1,45);
INSERT INTO theater VALUES(2,45);
INSERT INTO theater VALUES(3,45);
INSERT INTO theater VALUES(4,45);
INSERT INTO theater VALUES(5,45);
