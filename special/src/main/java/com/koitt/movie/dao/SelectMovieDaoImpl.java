package com.koitt.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Schedule;
import com.koitt.movie.model.Seat;

@Repository
public class SelectMovieDaoImpl implements SelectMovieDao{

	private Logger logger = LogManager.getLogger(this.getClass());
	
	private static final String MAPPER_NAMESPACE = "com.koitt.dao.SelectMovieDaoImpl";
	
	@Autowired
	private SqlSession sqlSesison;
	
	@Override
	public List<Seat> selectDate(Schedule schedule) throws CommonException {
			List<Seat> list = null;
			try {								
				list = sqlSesison.selectList(MAPPER_NAMESPACE + ".selectDate",schedule);				
			} catch (Exception e) {
				e.printStackTrace();					
				logger.debug("검색 오류");				
			}	
			return list;
	}

	@Override
	public List<Seat> select(Seat seat) throws CommonException {
		List<Seat> list = null;
		try {					
			list = sqlSesison.selectList(MAPPER_NAMESPACE + ".select",seat);			
		} catch (Exception e) {
			e.printStackTrace();					
			logger.debug("좌석 검색 오류");				
		}		
		return list;
	}
}
