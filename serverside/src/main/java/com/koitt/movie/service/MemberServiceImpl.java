package com.koitt.movie.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.koitt.movie.dao.MemberDao;
import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Member;
import com.koitt.movie.model.UserType;
import com.koitt.movie.model.UserTypeId;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao MemberDao;

	@Autowired
	private PasswordEncoder encoder;
	
	@Override
	public List<Member> selectAll() throws CommonException {		
		List<Member> selectAll = MemberDao.selectAll();
		return selectAll;
	}

	@Override
	public Member find(Integer id) throws CommonException {
		Member info = MemberDao.select(id);
		return info;
	}

	@Transactional
	@Override
	public void join(Member member) throws CommonException {
		
		
		member.setPwd(encoder.encode(member.getPwd()));

		UserType userType = new UserType(UserTypeId.USER.getUserTypeId(), UserTypeId.USER.name());
		Set<UserType> userTypes = new HashSet<>();
		userTypes.add(userType);

		member.setUserTypes(userTypes);

		MemberDao.insert(member);
		MemberDao.insertUserType(member);
	}

	@Transactional
	@Override
	public void delete(Integer id) throws CommonException {
		MemberDao.delete(id);
	}
	@Transactional
	@Override
	public void update(Member member) throws CommonException {
		// TODO Auto-generated method stub
		
	}


	@Override
	public boolean isPasswordMatched(Integer id, String rawPassword) throws CommonException {
		// 데이터베이스로부터 현재 사용자의 암호화된 비밀번호를 가져온다.
		Member item = MemberDao.select(id);
		return encoder.matches(rawPassword, item.getPwd());		
	}
//	@Override
//	public boolean isPasswordMatched(Integer id, String oldPassword) throws CommonException {
//		
//		return false;
//	}

	@Override
	public Member detail(String id) throws CommonException {
		return MemberDao.selectById(id);		
	}

	@Override
	public String delete(String id, String password) throws CommonException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isPasswordMatched(String id, String rawPassword) throws CommonException {
		// TODO Auto-generated method stub
		return false;
	}

	

}
