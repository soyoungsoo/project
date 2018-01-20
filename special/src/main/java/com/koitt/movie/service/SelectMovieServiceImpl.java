package com.koitt.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.movie.dao.SelectMovieDao;
import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Schedule;
import com.koitt.movie.model.Seat;

@Service
public class SelectMovieServiceImpl implements SelectMovieService{

	@Autowired
	private SelectMovieDao smdao;
	
	@Override
	public List<Seat> selectDate(Schedule schedule) throws CommonException { 		
		return smdao.selectDate(schedule);
	}

	@Override
	public List<Seat> select(Seat seat) throws CommonException {		
		return smdao.select(seat);
	}

	
}
