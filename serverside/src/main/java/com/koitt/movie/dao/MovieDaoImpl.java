package com.koitt.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Movie;

@Repository
public class MovieDaoImpl implements MovieDao{

	private Logger logger = LogManager.getLogger(this.getClass());
	
	private static final String MAPPER_NAMESPACE = "com.koitt.movie.dao.MovieDaoImpl";
	
	@Autowired
	private SqlSession sqlSession;
	
	public MovieDaoImpl() {}
	
	@Override
	public void insert(Movie movie) throws CommonException {
		try {			
			
			sqlSession.insert(MAPPER_NAMESPACE + ".insert", movie);
		}catch (Exception e) {
			logger.debug(e.getMessage());
			logger.debug("dao 실행");
			logger.debug(movie);
			throw new CommonException("E01: 영화등록 실패");
		}		
	}

	@Override
	public void delete(String mno) throws CommonException {
		try {
			sqlSession.delete(MAPPER_NAMESPACE + ".delete", mno);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("E02: 영화삭제 실패");
		}
		
	}

	@Override
	public void update(Movie movie) throws CommonException {
		try {
			sqlSession.update(MAPPER_NAMESPACE + ".update", movie);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("E03: 영화수정 실패");
		}
		
	}

	@Override
	public Movie select(String no) throws CommonException {
			Movie movie = null; 
			try {				
				movie = sqlSession.selectOne(MAPPER_NAMESPACE + ".select", no);
				logger.debug(movie);
			} catch (Exception e) {
				logger.debug(e.getMessage());				
				logger.debug(movie);
				throw new CommonException("E04: 영화 상세보기 실패");
			}
		return movie;
	}

	@Override
	public List<Movie> selectAll() throws CommonException {
		List<Movie> list = null;
			try {												  
				list = sqlSession.selectList(MAPPER_NAMESPACE + ".selectAll");
			} catch (Exception e) {
				logger.debug(e.getMessage());					
				throw new CommonException("E05: 영화 전체보기 실패");
			}		
		return list;
	}

}
