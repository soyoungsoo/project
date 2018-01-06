package com.koitt.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.movie.dao.UserTypeDao;
import com.koitt.movie.model.UserType;


@Service
public class UserTypeServiceImpl implements UserTypeService {
	
	@Autowired
	private UserTypeDao dao;

	@Override
	public UserType findById(Integer id) {
		return dao.select(id);
	}
}
