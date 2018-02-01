package com.koitt.movie.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.koitt.movie.dao.MovieDao;
import com.koitt.movie.model.Actors;
import com.koitt.movie.model.Comment;
import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Intro;
import com.koitt.movie.model.Movie;
import com.koitt.movie.model.Paging;
import com.koitt.movie.model.Schedule;
import com.koitt.movie.model.Seat;

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
	public String remove(String mno) throws CommonException {			
		Movie item = dao.select(mno);
		String filename = item.getPost();
		dao.delete(mno);

		return filename;
	}
	@Transactional
	@Override
	public String modify(Movie movie) throws CommonException {
		/*
		 *  파라메터의 board 객체는 이미 수정된 정보를 담고 있다.
		 *  따라서 기존 데이터베이스에서 글번호로 기존 데이터를 불러온다.
		 */
		logger.debug(movie);
		Movie item = dao.select(Integer.toString(movie.getMno()));
		String oldFilename = item.getPost();
		dao.update(movie);

		return oldFilename;		
	}
	@Override
	public Movie detail(String no) throws CommonException {		
		return dao.select(no);
	}

	@Override
	public List<Movie> list() throws CommonException {				
		return dao.selectAll();
	}
	
	@Transactional
	@Override
	public void runCount(Schedule schedule) throws CommonException {
		dao.movie_schedule(schedule);		
	}
	@Transactional
	@Override
	public void seatEnrollment(Seat seat) throws CommonException {
		dao.movie_seat(seat);		
	}
	@Override
	public void comment(Comment c) throws CommonException {
		dao.movie_comment(c);		
	}
	@Override
	public List<Comment> commentAll(Integer mno) throws CommonException {			
		return dao.commentSelect(mno);
	}
	@Override
	public void commentDel(Integer cno) throws CommonException {		
		dao.commentDelete(cno);
	}	
	@Override
	public void CountComent() throws CommonException { 
		dao.CountComent();
	}
	@Override
	public void VcountUp(Comment comment) throws CommonException {
		dao.VcountUp(comment);
	}
	@Override
	public Comment cSelect(Integer cno) throws CommonException {
		return dao.cSelect(cno);		
	}
	@Override
	public Integer AllPage(Integer mno) throws CommonException {		
		return dao.AllPage(mno);
	}
	@Override
	public List<Paging> curPage(Paging page) throws CommonException {
		return dao.curPage(page);
	}
	@Override
	public List<Actors> select_Actors(Integer mno) throws CommonException {		
		return dao.select_Actors(mno);
	}
	@Override
	public void insert_Actors(Actors actors) throws CommonException { 
		dao.insert_Actors(actors);
	}
	@Override
	public void insert_Intro_S(Intro intro) throws CommonException {
		dao.insert_Intro(intro);		
	}
	@Override
	public List<Intro> select_Intro_S(Intro intro) throws CommonException {
		return dao.select_Intro(intro);
	}
}
