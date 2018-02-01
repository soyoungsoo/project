package com.koitt.movie.dao;

import java.util.List;

import com.koitt.movie.model.Actors;
import com.koitt.movie.model.Comment;
import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Intro;
import com.koitt.movie.model.Movie;
import com.koitt.movie.model.Paging;
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
	// 영화 댓글 하나 조회
	public Comment cSelect(Integer cno) throws CommonException;
	// 댓글 삭제
	public void commentDelete(Integer cno) throws CommonException;	
	// 영화 댓글 전체 수
	public void CountComent() throws CommonException;
	// 영화 댓글 추천 증가
	public void VcountUp(Comment comment) throws CommonException;
	// 영화 댓글 전체 페이지 가져오기
	public Integer AllPage(Integer mno) throws CommonException;
	// 영화 댓글 현재페이지 행 가져오기
	public List<Paging> curPage(Paging page) throws CommonException;
	// 영화 출연진 불러오기
	public List<Actors> select_Actors(Integer mno) throws CommonException;
	// 영화 출연진 등록
	public void insert_Actors(Actors actors) throws CommonException;
	// 영화 소개 등록
	public void insert_Intro(Intro intro) throws CommonException;
	// 영화 소개 가져오기
	public List<Intro> select_Intro(Intro intro) throws CommonException;
}
