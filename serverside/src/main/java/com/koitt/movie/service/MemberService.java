package com.koitt.movie.service;

import java.util.List;


import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Member;

public interface MemberService {	

	public List<Member> selectAll() throws CommonException;

	public Member find(Integer id) throws CommonException;

	public void join(Member member) throws CommonException;	

	public void delete(Integer id)  throws CommonException;	

	public void update(Member member) throws CommonException;

	// 현재 사용자의 id값을 이용하여 비밀번호를 불러온 다음, 입력한 비밀번호와 비교
	public boolean isPasswordMatched(Integer id, String oldPassword) throws CommonException;

	// CustomUserDetailsService에서 id 값으로 사용자를 검색할 때 사용
	public Member detail(String id) throws CommonException;

	// id 값을 이용하여 사용자 삭제
	public String delete(String id, String password) throws CommonException;

	// 사용자의 id 값을 이용하여 비밀번호를 불러온 다음 입력한 비밀번호와 비교한다.
	boolean isPasswordMatched(String id, String rawPassword) throws CommonException;

}
