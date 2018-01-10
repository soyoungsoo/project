/* 좌석 */
CREATE TABLE seat (
	tno NUMBER NOT NULL, /* 상영관번호 */
	seatno VARCHAR2(10) NOT NULL, /* 좌석번호 */
	issue NUMBER /* 예약여부 */
);

CREATE UNIQUE INDEX PK_seat
	ON seat (
		tno ASC,
		seatno ASC
	);

ALTER TABLE seat
	ADD
		CONSTRAINT PK_seat
		PRIMARY KEY (
			tno,
			seatno
		);

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
	post VARCHAR2(300) /* 영화포스터 */
);

CREATE UNIQUE INDEX PK_Movie
	ON Movie (
		Mno ASC
	);

ALTER TABLE Movie
	ADD
		CONSTRAINT PK_Movie
		PRIMARY KEY (
			Mno
		);

/* 회원 */
CREATE TABLE Member (
	MemNo NUMBER NOT NULL, /* 회원번호 */
	id VARCHAR2(20) NOT NULL, /* 아이디 */
	pwd VARCHAR2(60) NOT NULL, /* 비밀번호 */
	name VARCHAR2(20) NOT NULL, /* 이름 */
	birth VARCHAR2(30) NOT NULL, /* 생년월일 */
	email VARCHAR2(320) NOT NULL /* 이메일 */
);

CREATE UNIQUE INDEX PK_Member
	ON Member (
		MemNo ASC
	);

CREATE UNIQUE INDEX UIX_Member
	ON Member (
		id ASC
	);

ALTER TABLE Member
	ADD
		CONSTRAINT PK_Member
		PRIMARY KEY (
			MemNo
		);

ALTER TABLE Member
	ADD
		CONSTRAINT UK_Member
		UNIQUE (
			id
		);

/* 티켓 */
CREATE TABLE Ticket (
	Mno NUMBER NOT NULL, /* 영화번호 */
	Tno NUMBER NOT NULL, /* 티켓번호 */
	rno NUMBER /* 예매번호 */
);

CREATE UNIQUE INDEX PK_Ticket
	ON Ticket (
		Mno ASC,
		Tno ASC
	);

ALTER TABLE Ticket
	ADD
		CONSTRAINT PK_Ticket
		PRIMARY KEY (
			Mno,
			Tno
		);

/* 계정타입 */
CREATE TABLE user_type (
	id NUMBER NOT NULL, /* 타입번호 */
	type VARCHAR2(30) NOT NULL /* 타입명 */
);

CREATE UNIQUE INDEX PK_user_type
	ON user_type (
		id ASC
	);

ALTER TABLE user_type
	ADD
		CONSTRAINT PK_user_type
		PRIMARY KEY (
			id
		);

/* 계정정보타입 */
CREATE TABLE user_info_type (
	MemNo NUMBER, /* 회원번호 */
	id NUMBER /* 타입번호 */
);

/* 출연진 */
CREATE TABLE Actors (
	ano NUMBER NOT NULL, /* 출연진코드 */
	Mno NUMBER, /* 영화번호 */
	name NVARCHAR2(60) NOT NULL, /* 이름 */
	job NVARCHAR2(30) NOT NULL /* 직업 */
);

CREATE UNIQUE INDEX PK_Actors
	ON Actors (
		ano ASC
	);

ALTER TABLE Actors
	ADD
		CONSTRAINT PK_Actors
		PRIMARY KEY (
			ano
		);

/* 상영일정 */
CREATE TABLE Schedule (
	rdate DATE NOT NULL, /* 상영일자 */
	Mno NUMBER, /* 영화번호 */
	sdate DATE, /* 날짜 */
	stime VARCHAR2(10) /* 시간 */
);

CREATE UNIQUE INDEX PK_Schedule
	ON Schedule (
		rdate ASC
	);

ALTER TABLE Schedule
	ADD
		CONSTRAINT PK_Schedule
		PRIMARY KEY (
			rdate
		);

/* 상영관 */
CREATE TABLE theater (
	tno NUMBER NOT NULL, /* 상영관번호 */
	tsNo NUMBER /* 총좌석수 */
);

CREATE UNIQUE INDEX PK_theater
	ON theater (
		tno ASC
	);

