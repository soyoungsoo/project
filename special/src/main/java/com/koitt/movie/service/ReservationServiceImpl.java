package com.koitt.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.movie.dao.ReservationDao;
import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Reservation;
import com.koitt.movie.model.Seat;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;
	@Override
	public List<Seat> SeatAll(Seat seat) throws CommonException {		
		return reservationDao.SeatAll(seat);		
	}

	@Override
	public void stateChange(Seat seat) throws CommonException {
		reservationDao.stateChange(seat);		
	}

	@Override
	public void ticketing(Reservation reservation) throws CommonException {
		reservationDao.ticketing(reservation);		
	}


	@Override
	public void Cancel(Integer rno) throws CommonException {
		reservationDao.Cancel(rno);		
	}

	@Override
	public List<Reservation> Lookup(Reservation rs) throws CommonException {	
		return reservationDao.Lookup(rs);
	}

}
