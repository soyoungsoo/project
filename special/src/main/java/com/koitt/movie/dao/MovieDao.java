package com.koitt.movie.dao;

import java.util.List;

import com.koitt.movie.model.Comment;
import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Movie;
import com.koitt.movie.model.Schedule;
import com.koitt.movie.model.Seat;

public interface MovieDao {

	// 영화 등록
	public void insert(Movie movie) throws CommonException;
	// 영화 삭제
	public void delete(String no) throws CommonException;
	// 영화 수정
	public void update(Movie movie) throws CommonException;
	// 영화 상세보기
	public Movie select(String no) throws CommonException;
	// 영화 전체 가져오기
	public List<Movie> selectAll() throws CommonException;
	// 영화 상영회차 등록
	public void movie_schedule(Schedule schedule) throws CommonException;
	// 영화관 좌석 등록
	public void movie_seat(Seat seat)throws CommonException;
	// 영화 댓글 등록
	public void movie_comment(Comment c) throws CommonException;
	// 영화 댓글 조회
	public List<Comment> commentSelect(Integer mno) throws CommonException;
}
