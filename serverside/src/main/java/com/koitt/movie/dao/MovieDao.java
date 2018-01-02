package com.koitt.movie.dao;

import java.util.List;

import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Movie;

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
}