ALTER TABLE theater
	ADD
		CONSTRAINT PK_theater
		PRIMARY KEY (
			tno
		);

/* 티켓예매 */
CREATE TABLE reservation (
	rno NUMBER NOT NULL, /* 예매번호 */
	MemNo NUMBER, /* 회원번호 */
	Mno NUMBER, /* 영화번호 */
	tno NUMBER, /* 상영관번호 */
	seatno VARCHAR2(10), /* 좌석번호 */
	bno VARCHAR2(10) /* 티켓팅코드 */
);

CREATE UNIQUE INDEX PK_reservation
	ON reservation (
		rno ASC
	);

ALTER TABLE reservation
	ADD
		CONSTRAINT PK_reservation
		PRIMARY KEY (
			rno
		);

/* 평점 */
CREATE TABLE movie_coment (
	cno NUMBER NOT NULL, /* 댓글번호 */
	Mno NUMBER NOT NULL, /* 영화번호 */
	MemNo NUMBER, /* 회원번호 */
	coment VARCHAR2(255), /* 댓글 */
	score NUMBER, /* 평점 */
	vcount NUMBER /* 추천수 */
);

CREATE UNIQUE INDEX PK_movie_coment
	ON movie_coment (
		cno ASC
	);

ALTER TABLE movie_coment
	ADD
		CONSTRAINT PK_movie_coment
		PRIMARY KEY (
			cno
		);

/* 티켓팅정보 */
CREATE TABLE buy (
	bno VARCHAR2(10) NOT NULL, /* 티켓팅코드 */
	btime TIMESTAMP /* 티켓팅시간 */
);

CREATE UNIQUE INDEX PK_buy
	ON buy (
		bno ASC
	);

ALTER TABLE buy
	ADD
		CONSTRAINT PK_buy
		PRIMARY KEY (
			bno
		);

ALTER TABLE seat
	ADD
		CONSTRAINT FK_theater_TO_seat
		FOREIGN KEY (
			tno
		)
		REFERENCES theater (
			tno
		);

ALTER TABLE Ticket
	ADD
		CONSTRAINT FK_Movie_TO_Ticket
		FOREIGN KEY (
			Mno
		)
		REFERENCES Movie (
			Mno
		);

ALTER TABLE Ticket
	ADD
		CONSTRAINT FK_reservation_TO_Ticket
		FOREIGN KEY (
			rno
		)
		REFERENCES reservation (
			rno
		);

ALTER TABLE user_info_type
	ADD
		CONSTRAINT FK_Member_TO_user_info_type
		FOREIGN KEY (
			MemNo
		)
		REFERENCES Member (
			MemNo
		);

ALTER TABLE user_info_type
	ADD
		CONSTRAINT FK_user_type_TO_user_info_type
		FOREIGN KEY (
			id
		)
		REFERENCES user_type (
			id
		);

ALTER TABLE Actors
	ADD
		CONSTRAINT FK_Movie_TO_Actors
		FOREIGN KEY (
			Mno
		)
		REFERENCES Movie (
			Mno
		);

ALTER TABLE Schedule
	ADD
		CONSTRAINT FK_Movie_TO_Schedule
		FOREIGN KEY (
			Mno
		)
		REFERENCES Movie (
			Mno
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_Member_TO_reservation
		FOREIGN KEY (
			MemNo
		)
		REFERENCES Member (
			MemNo
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_Movie_TO_reservation
		FOREIGN KEY (
			Mno
		)
		REFERENCES Movie (
			Mno
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_seat_TO_reservation
		FOREIGN KEY (
			tno,
			seatno
		)
		REFERENCES seat (
			tno,
			seatno
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_buy_TO_reservation
		FOREIGN KEY (
			bno
		)
		REFERENCES buy (
			bno
		);

ALTER TABLE movie_coment
	ADD
		CONSTRAINT FK_Movie_TO_movie_coment
		FOREIGN KEY (
			Mno
		)
		REFERENCES Movie (
			Mno
		);

ALTER TABLE movie_coment
	ADD
		CONSTRAINT FK_Member_TO_movie_coment
		FOREIGN KEY (
			MemNo
		)
		REFERENCES Member (
			MemNo
		);