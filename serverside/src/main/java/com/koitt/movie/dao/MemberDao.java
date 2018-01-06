package com.koitt.movie.dao;


import java.util.List;


import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Member;

public interface MemberDao {


	public List<Member> selectAll() throws CommonException;
	
	public Member select(Integer id) throws CommonException;
	
	public void insert(Member member) throws CommonException;
	
	public void insertUserType(Member member) throws CommonException;
	
	public void delete(Integer id)  throws CommonException;
	
	public void deleteUserTypes(Integer id) throws CommonException;

	public void update(Member member) throws CommonException;

	public Member selectById(String id) throws CommonException;

}
