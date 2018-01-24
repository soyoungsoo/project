package com.koitt.movie.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;


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


import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Member;
import com.koitt.movie.service.MemberService;
import javax.servlet.http.HttpSession;


@Controller
public class UserWebController {
	
	private Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private MemberService MemberService;

	@Autowired
	private PasswordEncoder encoder;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage() {		
		return "redirect:/movie/list.do";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return "login";
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
		return "user/join-rewrite";
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
		public String modify(HttpServletRequest request,HttpServletResponse response, HttpSession session,							
				String oldPassword,
				String newPassword,
				String name,
				String birth,
				String email)
						throws CommonException,Exception {
			
			Member sessionmember = (Member)session.getAttribute("member");
			String id = sessionmember.getId();
			// 기존 비밀번호 검사 후 수정할지 결정
			boolean isMatched = MemberService.isPasswordMatched(id, oldPassword);			
			System.out.println(oldPassword);			
			System.out.println("isMatched " + isMatched);
			if (!isMatched) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('비밀번호를 잘못 입력하셨습니다.'); location.href='/special//user/modify';</script>");
				out.flush();
			}

			Member member = new Member();
			member.setId(sessionmember.getId());
			member.setPwd(encoder.encode(newPassword));
			member.setName(name);
			member.setBirth(birth);
			member.setEmail(email);					
			
			MemberService.update(member);
						
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원정보를 변경하였습니다.'); location.href='/special/movie/list.do';</script>");
			out.flush();
			
			return "error";						
		}
		
		@RequestMapping(value = "/user/setting" , method = RequestMethod.GET)
		public String setting() {
			return "user/setting";
		}	
		
		@RequestMapping(value = "/user/delete" , method = RequestMethod.GET)
		public String delete() {
			return "user/delete";
		}

		@RequestMapping(value = "/user/delete" , method = RequestMethod.POST)
		public String delete(HttpServletRequest request, HttpServletResponse response, HttpSession session, String password) throws CommonException, UnsupportedEncodingException {
			Member member = (Member)session.getAttribute("member");
			String id = member.getId();
			System.out.println("id "+id);
			System.out.println("id "+ password);
			boolean isMatched = MemberService.delete(id, password);		
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
				if (isMatched) {									
					out.println("<script>alert('성공적으로 탈퇴하셨습니다.'); location.href='/special//movie/list.do';</script>");
					out.flush();
				} 
				if(!isMatched) {
					out = response.getWriter();
					out.println("<script>alert('비밀번호를 다시 입력하십시오'); location.href='/special/user/delete';</script>");
					out.flush();
				}
			}
			catch (IOException e) {				
				logger.debug(e.getMessage());
			}
			return null;
		}			
}
