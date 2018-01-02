package com.koitt.movie.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.koitt.movie.dao.MovieDao;
import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Movie;

@Service
public class MovieServiceImpl implements MovieService{

	private Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired
	private MovieDao dao;
	
	public MovieServiceImpl() {}
	@Override
	public void newMovie(Movie movie) throws CommonException {
		dao.insert(movie);		
	}

	@Transactional
	@Override
	public String remove(String no) throws CommonException {			
		Movie item = dao.select(no);
		String filename = item.getM_post();
		dao.delete(no);

		return filename;
	}

	@Transactional
	@Override
	public String modify(Movie movie) throws CommonException {
		/*
		 *  파라메터의 board 객체는 이미 수정된 정보를 담고 있다.
		 *  따라서 기존 데이터베이스에서 글번호로 기존 데이터를 불러온다.
		 */
		Movie item = dao.select(Integer.toString(movie.getMovie_no()));
		String oldFilename = item.getM_post();
		dao.update(movie);

		return oldFilename;
		
	}

	@Override
	public Movie detail(String no) throws CommonException {		
		return dao.select(no);
	}

	@Override
	public List<Movie> list() throws CommonException {		
		logger.debug("서비스 실행");
		return dao.selectAll();
	}

}
