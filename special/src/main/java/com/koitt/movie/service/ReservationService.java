package com.koitt.movie.service;

import java.util.List;

import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Reservation;
import com.koitt.movie.model.Seat;

public interface ReservationService {

		//상영관 좌석 상태
		public List<Seat> SeatAll(Seat seat) throws CommonException;
		//예매좌석 상태변경
		public void stateChange(Seat seat) throws CommonException;
		// 티켓예매
		public void ticketing(Reservation reservation) throws CommonException;
		
		// 티켓 취소
		public void Cancel(Integer rno) throws CommonException;
		// 회원 번호로 예매 조회 
		public List<Reservation> Lookup(Reservation rs) throws CommonException;
		
}
