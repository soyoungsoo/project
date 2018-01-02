/* 영화 쿼리*/
DELETE FROM MOVIE WHERE Movie_no=43;
SELECT * FROM Movie;
UPDATE movie 
SET title = '1987', content = '내용', genre = '한국 드라마', grade = '15세 이용가', mrun = '117분', start_date = '2017-12-27', end_date = '2017-12-29', m_post = null 
WHERE Movie_no = 46;
/* 영화 추가*/
INSERT INTO Movie(Movie_no,title,content,genre,grade,mrun,start_date,end_date,m_post)
VALUES (Movie_seq.nextval,
'강철비',	
'“책상을 탁! 치니 억! 하고 죽었습니다”

1987년 1월, 경찰 조사를 받던 스물두 살 대학생이 사망한다.
증거인멸을 위해 박처장(김윤석)의 주도 하에 경찰은 시신 화장을 요청하지만, 사망 당일 당직이었던 최검사(하정우)는 이를 거부하고 부검을 밀어붙인다.
단순 쇼크사인 것처럼 거짓 발표를 이어가는 경찰. 그러나 현장에 남은 흔적들과 부검 소견은 고문에 의한 사망을 가리키고, 사건을 취재하던 윤기자(이희준)는 ‘물고문 도중 질식사’를 보도한다. 이에 박처장은 조반장(박희순)등 형사 둘만 구속시키며 사건을 축소하려 한다.
한편, 교도소에 수감된 조반장을 통해 사건의 진상을 알게 된 교도관 한병용(유해진)은 이 사실을 수배 중인 재야인사에게 전달하기 위해 조카인 연희(김태리)에게 위험한 부탁을 하게 되는데…

한 사람이 죽고, 모든 것이 변화하기 시작했다.
모두가 뜨거웠던 1987년의 이야기.',
'한국드라마',
'15',
'117',
'2017-10-21',
'2017-12-21',
null); 
/* 회원 추가*/
INSERT INTO Member(Member_no,id,pwd,name,birth,email) 
VALUES (Member_seq.nextval,'소영수','1234','소영수','1999-04-24','koitt@koitt.com');

SELECT Movie_no, title, content, grade, mrun, start_date, end_date, m_post
FROM Movie
;

SELECT *
FROM Movie;

SELECT * FROM MOVIE;


INSERT INTO user_type(id,type) 
VALUES (1,'admin');

DELETE 
FROM Movie
WHERE Movie_no=41;