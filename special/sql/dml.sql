drop sequence mno_seq;
drop sequence memno_seq;
drop sequence SEQ_SCOUNT;
drop sequence seq_rno;
drop sequence seq_cno;
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
/* 추가 */
INSERT INTO
Movie(Mno,title,content,genre,grade,mrun,sdate,edate,post)
VALUES (mno_seq.nextval,'강철비','dd','한국드라마','15','117','2017-10-21','2017-12-21',null);
/* 타입 추가*/
INSERT INTO user_type(id,type) 
VALUES (1,'ADMIN');
INSERT INTO user_type(id,type) 
VALUES (2,'USER');
/* 회원 추가*/

INSERT INTO Member
VALUES (memno_seq.nextval,'admin','1234','관리자','2018-01-06','admin@koitt.com');

	SELECT m.memno, m.id, m.pwd, m.name, m.birth, m.email, ut.id, ut.type
	FROM member m,
	(SELECT user_info_type.memno, user_type.id, user_type.type
	FROM user_info_type, user_type
	WHERE user_type.id = user_info_type_id) ut
	WHERE m.memno = ut.memno;

/* 회원 타입 추가*/
insert into user_info_type(memno,user_info_type_id) values (1,1);
insert into user_info_type(memno,user_info_type_id) values (1,2);

/* 상영관 추가(관, 좌석 수) */
INSERT INTO theater VALUES(1,45);
INSERT INTO theater VALUES(2,45);
INSERT INTO theater VALUES(3,45);
INSERT INTO theater VALUES(4,45);
INSERT INTO theater VALUES(5,45);
/* 상영관 조회*/
SELECT * FROM THEATER;
select * from seat;
select * from schedule;
delete from seat where seatno = 'A-1';
/*좌석 (상영관, 좌석이름, 좌석 상태, 상영회차)*/
INSERT INTO seat VALUES (1,'A-1',0,2);
INSERT INTO seat VALUES (1,'A-2',0,2);
INSERT INTO seat VALUES (1,'A-3',0,2);
INSERT INTO seat VALUES (1,'A-4',0,2);
INSERT INTO seat VALUES (1,'A-5',0,1);
INSERT INTO seat VALUES (1,'A-6',0,1);
INSERT INTO seat VALUES (1,'A-7',0,1);
INSERT INTO seat VALUES (1,'A-8',0,1);
INSERT INTO seat VALUES (1,'A-9',0,1);
INSERT INTO seat VALUES (1,'A-10',0,1);
INSERT INTO seat VALUES (1,'B-1',0,1);
INSERT INTO seat VALUES (1,'B-2',0,1);
INSERT INTO seat VALUES (1,'B-3',0,1);
INSERT INTO seat VALUES (1,'B-4',0,1);
INSERT INTO seat VALUES (1,'B-5',0,1);
INSERT INTO seat VALUES (1,'B-6',0,1);
INSERT INTO seat VALUES (1,'B-7',0,1);
INSERT INTO seat VALUES (1,'B-8',0,1);
INSERT INTO seat VALUES (1,'B-9',0,1);
INSERT INTO seat VALUES (1,'B-10',0,1);
INSERT INTO seat VALUES (1,'C-1',0,1);
INSERT INTO seat VALUES (1,'C-2',0,1);
INSERT INTO seat VALUES (1,'C-3',0,1);
INSERT INTO seat VALUES (1,'C-4',0,1);
INSERT INTO seat VALUES (1,'C-5',0,1);
INSERT INTO seat VALUES (1,'C-6',0,1);
INSERT INTO seat VALUES (1,'C-7',0,1);
INSERT INTO seat VALUES (1,'C-8',0,1);
INSERT INTO seat VALUES (1,'C-9',0,1);
INSERT INTO seat VALUES (1,'C-10',0,1);
INSERT INTO seat VALUES (1,'D-1',0,1);
INSERT INTO seat VALUES (1,'D-2',0,1);
INSERT INTO seat VALUES (1,'D-3',0,1);
INSERT INTO seat VALUES (1,'D-4',0,1);
INSERT INTO seat VALUES (1,'D-5',0,1);
INSERT INTO seat VALUES (1,'D-6',0,1);
INSERT INTO seat VALUES (1,'D-7',0,1);
INSERT INTO seat VALUES (1,'D-8',0,1);
INSERT INTO seat VALUES (1,'D-9',0,1);
INSERT INTO seat VALUES (1,'D-10',0,1);
INSERT INTO seat VALUES (1,'E-1',0,1);
INSERT INTO seat VALUES (1,'E-2',0,1);
INSERT INTO seat VALUES (1,'E-3',0,1);
INSERT INTO seat VALUES (1,'E-4',0,1);
INSERT INTO seat VALUES (1,'E-5',0,2);

/* 영화 스케줄 표*/
INSERT INTO SCHEDULE VALUES ('2018-01-17 17:00',SEQ_SCOUNT.NEXTVAL,1);
INSERT INTO SCHEDULE VALUES ('2018-01-17 19:00',SEQ_SCOUNT.NEXTVAL,1);


select * from reservation;
delete RESERVATION where memno ='21';
delete from seat where scount = 2;
select * from seat;
update seat
set issue=0;
			
update movie
set mno = 1
where mno =6;
select * from schedule;
select * from movie;
select * from MOVIE_COMMENT where mno = 1 order by ctime desc;

select count(*) from movie_comment where mno = 1; 

insert into MOVIE_COMMENT values (SEQ_CNO.NEXTVAL, 1, 'test', '1빠다', 2, 0, sysdate);
