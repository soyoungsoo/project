package com.koitt.movie.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpSession;

import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Member;
import com.koitt.movie.model.Movie;
import com.koitt.movie.service.FileService;
import com.koitt.movie.service.MemberService;
import com.koitt.movie.service.MovieService;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

@Controller
@RequestMapping("/movie")
public class MovieWebController {

	private static final String UPLOAD_FOLDER ="/movieImage";

	@Autowired
	private MemberService MemberService;

	private Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private MovieService movieService;

	@Autowired
	private FileService fileService;	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(Model model) {
		return "redirect:list.do";
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

	@InitBinder     
	public void initBinder(WebDataBinder binder){
		binder.registerCustomEditor(Date.class,     
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true, 10));   
	}

	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(HttpSession session,Model model) throws CommonException{
				
		String id = this.getPrincipal();
		
		if (id != null && !id.trim().isEmpty()) {
			Member item = MemberService.detail(id);
			//model.addAttribute("member", item);		
			session.setAttribute("member", item);
		}
		
		List<Movie> list = null;
		list = movieService.list();		
		model.addAttribute("list", list);
		return "home";
	}

	// 글 상세 화면
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String detail(Model model, 
			@RequestParam(value = "mno", required=true) String mno)
					throws CommonException, Exception {
		Movie movie = null;
		String filename = null;

		movie = movieService.detail(mno);
		filename = movie.getPost();
		if (filename != null && !filename.trim().isEmpty()) {
			filename = URLDecoder.decode(filename, "UTF-8");
		}

		model.addAttribute("item", movie);
		model.addAttribute("filename", filename);
		
		
		return "detail";	// /WEB-INF/views/detail.jsp 페이지로 이동
	}

	// 글 작성 화면
	@RequestMapping(value = "/new.do", method = RequestMethod.GET)
	public String newBoard() {


		return "movieInsert";
	}

	// 글 작성 후, 글 목록 화면으로 이동
	@RequestMapping(value = "/new.do", method = RequestMethod.POST)
	public String newBoard(HttpServletRequest request,				
			String title,
			String content,
			String genre,
			String grade,
			String mrun,
			@DateTimeFormat(pattern = "yyyy-dd-MM")	
	Date sdate,
	@DateTimeFormat(pattern = "yyyy-dd-MM")	
	Date edate,				
	@RequestParam("post") MultipartFile post)
			throws CommonException, Exception {
		logger.debug("DD" +title);
		Movie movie = new Movie();
		movie.setTitle(title);
		movie.setContent(content);
		movie.setGenre(genre);
		movie.setGrade(grade);
		movie.setMrun(mrun);
		movie.setSdate(sdate);
		movie.setEdate(edate);
		// 최상위 경로 밑에 upload 폴더의 경로를 가져온다.
		String path = request.getServletContext().getRealPath(UPLOAD_FOLDER);

		// MultipartFile 객체에서 파일명을 가져온다.
		String originalName = post.getOriginalFilename();

		// upload 폴더가 없다면, upload 폴더 생성
		File directory = new File(path);
		if (!directory.exists()) {
			directory.mkdir();
		}

		// attachment 객체를 이용하여, 파일을 서버에 전송
		if (post != null && !post.isEmpty()) {
			int idx = originalName.lastIndexOf(".");
			String name = originalName.substring(0, idx);
			String ext = originalName.substring(idx, originalName.length());
			String uploadFilename = name
					+ Long.toHexString(System.currentTimeMillis())
					+ ext;
			post.transferTo(new File(path, uploadFilename));
			uploadFilename = URLEncoder.encode(uploadFilename, "UTF-8");
			movie.setPost(uploadFilename);
		}

		movieService.newMovie(movie);
		return "redirect:list.do";
	}

	// 글 수정하기 화면
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public String modify(Model model, String mno) throws CommonException{

		Movie item = null;

		item = movieService.detail(mno);

		model.addAttribute("item", item);

		return "modify";
	}
	// 글 수정 후, 글 목록 화면으로 이동
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public String modify(HttpServletRequest request,
			Integer mno,
			String title,
			String content,
			String genre,
			String grade,
			String mrun,
			Date sdate,
			Date edate,				
			@RequestParam("post") MultipartFile post)
					throws CommonException, Exception {

		//			// 비밀번호 비교해서 같지 않다면 오류메시지 출력
		//			boolean isMatched = userInfoService.isBoardMatched(no, password);
		//			if (!isMatched) {
		//				return "redirect:/board/modify.do?no=" + no + "&action=error-password";
		//			}

		Movie movie = new Movie();
		movie.setMno(mno);
		movie.setTitle(title);
		movie.setContent(content);
		movie.setGenre(genre);
		movie.setGrade(grade);
		movie.setMrun(mrun);
		movie.setSdate(sdate);
		movie.setEdate(edate);

		String path = request.getServletContext().getRealPath(UPLOAD_FOLDER);
		String originalName = post.getOriginalFilename();

		// attachment 객체를 이용하여, 파일을 서버에 전송
		if (post != null && !post.isEmpty()) {
			int idx = originalName.lastIndexOf(".");
			String name = originalName.substring(0, idx);
			String ext = originalName.substring(idx, originalName.length());
			String uploadFilename = name
					+ Long.toHexString(System.currentTimeMillis())
					+ ext;
			post.transferTo(new File(path, uploadFilename));
			uploadFilename = URLEncoder.encode(uploadFilename, "UTF-8");
			movie.setPost(uploadFilename);
		}

		String oldFilename = movieService.modify(movie);
		if (oldFilename != null && !oldFilename.trim().isEmpty()) {
			fileService.remove(request, UPLOAD_FOLDER, oldFilename);
		}

		return "redirect:list.do";
	}
	// 글 삭제 확인 화면
//		@RequestMapping(value = "/remove.do", method = RequestMethod.GET)
//		public String removeConfirm(Model model,
//				@RequestParam(value = "no", required = true) String no) {
//
//			return "remove-confirm";
//		}
	
	// 글 삭제 후, 글 목록 화면으로 이동
		@RequestMapping(value = "/remove.do", method = RequestMethod.GET)
		public String remove(HttpServletRequest request,
				@RequestParam(value = "mno", required = true) String mno
				)
						throws CommonException, UnsupportedEncodingException {								
			String filename = movieService.remove(mno);
			if (filename != null && !filename.trim().isEmpty()) {
				fileService.remove(request, UPLOAD_FOLDER, filename);
			}

			return "redirect:list.do";
		}

}
