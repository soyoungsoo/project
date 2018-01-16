package com.koitt.movie.dao;

import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.seat;

public class SelectMovieDaoImpl implements SelectMovieDao{

	private Logger logger = LogManager.getLogger(this.getClass());
	
	private static final String MAPPER_NAMESPACE = "time";
	
	@Autowired
	private SqlSession sqlSesison;
	@Override
	public seat selectDate(Integer mno, Date date) throws CommonException {
			try {
				sqlSesison.selectList(MAPPER_NAMESPACE + ".time");
			} catch (Exception e) {

			}
		return null;
	}

}
