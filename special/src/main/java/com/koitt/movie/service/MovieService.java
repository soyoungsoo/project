package com.koitt.movie.service;

import java.util.List;

import com.koitt.movie.model.Actors;
import com.koitt.movie.model.Comment;
import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Intro;
import com.koitt.movie.model.Movie;
import com.koitt.movie.model.Paging;
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
	// 영화 댓글 하나 조회
	public Comment cSelect(Integer cno) throws CommonException;
	// 영화 전체 댓글 조회
	public List<Comment> commentAll(Integer mno) throws CommonException;
	// 댓글 삭제
	public void commentDel(Integer cno) throws CommonException;	
	// 영화 댓글 전체 수
	public void CountComent() throws CommonException;
	// 댓글 추천 증가
	public void VcountUp(Comment comment) throws CommonException;
	// 댓글 전체 페이지 가져오기
	public Integer AllPage(Integer mno) throws CommonException;
	// 댓글 현재페이지 행 가져오기
	public List<Paging> curPage(Paging page) throws CommonException;
	// 영화 출연진 불러오기
	public List<Actors> select_Actors(Integer mno) throws CommonException;
	// 영화 출연진 삽입
	public void insert_Actors(Actors actors) throws CommonException;
	// 영화 소개 등록
	public void insert_Intro_S(Intro intro) throws CommonException;
	// 영화 소개 가져오기
	public List<Intro> select_Intro_S(Intro intro) throws CommonException;
	// 영화 평점
	public Integer totalScore(Integer mno) throws CommonException;
	// 영화 관람객 수
	public Integer totalView(Integer mno) throws CommonException;
	// 영화 예매율
	public Integer ReserveRate(Integer mno) throws CommonException;
}
