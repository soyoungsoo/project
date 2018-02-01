package com.koitt.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koitt.movie.model.Actors;
import com.koitt.movie.model.Comment;
import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Intro;
import com.koitt.movie.model.Movie;
import com.koitt.movie.model.Paging;
import com.koitt.movie.model.Schedule;
import com.koitt.movie.model.Seat;

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

				throw new CommonException("E05: 영화 전체보기 실패");
			}		
		return list;
	}

	@Override
	public void movie_schedule(Schedule schedule) throws CommonException {	
		try {							
				sqlSession.insert(MAPPER_NAMESPACE + ".insert-schedule", schedule);		
			}catch (Exception e) {
				logger.debug(e.getMessage());
				throw new CommonException("E06: 상영회차 등록 실패");
			}	
		}

	@Override
	public void movie_seat(Seat seat) throws CommonException {
		try {							
			sqlSession.insert(MAPPER_NAMESPACE + ".insert-seat", seat);		
		}catch (Exception e) {
			logger.debug(e.getMessage());			
			throw new CommonException("E07: 좌석 등록 실패");
			
		}	
		
	}

	@Override
	public void movie_comment(Comment c) throws CommonException {
		try {							
			sqlSession.insert(MAPPER_NAMESPACE + ".comment-eroll", c);		
		}catch (Exception e) {
			logger.debug(e.getMessage());			
			throw new CommonException("E08: 댓글 등록 실패");
			
		}	
		
	}

	@Override
	public List<Comment> commentSelect(Integer mno) throws CommonException {
			List<Comment> list = null;
		try {			
			list = sqlSession.selectList(MAPPER_NAMESPACE + ".commentAll", mno);				
		}catch (Exception e) {
			logger.debug(e.getMessage());			
			throw new CommonException("E09: 댓글 전체 조회 실패");			
		}			
		return list; 
	}

	@Override
	public void commentDelete(Integer cno) throws CommonException {		
		try {			
			sqlSession.delete(MAPPER_NAMESPACE + ".comment_delete", cno);				
		}catch (Exception e) {
			logger.debug(e.getMessage());			
			throw new CommonException("E10: 댓글 삭제 실패");			
		}				 
	}	
	@Override
	public void CountComent() throws CommonException {
		try {			
			sqlSession.update(MAPPER_NAMESPACE + ".PageCount");			
		}catch (Exception e) {
			logger.debug(e.getMessage());			
			throw new CommonException("E12: 댓글 수 가져오기 실패");			
		}				
	}

	@Override
	public void VcountUp(Comment comment) throws CommonException {	
		try {			
			sqlSession.update(MAPPER_NAMESPACE + ".Vcountup",comment);			
		}catch (Exception e) {
			logger.debug(e.getMessage());			
			throw new CommonException("E13: 추천 수 증가 실패");			
		}		
	}

	@Override
	public Comment cSelect(Integer cno) throws CommonException {
		Comment comment = null;
		try {			
			 comment= sqlSession.selectOne(MAPPER_NAMESPACE + ".commentSelect",cno);			
		}catch (Exception e) {
			logger.debug(e.getMessage());			
			throw new CommonException("E14: 댓글 가져오기 실패");			
		}			
		return comment;
	}

	@Override
	public Integer AllPage(Integer mno) throws CommonException {
		Integer page = 0;
		try {			
			page= sqlSession.selectOne(MAPPER_NAMESPACE + ".PageCount",mno);			
		}catch (Exception e) {
			logger.debug(e.getMessage());				
			throw new CommonException("E15: 전체 페이지 가져오기");			
		}			
		return page;		
	}

	@Override
	public List<Paging> curPage(Paging page) throws CommonException {
			List<Paging> paging = null;
		try {			
			paging= sqlSession.selectList(MAPPER_NAMESPACE + ".PagingCount",page);			
		}catch (Exception e) {
			logger.debug(e.getMessage());			
			throw new CommonException("E16: 현재 페이지 가져오기");			
		}			
		return paging;
	}

	@Override
	public List<Actors> select_Actors(Integer mno) throws CommonException {	
		List<Actors> actors = null;
		try {			
			actors= sqlSession.selectList(MAPPER_NAMESPACE + ".select-actors",mno);			
		}catch (Exception e) {
			logger.debug(e.getMessage());			
			throw new CommonException("E17: 출연진 가져오기 실패");			
		}			
		return actors;
	}

	@Override
	public void insert_Actors(Actors actors) throws CommonException {		
		try {			
			sqlSession.insert(MAPPER_NAMESPACE + ".insert-actors",actors);			
		}catch (Exception e) {
			logger.debug(e.getMessage());			
			throw new CommonException("E18: 출연진 등록 실패");			
		}					
	}

	@Override
	public void insert_Intro(Intro intro) throws CommonException {
		try {			
			sqlSession.insert(MAPPER_NAMESPACE + ".insert-Intro",intro);			
		}catch (Exception e) {
			logger.debug(e.getMessage());			
			throw new CommonException("E19: Intro 등록 실패");			
		}		
	}

	@Override
	public List<Intro> select_Intro(Intro intro) throws CommonException {
		List<Intro> list = null;
		try {			
			list = sqlSession.selectList(MAPPER_NAMESPACE + ".select-Intro",intro);			
		}catch (Exception e) {
			logger.debug(e.getMessage());			
			throw new CommonException("E20: Intro 가져오기 실패");			
		}		
		return list;
	}
}