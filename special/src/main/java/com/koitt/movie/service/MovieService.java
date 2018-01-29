package com.koitt.movie.service;

import java.util.List;

import com.koitt.movie.model.Comment;
import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Movie;
import com.koitt.movie.model.Schedule;
import com.koitt.movie.model.Seat;

public interface MovieService {

	// 영화번호를 1 증가시키고 영화 등록하기
	public void newMovie(Movie movie) throws CommonException;	
	// 영화 삭제한다
	public String remove(String no) throws CommonException;
	// 영화 수정한다
	public String modify(Movie movie) throws CommonException;
	// 영화 하나를 가져온다.
	public Movie detail(String no) throws CommonException;
	// 영화 전체 가져오기
	public List<Movie> list() throws CommonException;
	// 영화 상영회차 등록
	public void runCount(Schedule schedule) throws CommonException;
	// 영화 좌석 등록
	public void seatEnrollment(Seat seat) throws CommonException;
	// 영화 댓글 등록
	public void comment(Comment c) throws CommonException;
	// 영화 전체 댓글 조회
	public List<Comment> commentAll(Integer mno) throws CommonException;
	// 댓글 삭제
	public void commentDel(Integer cno) throws CommonException;
	// 댓글 수정
	public void commentUpdate(Comment comment) throws CommonException;
	// 영화 댓글 전체 수
	public void CountComent() throws CommonException;
	// 댓글 추천 증가
	public void VcountUp(Comment comment) throws CommonException;
}
