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

/* 회원 검색*/
SELECT * FROM MEMBER;

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

INSERT INTO seat VALUES (1,'A-11',0,1);
INSERT INTO seat VALUES (1,'A-12',0,1);
INSERT INTO seat VALUES (1,'A-13',0,1);
INSERT INTO seat VALUES (1,'A-14',0,1);
INSERT INTO seat VALUES (1,'A-15',0,1);

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

INSERT INTO seat VALUES (1,'B-11',0,1);
INSERT INTO seat VALUES (1,'B-12',0,1);
INSERT INTO seat VALUES (1,'B-13',0,1);
INSERT INTO seat VALUES (1,'B-14',0,1);
INSERT INTO seat VALUES (1,'B-15',0,1);


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

INSERT INTO seat VALUES (1,'C-11',0,1);
INSERT INTO seat VALUES (1,'C-12',0,1);
INSERT INTO seat VALUES (1,'C-13',0,1);
INSERT INTO seat VALUES (1,'C-14',0,1);
INSERT INTO seat VALUES (1,'C-15',0,1);

/* 좌석 조회*/
SELECT * FROM SEAT;

/*
CREATE SEQUENCE SEQ_BNO
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
SELECT * FROM SCHEDULE;
SELECT * FROM MOVIE;
SELECT * FROM SEAT;
SELECT * FROM THEATER;
CREATE SEQUENCE SEQ_SCOUNT
START WITH 1 INCREMENT BY 1;
/* 영화 스케줄 표*/
INSERT INTO SCHEDULE VALUES (TO_DATE('2018-01-02', 'YYYY-MM-DD'),SEQ_SCOUNT.NEXTVAL,81);

SELECT * FROM SCHEDULE WHERE TO_DATE('2018-01-02','YYYY-MM-DD');

SELECT * FROM SCHEDULE WHERE TO_DATE(RDATE, 'YY-MM-DD') = '18-01-02';
/* 초기*/
SELECT  S.TNO, S.SEATNO, S.ISSUE ,S.SCOUNT,SC.RDATE 
FROM SEAT S, (SELECT * FROM SCHEDULE) SC ;

SELECT * FROM SCHEDULE;
SELECT * FROM SEAT;
DELETE  FROM SEAT WHERE SCOUNT =1;
/* 영화, 날짜 선택시 출력 값*/
SELECT  S.TNO, S.SEATNO, S.ISSUE ,S.SCOUNT,SC.RDATE 
FROM SEAT S, (SELECT * FROM SCHEDULE) SC 
WHERE MNO = 81 AND S.ISSUE = 0  AND  TO_DATE(SC.RDATE, 'YY-MM-DD') = '18-01-01' 
ORDER BY  SC.RDATE ASC;


DECLARE
 X NUMBER;
BEGIN
X :=100;
END;
/
*/
