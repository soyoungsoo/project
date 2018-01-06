package com.koitt.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	private Logger logger = LogManager.getLogger(this.getClass());

	private static final String MAPPER_NAMESPACE = "com.koitt.movie.dao.MemberDaoImpl";

	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<Member> selectAll() throws CommonException {
		List<Member> list = null;
		try {			
			list = sqlSession.selectList(MAPPER_NAMESPACE + ".selectAll");
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("E06: 회원 모두 보기 실패");
		  }
		return list;
	}

	@Override
	public Member select(Integer id) throws CommonException {
			Member info = null; 
		try {
			info = sqlSession.selectOne(MAPPER_NAMESPACE + ".select", id);
		} catch (Exception e) {
			logger.debug(e.getMessage());			
		  }
		return info;
	}

	@Override
	public void insert(Member member) throws CommonException {		
		try {
			sqlSession.insert(MAPPER_NAMESPACE + ".insert", member);			
			logger.debug(member);
		} catch (Exception e) {			
			logger.debug(e.getMessage());			
		}
	}

	@Override
	public void insertUserType(Member member) throws CommonException {
		try {
			sqlSession.insert(MAPPER_NAMESPACE + ".insertUserTypes", member);
			logger.debug("usertype"+member);
		} catch (Exception e) {
			logger.debug(e.getMessage());			
		  }
		
	}

	@Override
	public void delete(Integer id) throws CommonException {
		try {
			sqlSession.delete(MAPPER_NAMESPACE + ".delete", id);
		} catch (Exception e) {
			logger.debug(e.getMessage());			
		  }
		
	}

	@Override
	public void deleteUserTypes(Integer id) throws CommonException {
		try {
			sqlSession.delete(MAPPER_NAMESPACE + ".deleteUserTypes", id);
		} catch (Exception e) {
			logger.debug(e.getMessage());			
		  }
		
	}

	@Override
	public void update(Member member) throws CommonException {
		try {
			sqlSession.update(MAPPER_NAMESPACE + ".update", member);
		} catch (Exception e) {
			logger.debug(e.getMessage());			
		  }
		
	}

	@Override
	public Member selectById(String id) throws CommonException {
		
		Member item = null; 
		try {
			item = sqlSession.selectOne(MAPPER_NAMESPACE + ".selectById", id);
		} catch (Exception e) {
			logger.debug(e.getMessage());			
		  }
		return item;
	}

	

}
