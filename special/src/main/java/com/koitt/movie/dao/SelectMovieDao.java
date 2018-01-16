package com.koitt.movie.dao;

import java.util.Date;
import java.util.List;

import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Movie;
import com.koitt.movie.model.seat;

public interface SelectMovieDao {


	// 영화, 날짜 선택시 출력 값
	public seat selectDate(Integer mno, Date date) throws CommonException;

}
