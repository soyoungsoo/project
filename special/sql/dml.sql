drop sequence mno_seq;
drop sequence memno_seq;
drop sequence SEQ_SCOUNT;
/* 영화 쿼리*/
CREATE SEQUENCE mno_seq
START WITH 1 INCREMENT BY 1;
/* 추가 */
INSERT INTO
Movie(Mno,title,content,genre,grade,mrun,sdate,edate,post)
VALUES (mno_seq.nextval,'1강철비','dd','한국드라마','15','117','2017-10-21','2017-12-21',null);
/* 타입 추가*/
INSERT INTO user_type(id,type) 
VALUES (1,'ADMIN');
INSERT INTO user_type(id,type) 
VALUES (2,'USER');
/* 회원 추가*/
CREATE SEQUENCE memno_seq
START WITH 1 INCREMENT BY 1;
INSERT INTO Member
VALUES (memno_seq.nextval,'admin','1234','관리자','2018-01-06','admin@koitt.com');

	SELECT m.memno, m.id, m.pwd, m.name, m.birth, m.email, ut.id, ut.type
	FROM member m,
	(SELECT user_info_type.memno, user_type.id, user_type.type
	FROM user_info_type, user_type
	WHERE user_type.id = user_info_type_id) ut
	WHERE m.memno = ut.memno ;
/* 회원 검색*/
SELECT * FROM MEMBER;
select * from USER_TYPE;
/* 회원 타입 추가*/
insert into user_info_type(memno,user_info_type_id) values (21,1);
insert into user_info_type(memno,user_info_type_id) values (21,2);

select * from USER_INFO_TYPE;
/* 상영관 추가(관, 좌석 수) */
INSERT INTO theater VALUES(1,45);
INSERT INTO theater VALUES(2,45);
INSERT INTO theater VALUES(3,45);
INSERT INTO theater VALUES(4,45);
INSERT INTO theater VALUES(5,45);
/* 상영관 조회*/
SELECT * FROM THEATER;

/*좌석 (상영관,좌석이름, 좌석 상태, 상영회차)*/
INSERT INTO seat VALUES (1,'A-1',0,1);
INSERT INTO seat VALUES (1,'A-2',0,1);
INSERT INTO seat VALUES (1,'A-3',0,1);
INSERT INTO seat VALUES (1,'A-4',0,1);
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
INSERT INTO seat VALUES (1,'E-5',0,1);

SELECT * FROM SEAT;


CREATE SEQUENCE SEQ_SCOUNT
START WITH 1 INCREMENT BY 1;


SELECT SEQ_RNO.NEXTVAL FROM DUAL;

/* 좌석 상태 변경*/
UPDATE SEAT
SET ISSUE = 1
WHERE TNO = 1 AND SEATNO = 'A-1';



SELECT R.RNO, R.MEMNO, R.MNO, R.TNO, R.SEATNO, R.BTIME,S.RDATE
FROM RESERVATION R,(SELECT * FROM SCHEDULE) S
WHERE S.MNO = R.MNO;



DELETE FROM RESERVATION WHERE RNO = 3;
INSERT INTO RESERVATION VALUES (SEQ_RNO.NEXTVAL,82,81,1,'A-1',SYSDATE);
SELECT * FROM RESERVATION;

SELECT * FROM RESERVATION WHERE MEMNO = 1;
SELECT to_char(rdate, 'yyyy-mm-dd hh24:mi') FROM SCHEDULE;
SELECT * FROM MOVIE;
SELECT * FROM SEAT;
SELECT * FROM THEATER;
CREATE SEQUENCE SEQ_SCOUNT
START WITH 1 INCREMENT BY 1;
/* 영화 스케줄 표*/
INSERT INTO SCHEDULE VALUES (to_date('18/01/17 17:00','DD/MM/RR HH24:MI'),SEQ_SCOUNT.NEXTVAL,1);
INSERT INTO SCHEDULE VALUES (to_date('18/01/17 19:00','DD/MM/RR HH24:MI'),SEQ_SCOUNT.NEXTVAL,1);

INSERT INTO SCHEDULE VALUES ('2018/01/17 17:00',SEQ_SCOUNT.NEXTVAL,1);
INSERT INTO SCHEDULE VALUES ('2018/01/17 19:00',SEQ_SCOUNT.NEXTVAL,1);

