DROP TABLE Movie CASCADE CONSTRAINTS;
DROP TABLE Member CASCADE CONSTRAINTS;
DROP TABLE Ticket CASCADE CONSTRAINTS;
DROP TABLE user_type CASCADE CONSTRAINTS;
DROP TABLE user_info_type CASCADE CONSTRAINTS;
DROP TABLE Actors CASCADE CONSTRAINTS;
DROP TABLE Schedule CASCADE CONSTRAINTS;
DROP TABLE theater CASCADE CONSTRAINTS;
DROP TABLE seat CASCADE CONSTRAINTS;
DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE movie_coment CASCADE CONSTRAINTS;

/* 영화 */
CREATE TABLE Movie (
	Mno NUMBER NOT NULL, /* 영화번호 */
	title VARCHAR2(60) NOT NULL, /* 제목 */
	content VARCHAR2(2000) NOT NULL, /* 시놉시스 */
	genre VARCHAR2(30), /* 장르 */
	grade VARCHAR2(30), /* 관람등급 */
	mrun VARCHAR2(30), /* 러닝타임 */
	sdate DATE, /* 개봉날짜 */
	edate DATE, /* 종영날짜 */
	post VARCHAR2(300), /* 영화포스터 */
	CONSTRAINT pk_Movie PRIMARY KEY (Mno)
);

/* 회원 */
CREATE TABLE Member (
	MemNo NUMBER NOT NULL, /* 회원번호 */
	id VARCHAR2(20) NOT NULL, /* 아이디 */
	pwd VARCHAR2(60) NOT NULL, /* 비밀번호 */
	name VARCHAR2(20) NOT NULL, /* 이름 */
	birth VARCHAR2(30) NOT NULL, /* 생년월일 */
	email VARCHAR2(320) NOT NULL, /* 이메일 */
	CONSTRAINT pk_Member PRIMARY KEY (MemNo),
	CONSTRAINT pk_Member1 UNIQUE (id)
);

/* 계정타입 */
CREATE TABLE user_type (
	id NUMBER NOT NULL, /* 타입번호 */
	type VARCHAR2(30) NOT NULL, /* 타입명 */
	CONSTRAINT pk_user_type PRIMARY KEY (id)
);

/* 계정정보타입 */
CREATE TABLE user_info_type (
	MemNo NUMBER NOT NULL, /* 회원번호 */
	user_info_type_id NUMBER NOT NULL, /* 타입번호 */
	
	CONSTRAINT fk_member FOREIGN KEY (MemNo) REFERENCES Member (MemNo),
	CONSTRAINT fk_user_info_type FOREIGN KEY (user_info_type_id) REFERENCES user_type (id)
);

/* 출연진 */
CREATE TABLE Actors (
	ano NUMBER NOT NULL, /* 출연진코드 */
	Mno NUMBER, /* 영화번호 */
	name NVARCHAR2(60) NOT NULL, /* 이름 */
	job NVARCHAR2(30) NOT NULL, /* 직업 */
	CONSTRAINT pk_Actors PRIMARY KEY (ano),
	CONSTRAINT fk_Movie FOREIGN KEY (Mno) REFERENCES Movie (Mno)	
);

/* 상영일정 */
CREATE TABLE Schedule (
	rdate VARCHAR2(150) NOT NULL, /* 상영일자 */
	Scount NUMBER, /* 상영회차*/
	Mno NUMBER, /* 영화번호 */
	CONSTRAINT pk_Schedule PRIMARY KEY (Scount)
);

/* 상영관 */
CREATE TABLE theater (
	tno NUMBER NOT NULL, /* 상영관번호 */
	tsNo NUMBER, /* 총좌석수 */
	CONSTRAINT pk_theater PRIMARY KEY (tno)
);

/* 좌석 */
CREATE TABLE seat (
	tno NUMBER NOT NULL, /* 상영관번호 */
	seatno VARCHAR2(10) NOT NULL, /* 좌석번호 */
	issue NUMBER,/* 예약여부 */	
	Scount NUMBER, /* 상영회차*/
	CONSTRAINT fk_theater FOREIGN KEY (tno) REFERENCES theater(tno),
	CONSTRAINT fk_Schedule1 FOREIGN KEY (Scount) REFERENCES Schedule(Scount)
);
/* 티켓예매 */
CREATE TABLE reservation (
	rno NUMBER NOT NULL, /* 예매번호 */
	MemNo NUMBER, /* 회원번호 */
	Mno NUMBER, /* 영화번호 */
	tno NUMBER, /* 상영관번호 */
	seatno VARCHAR2(10), /* 좌석번호 */
	btime TIMESTAMP, /* 티켓팅코드 */	
	Scount NUMBER, /*상영회차*/
	CONSTRAINT pk_reservation21 PRIMARY KEY (rno),
	CONSTRAINT fk_Member3 FOREIGN KEY (MemNo) REFERENCES Member(MemNo),
	CONSTRAINT fk_Movie12 FOREIGN KEY (Mno) REFERENCES Movie(Mno),
	CONSTRAINT fk_theater12 FOREIGN KEY (tno) REFERENCES theater(tno),
	CONSTRAINT fk_Schedule_r FOREIGN KEY (Scount) REFERENCES Schedule(Scount)
);

insert into reservation values();
/* 평점 */
CREATE TABLE movie_coment (
	cno NUMBER NOT NULL, /* 댓글번호 */
	Mno NUMBER NOT NULL, /* 영화번호 */
	MemNo NUMBER, /* 회원번호 */
	coment VARCHAR2(255), /* 댓글 */
	score NUMBER, /* 평점 */
	vcount NUMBER, /* 추천수 */
	CONSTRAINT pk_movie_coment PRIMARY KEY (cno),
	CONSTRAINT fk_Movie1 FOREIGN KEY (Mno) REFERENCES Movie(Mno),
	CONSTRAINT fk_Member1 FOREIGN KEY (MemNo) REFERENCES Member(MemNo)	
);
/* 티켓 */
CREATE TABLE Ticket (
	Mno NUMBER,  /* 영화번호 */
	Tno NUMBER,  /* 티켓번호 */
	rno NUMBER, /* 예매번호 */
	CONSTRAINT pk_Ticket PRIMARY KEY (Tno),
	CONSTRAINT fk_Movie_T FOREIGN KEY (Mno) REFERENCES Movie (Mno),
	CONSTRAINT fk_reservation FOREIGN KEY (rno) REFERENCES reservation (rno)
);
