package com.koitt.movie.service;

import java.util.List;

import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Movie;

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
}
