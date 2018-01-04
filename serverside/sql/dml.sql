/* 영화 쿼리*/
DELETE FROM MOVIE WHERE Movie_no=43;
SELECT * FROM Movie;
UPDATE movie 
SET title = '1987', content = '내용', genre = '한국 드라마', grade = '15세 이용가', mrun = '117분', start_date = '2017-12-27', end_date = '2017-12-29', m_post = null 
WHERE Movie_no = 46;
/* 영화 추가*/
CREATE SEQUENCE mno_seq
START WITH 1 INCREMENT BY 1;

	SELECT mno_seq.NEXTVAL mno FROM DUAL;
INSERT INTO
Movie(Mno,title,content,genre,grade,mrun,sdate,edate,post)
VALUES (mno_seq.nextval,'강철비','dd','한국드라마','15','117','2017-10-21','2017-12-21',null);

select * from movie;
/* 회원 추가*/
INSERT INTO Member(Member_no,id,pwd,name,birth,email) 
VALUES (Member_seq.nextval,'소영수','1234','소영수','1999-04-24','koitt@koitt.com');

SELECT Movie_no, title, content, grade, mrun, start_date, end_date, m_post
FROM Movie
;

SELECT * FROM MOVIE;

SELECT * FROM Movie	WHERE mno = 1;
INSERT INTO user_type(id,type) 
VALUES (1,'admin');

DELETE  
FROM Movie;