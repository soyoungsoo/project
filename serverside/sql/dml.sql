/* 영화 쿼리*/
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

/* 회원 추가*/
CREATE SEQUENCE memno_seq
START WITH 1 INCREMENT BY 1;
DROP SEQUENCE memno_seq;
INSERT INTO Member(memno,id,pwd,name,birth,email) 
VALUES (memno_seq.nextval,'admin','1234','관리자','2018-01-06','admin@koitt.com');
	
SELECT * FROM MEMBER;
delete  from MEMBER where id='admin';
delete  from MEMBER where memno=21;

INSERT INTO user_type(id,type) 
VALUES (22,'ADMIN');

INSERT INTO user_type(id,type) 
VALUES (2,'USER');

insert into user_info_type(memno,user_info_type_id) values (22,1);
insert into user_info_type(memno,user_info_type_id) values (5,2);

SELECT * FROM user_type WHERE user_type.id = #{id}

	INSERT INTO Member
		VALUES (memno_seq.nextval,'111','d','d','2222-02-02','koitt@koitt.com');
select * from member; 

INSERT INTO Member(memno,id,pwd,name,birth,email) 
		VALUES (#{memno}, #{id}, #{pwd}, #{name}, #{birth},#{email})
		
		
insert into 
SELECT memno_seq.NEXTVAL memno FROM DUAL;
SELECT mno_seq.NEXTVAL mno FROM DUAL;		



