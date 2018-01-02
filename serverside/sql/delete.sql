ALTER TABLE seat
	DROP
		CONSTRAINT FK_theater_TO_seat
		CASCADE;

ALTER TABLE Ticket
	DROP
		CONSTRAINT FK_Movie_TO_Ticket
		CASCADE;

ALTER TABLE Ticket
	DROP
		CONSTRAINT FK_reservation_TO_Ticket
		CASCADE;

ALTER TABLE user_info_type
	DROP
		CONSTRAINT FK_Member_TO_user_info_type
		CASCADE;

ALTER TABLE user_info_type
	DROP
		CONSTRAINT FK_user_type_TO_user_info_type
		CASCADE;

ALTER TABLE Actors
	DROP
		CONSTRAINT FK_Movie_TO_Actors
		CASCADE;

ALTER TABLE Schedule
	DROP
		CONSTRAINT FK_Movie_TO_Schedule
		CASCADE;

ALTER TABLE reservation
	DROP
		CONSTRAINT FK_Member_TO_reservation
		CASCADE;

ALTER TABLE reservation
	DROP
		CONSTRAINT FK_Movie_TO_reservation
		CASCADE;

ALTER TABLE reservation
	DROP
		CONSTRAINT FK_seat_TO_reservation
		CASCADE;

ALTER TABLE reservation
	DROP
		CONSTRAINT FK_buy_TO_reservation
		CASCADE;

ALTER TABLE movie_coment
	DROP
		CONSTRAINT FK_Movie_TO_movie_coment
		CASCADE;

ALTER TABLE movie_coment
	DROP
		CONSTRAINT FK_Member_TO_movie_coment
		CASCADE;

ALTER TABLE Member
	DROP
		UNIQUE (
			id
		)
		CASCADE
		KEEP INDEX;

ALTER TABLE seat
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE Movie
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE Member
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE Ticket
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE user_type
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE user_info_type
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE Actors
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE Schedule
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE theater
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE reservation
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE movie_coment
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE buy
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX UIX_Member;

DROP INDEX PK_seat;

DROP INDEX PK_Movie;

DROP INDEX PK_Member;

DROP INDEX PK_Ticket;

DROP INDEX PK_user_type;

DROP INDEX PK_user_info_type;

DROP INDEX PK_Actors;

DROP INDEX PK_Schedule;

DROP INDEX PK_theater;

DROP INDEX PK_reservation;

DROP INDEX PK_movie_coment;

DROP INDEX PK_buy;

/* 좌석 */
DROP TABLE seat 
	CASCADE CONSTRAINTS;

/* 영화 */
DROP TABLE Movie 
	CASCADE CONSTRAINTS;

/* 회원 */
DROP TABLE Member 
	CASCADE CONSTRAINTS;

/* 티켓 */
DROP TABLE Ticket 
	CASCADE CONSTRAINTS;

/* 계정타입 */
DROP TABLE user_type 
	CASCADE CONSTRAINTS;

/* 계정정보타입 */
DROP TABLE user_info_type 
	CASCADE CONSTRAINTS;

/* 출연진 */
DROP TABLE Actors 
	CASCADE CONSTRAINTS;

/* 상영일정 */
DROP TABLE Schedule 
	CASCADE CONSTRAINTS;

/* 상영관 */
DROP TABLE theater 
	CASCADE CONSTRAINTS;

/* 티켓예매 */
DROP TABLE reservation 
	CASCADE CONSTRAINTS;

/* 평점 */
DROP TABLE movie_coment 
	CASCADE CONSTRAINTS;

/* 티켓팅정보 */
DROP TABLE buy 
	CASCADE CONSTRAINTS;