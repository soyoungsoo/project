package com.koitt.movie.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Reservation;
import com.koitt.movie.model.Seat;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	private Logger logger = LogManager.getLogger(this.getClass());
	
	private static final String MAPPER_NAMESPACE = "com.koitt.movie.dao.ReservationDaoImpl";
	
	@Autowired
	private SqlSession sqlSession;
	
	public ReservationDaoImpl() {}
	@Override
	public void ticketing(Reservation reservation) throws CommonException {
		try {		
			System.out.println("reservation " + reservation);
			sqlSession.insert(MAPPER_NAMESPACE + ".insert", reservation);			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			logger.debug(new CommonException("ticketing 실패"));			
		}		
	}

	@Override
	public void Cancel(Integer rno) throws CommonException {
		try {
			sqlSession.delete(MAPPER_NAMESPACE + ".delete", rno);			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			logger.debug(new CommonException("취소 실패"));			
		}
		
	}

	@Override
	public List<Reservation> Lookup(Reservation rs) throws CommonException {
			List<Reservation> list = null;
		try {
			list  = sqlSession.selectList(MAPPER_NAMESPACE + ".select-Day", rs);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			logger.debug(new CommonException("조회 실패"));
		}
		return list;				
	}

	@Override
	public List<Seat> SeatAll(Seat seat) throws CommonException {
			List<Seat> list = null;
		try {
			list = sqlSession.selectList(MAPPER_NAMESPACE + ".seatSelect", seat);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			logger.debug(new CommonException("좌석 확인 실패"));
		}
		return list;
	}

	@Override
	public void stateChange(Seat seat) throws CommonException {
		try {			
			System.out.println("dao " + seat);
			sqlSession.update(MAPPER_NAMESPACE + ".seatUpdate", seat);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			logger.debug(new CommonException("좌석 상태 변경 실패"));			
		}		
		
	}

}