select * from schedule;
update SCHEDULE
set rdate = '2018-01-17 19:00'
where scount =2;

/* 초기*/
SELECT  S.TNO, S.SEATNO, S.ISSUE ,S.SCOUNT,SC.RDATE 
FROM SEAT S, (SELECT * FROM SCHEDULE) SC ;

update SCHEDULE
set rdate= '2018-01-17 19:00'
where mno = 81 and scount = 2 ;

/* 좌석 상태변경*/
update SEAT
set issue=1
where tno = 1 and scount = 1 and seatno='A-1';

DELETE  FROM SEAT WHERE SCOUNT =1;
/* 영화, 날짜 선택시 출력 값*/
SELECT  S.TNO, S.SEATNO, S.ISSUE ,Sc.SCOUNT,SC.RDATE, sc.mno
FROM SEAT S, (SELECT * FROM SCHEDULE) SC 
WHERE S.ISSUE s= 0  
ORDER BY  Sc.RDATE ASC;
select * from movie;

	SELECT  S.TNO, S.SEATNO, S.ISSUE ,Sc.SCOUNT,SC.RDATE, sc.mno
	FROM SEAT S, (SELECT * FROM SCHEDULE) SC 
	WHERE S.ISSUE = 0  
	ORDER BY  Sc.RDATE ASC;
	
	select distinct rdate,rdate,  tno, d,f from (
	select S.TNO, S.SEATNO, S.ISSUE ,Sc.SCOUNT,rdate, sc.mno, (select count(*) from seat where issue=0) d,(select count(*) from SEAT)f
	from seat s, (select * from schedule) sc 
	where mno = 1 and Sc.RDATE LIKE  '2018-01-17 %'
	order by  sc.rdate asc
	), movie m; 
	select* from movie;
SELECT * FROM SCHEDULE where rdate =  to_DAte('2017-01-18 17:00', 'yyyy-mm-dd hh24:mi');
SELECT count(*)  from  SEAT where issue = 0;	122		19:02
to_char(rdate, 'yyyy-mm-dd hh24:mi')
SELECT *
FROM    SCHEDULE
WHERE rdate >= '2017-01-18';

select  TO_DATE('2017-01-18 17:00', yyyy-MM-dd HH24:mm)from dual;
select 
from movie m,  
where
				select rdate, tno, seatno, issue from (
				select S.TNO, S.SEATNO, S.ISSUE ,Sc.SCOUNT,rdate, sc.mno, (select count(*) from seat where issue=0) d,(select count(*) from SEAT)f
				from seat s, (select * from schedule) sc 
				where mno = 1 and tno =1 and Sc.RDATE = '2018-01-17 17:00'
				order by s.seatno asc);

/*String*/
		select  S.TNO, S.SEATNO, S.ISSUE ,Sc.SCOUNT,SC.RDATE, sc.mno, (select count(*) from seat where issue=0) d,(select count(*) from SEAT)f
		from seat s, (select * from schedule) sc 
		where mno = 1 and  Sc.RDATE LIKE  '2018-01-17 17:00'
		order by  sc.rdate asc;

	select rdate, tno, seatno, issue from (
				select S.TNO, S.SEATNO, S.ISSUE ,Sc.SCOUNT,rdate, sc.mno, (select count(*) from seat where issue=0) d,(select count(*) from SEAT)f
				from seat s, (select * from schedule) sc 
				where mno = 1 and tno = 1 and Sc.RDATE = '2018-01-17 17:00'
				)
				
select rdate, tno, seatno, issue from (
				select S.TNO, S.SEATNO, S.ISSUE ,Sc.SCOUNT,rdate, sc.mno, (select count(*) from seat where issue=0) d,(select count(*) from SEAT)f
				from seat s, (select * from schedule) sc 
				where mno = 1 and tno = 1 and Sc.RDATE = '2018-01-17'
				order by s.seatno asc)

				
					select rdate, tno, seatno, issue from (
				select S.TNO, S.SEATNO, S.ISSUE ,Sc.SCOUNT,rdate, sc.mno, (select count(*) from seat where issue=0) d,(select count(*) from SEAT)f
				from seat s, (select * from schedule) sc 
				where mno = 1 and tno =1 and Sc.RDATE = '2018-01-17 17:00'
				)
				
DECLARE
 X NUMBER
BEGIN
X :=100
END;
/
