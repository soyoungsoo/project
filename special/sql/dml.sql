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
CREATE SEQUENCE SEQ_ANO
START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_INO
START WITH 1 INCREMENT BY 1;
/* 추가 */
INSERT INTO
Movie(Mno,title,content,genre,grade,mrun,sdate,edate,post)
VALUES (mno_seq.nextval,'코코','dd','영원히 기억하고 싶은 황홀한 모험이 시작된다!

뮤지션을 꿈꾸는 소년 미구엘은 전설적인 가수 에르네스토의 기타에 손을 댔다 ‘죽은 자들의 세상’에 들어가게 된다.
그리고 그곳에서 만난 의문의 사나이 헥터와 함께 상상조차 못했던 모험을 시작하게 되는데…
과연 ‘죽은 자들의 세상’에 숨겨진 비밀은? 그리고 미구엘은 무사히 현실로 돌아올 수 있을까?','애니메이션','전체이용가','120','2018-01-21','2018-05-20',null);
/* 타입 추가*/
INSERT INTO user_type(id,type) 
VALUES (1,'ADMIN');
INSERT INTO user_type(id,type) 
VALUES (2,'USER');
/* 회원 추가*/
INSERT INTO Member
VALUES (memno_seq.nextval,'admin','1234','관리자','2018-01-06','admin@koitt.com');


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

select rdate, tno, seatno, issue, scount, d, f from (
			select S.TNO, S.SEATNO, S.ISSUE ,Sc.SCOUNT,rdate, sc.mno,(select count(*) from seat where issue=0 and scount=1)d ,(select count(*) from SEAT)f
			from seat s, (select * from schedule) sc 
			where mno = 1 and tno = 1 and Sc.RDATE = '2018-01-17 19:00' and s.scount=sc.scount
			)
INSERT INTO Actors VALUES(seq_ano.nextval,1,'하정우','배우');
INSERT INTO reservation VALUES(seq_rno.nextval,21,1,1,'E-1',sysdate,1);
		
SELECT * from reservation where memno = 1; 
	DELETE FROM RESERVATION WHERE rno = #{rno}
select * from reservation;
select * from movie_intro;
delete from movie_intro where ino =3;
delete from movie_intro where ino =4;
delete from movie_intro where ino =5;
delete from movie_intro where ino =6;
select * from schedule where rdate = '2018-01-16 01:20';
select * from seat where scount =66
	
select * from movie_comment
select * from seat;
select * from schedule;
/*전체평점*/
select NVL(sum(score)/NULLIF(count(*),0),0) from movie_comment WHERE mno = #{mno};
/* 관람객 수*/
select count(*) from reservation where mno =1; 

/* 예매율 */    
SELECT NVL((SELECT COUNT(*) FROM RESERVATION) / NULLIF((SELECT COUNT(*) FROM SCHEDULE SC, SEAT S WHERE SC.SCOUNT = S.SCOUNT AND MNO = 2), 0 ), 0 ) FROM DUAL

	select rdate, Scount,  d, f from
	(select distinct rdate, Scount, d,f from (
			select S.TNO, S.SEATNO, S.ISSUE ,Sc.SCOUNT,rdate, sc.mno, (select count(*) from seat where issue=0) d,(select count(*) from SEAT)f
			from seat s, (select * from schedule) sc 
			where mno = 21 and Sc.RDATE LIKE  '2018-01-17 %'
			))
			select * from seat where scount = 87;
			
			
			
			
			select * from reservation
			select * from seat s, schedule sc  where sc.scount= s.scount;
			
			select distinct rdate, tno, Scount, d,f from (
			select S.TNO, S.SEATNO, S.ISSUE ,Sc.SCOUNT,rdate, sc.mno, (select count(*) from seat where issue=0) d,(select count(*) from SEAT)f
			from seat s, (select * from schedule) sc 
			where mno = 1 and Sc.RDATE LIKE   '2018-02-04%'	 and s.scount=sc.scount
			)	order by rdate asc
			
			
					select rdate, tno, seatno, issue, scount, d, f from (
			select S.TNO, S.SEATNO, S.ISSUE ,Sc.SCOUNT,rdate, sc.mno, (select count(*) from seat where issue=0 and scount =85) d,(select count(*) from SEAT WHERE scount =85)f
			from seat s, (select * from schedule) sc 
			where mno = 1 and sc.tno = 1 and Sc.RDATE = '2018-01-17 19:00' and s.scount=sc.scount
			)