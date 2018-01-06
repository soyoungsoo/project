package com.koitt.movie.controller;

import java.io.File;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Member;
import com.koitt.movie.service.MemberService;



@Controller
public class UserWebController {
	
	private Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private MemberService MemberService;

	@Autowired
	private PasswordEncoder encoder;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return "user/login";
	}

	@RequestMapping(value = "/logout" , method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}

		return "redirect:/login?action=logout";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String JoinPage() {
		return "user/join";
	}
	@RequestMapping(value="/newUser", method=RequestMethod.POST)
	public String Join(HttpServletRequest request,
			String id, String pwd, String name, String birth, String email)
			throws CommonException, Exception  {
		Member member = new Member();
		
		member.setId(id);
		member.setPwd(pwd);
		member.setName(name);
		member.setBirth(birth);
		member.setEmail(email);
		
		logger.debug("aaaaaa: " + member);
		
		MemberService.join(member);	
		return "redirect:login";
	}
	// 사용자 수정하기 화면
		@RequestMapping(value = "/user/modify", method = RequestMethod.GET)
		public String modify(Model model) throws CommonException {

			Member item = null;

			String id = this.getPrincipal();
			item = MemberService.detail(id);

			model.addAttribute("item", item);

			return "user/modify";
		}
		// 현재 접속한 사용자의 id 리턴
		private String getPrincipal() {
			String username = null;
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			Object principal = auth.getPrincipal();

			if (principal instanceof UserDetails) {
				username = ((UserDetails) principal).getUsername();
			}
			else {
				username = principal.toString();
			}

			return username;
		}

		// 사용자 수정 후, 사용자 설정 화면으로 이동
		@RequestMapping(value = "/user/modify", method = RequestMethod.POST)
		public String modify(HttpServletRequest request,
				String id,
				String oldPassword,
				String newPassword,
				String name,
				String birth,
				String email)
						throws CommonException,Exception {

			// 기존 비밀번호 검사 후 수정할지 결정
			boolean isMatched = MemberService.isPasswordMatched(id, oldPassword);
			if (!isMatched) {
				return "redirect:/user/modify?action=error-password";
			}

			Member user = new Member();
			user.setId(id);
			user.setPwd(encoder.encode(newPassword));
			user.setName(name);
			user.setBirth(birth);
			user.setEmail(email);

			return "redirect:/user/setting";
		}

	
}
