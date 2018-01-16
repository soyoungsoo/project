/* 영화 쿼리*/9
CREATE SEQUENCE mno_seq
START WITH 1 INCREMENT BY 1;
/* 검색 */
SELECT * FROM MOVIE;
/* 삭제*/
DELETE FROM MOVIE WHERE Mno=28;
/* 수정*/
UPDATE movie 
SET title = '1987', content = '내용', genre = '한국 드라마', grade = '15세 이용가', mrun = '117분', sdate = '2017-12-27', edate = '2017-12-29', post = null 
WHERE mno = 11;
/* 추가 */
INSERT INTO
Movie(Mno,title,content,genre,grade,mrun,sdate,edate,post)
VALUES (mno_seq.nextval,'강철비','dd','한국드라마','15','117','2017-10-21','2017-12-21',null);
select* from MOVIE;

INSERT INTO user_type(id,type) 
VALUES (1,'admin');
select * from movie;
/* 회원 추가*/
CREATE SEQUENCE memno_seq
START WITH 1 INCREMENT BY 1;
DROP SEQUENCE memno_seq;
INSERT INTO Member(memno,id,pwd,name,birth,email) 
VALUES (memno_seq.nextval,'admin','1234','관리자','2018-01-06','admin@koitt.com');
	
SELECT * FROM MEMBER;
delete  from MEMBER where id='111';
delete  from MEMBER where memno=21;

INSERT INTO user_type(id,type) 
VALUES (22,'ADMIN');

INSERT INTO user_type(id,type) 
VALUES (2,'USER');

insert into user_info_type(memno,user_info_type_id) values (22,1);
insert into user_info_type(memno,user_info_type_id) values (5,2);


	INSERT INTO Member
		VALUES (memno_seq.nextval,'111','d','d','2222-02-02','koitt@koitt.com');
select * from member; 

INSERT INTO Member(memno,id,pwd,name,birth,email) 
		VALUES (#{memno}, #{id}, #{pwd}, #{name}, #{birth},#{email})
		
		
select * from theater;

INSERT INTO theater VALUES(1,45);
INSERT INTO theater VALUES(2,45);
INSERT INTO theater VALUES(3,45);
INSERT INTO theater VALUES(4,45);
INSERT INTO theater VALUES(5,45);



INSERT INTO seat VALUES (1,'A-1',0,e);
INSERT INTO seat VALUES (1,'A-2',0,e);
INSERT INTO seat VALUES (1,'A-3',0,e);
INSERT INTO seat VALUES (1,'A-4',0,e);
INSERT INTO seat VALUES (1,'A-5',0,e);

INSERT INTO seat VALUES (1,'A-6',0,e);
INSERT INTO seat VALUES (1,'A-7',0,e);
INSERT INTO seat VALUES (1,'A-8',0,e);
INSERT INTO seat VALUES (1,'A-9',0,e);
INSERT INTO seat VALUES (1,'A-10',0,e);

INSERT INTO seat VALUES (1,'A-11',0,e);
INSERT INTO seat VALUES (1,'A-12',0,e);
INSERT INTO seat VALUES (1,'A-13',0,e);
INSERT INTO seat VALUES (1,'A-14',0,e);
INSERT INTO seat VALUES (1,'A-15',0,e);

INSERT INTO seat VALUES (1,'B-1',0,e);
INSERT INTO seat VALUES (1,'B-2',0,e);
INSERT INTO seat VALUES (1,'B-3',0,e);
INSERT INTO seat VALUES (1,'B-4',0,e);
INSERT INTO seat VALUES (1,'B-5',0,e);

INSERT INTO seat VALUES (1,'B-6',0,e);
INSERT INTO seat VALUES (1,'B-7',0,e);
INSERT INTO seat VALUES (1,'B-8',0,e);
INSERT INTO seat VALUES (1,'B-9',0,e);
INSERT INTO seat VALUES (1,'B-10',0,e);

INSERT INTO seat VALUES (1,'B-11',0,e);
INSERT INTO seat VALUES (1,'B-12',0,e);
INSERT INTO seat VALUES (1,'B-13',0,e);
INSERT INTO seat VALUES (1,'B-14',0,e);
INSERT INTO seat VALUES (1,'B-15',0,e);


INSERT INTO seat VALUES (1,'C-1',0,e);
INSERT INTO seat VALUES (1,'C-2',0,e);
INSERT INTO seat VALUES (1,'C-3',0,e);
INSERT INTO seat VALUES (1,'C-4',0,e);
INSERT INTO seat VALUES (1,'C-5',0,e);

INSERT INTO seat VALUES (1,'C-6',0,e);
INSERT INTO seat VALUES (1,'C-7',0,e);
INSERT INTO seat VALUES (1,'C-8',0,e);
INSERT INTO seat VALUES (1,'C-9',0,e);
INSERT INTO seat VALUES (1,'C-10',0,e);

INSERT INTO seat VALUES (1,'C-11',0,e);
INSERT INTO seat VALUES (1,'C-12',0,e);
INSERT INTO seat VALUES (1,'C-13',0,e);
INSERT INTO seat VALUES (1,'C-14',0,e);
INSERT INTO seat VALUES (1,'C-15',0,e);

CREATE SEQUENCE SEQ_bNO
START WITH 1 INCREMENT BY 1;
SELECT * FROM movie;
select seq_rno.nextval from dual;

SELECT * FROM seat;
UPDATE SEAT
SET ISSUE = 1
WHERE TNO = 1 AND SEATNO = 'A-1';



SELECT r.rno, r.memno, r.mno, r.tno, r.seatno, r.btime,s.rdate
FROM reservation r,(SELECT * FROM Schedule) s
WHERE s.mno = r.mno;



drop sequence seq_bno;
DELETE FROM RESERVATION WHERE RNO = 3;
INSERT INTO reservation VALUES (seq_rno.nextval,82,81,1,'A-1',sysdate);
select * from reservation;

SELECT * FROM RESERVATION WHERE MemNo = 1;
select * from schedule;
select * from movie;
select * from seat;
select * from theater;
create sequence seq_scount
START WITH 1 INCREMENT BY 1;
/* 영화 스케줄 표*/
insert into schedule values (to_date('2018-01-02', 'yyyy-mm-dd'),seq_scount.nextval,81);

select * from schedule where to_date('2018-01-02','yyyy-mm-dd');

select * from schedule where to_date(rdate, 'YY-MM-DD') = '18-01-02';
/* 초기*/
select  s.tno, s.seatno, s.issue ,s.Scount,sc.rdate 
from seat s, (select * from schedule) sc ;

select * from schedule;
select * from seat;
delete  from seat where scount =1;
/* 영화, 날짜 선택시 출력 값*/
select  s.tno, s.seatno, s.issue ,s.Scount,sc.rdate 
from seat s, (select * from schedule) sc 
where mno = 81 and s.issue = 0  and  to_date(sc.rdate, 'YY-MM-DD') = '18-01-01' 
order by  sc.rdate asc;


declare
 x number;
begin
x :=100;
end;
/

