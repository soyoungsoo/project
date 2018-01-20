package com.koitt.movie.service;

import java.util.List;

import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Schedule;
import com.koitt.movie.model.Seat;

public interface SelectMovieService {

	public List<Seat> selectDate(Schedule schedule) throws CommonException;
	
	public List<Seat> select(Seat seat) throws CommonException;
}
