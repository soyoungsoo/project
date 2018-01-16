package com.koitt.movie.dao;



import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.seat;

public interface SelectMovieDao {


	// 영화, 날짜 선택시 출력 값
	public seat selectDate(seat seat) throws CommonException;

	
}
