package com.koitt.movie.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.koitt.movie.model.Member;
import com.koitt.movie.model.UserType;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	private Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired
	private MemberService service;

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		Member userInfo = service.detail(id);
		logger.debug("UserInfo: " + userInfo);
		
		if (userInfo == null) {
			throw new UsernameNotFoundException("E20: 사용자 정보를 찾지 못했습니다.");
		}
		
		// username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities
		return new User(userInfo.getId(), 
				userInfo.getPwd(),
				true, 
				true, 
				true, 
				true, 
				this.getGrantedAuthorities(userInfo));
	}
	
	private List<GrantedAuthority> getGrantedAuthorities(Member userInfo) {
		List<GrantedAuthority> authorities = new ArrayList<>();
		
		for (UserType item : userInfo.getUserTypes()) {
			logger.debug("UserType: " + item);
			authorities.add(new SimpleGrantedAuthority("ROLE_" + item.getType()));
		}
		
		logger.debug("authorities: " + authorities);
		return authorities;
	}

}
