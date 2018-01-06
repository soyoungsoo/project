package com.koitt.movie.dao;

import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.UserType;

public interface UserTypeDao {
	
	public UserType select(Integer id) throws CommonException;

}
