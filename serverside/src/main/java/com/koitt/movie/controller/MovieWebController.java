package com.koitt.movie.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Movie;
import com.koitt.movie.service.MovieService;

@Controller
@RequestMapping("/movie")
public class MovieWebController {
	
	private static final String UPLOAD_FOLDER ="/movieImage";
	
	private Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired
	private MovieService movieService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(Model model) {		
		return "/index";
	}
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(Model model) throws CommonException{
		List<Movie> list = null;
		
		list = movieService.list();		
		logger.debug(list);		
		model.addAttribute("list", list);
		return "movie";
	}
	
//	// 글 작성 화면
//		@RequestMapping(value = "/new.do", method = RequestMethod.GET)
//		public String newBoard() {
//			
//				String email = this.getPrincipal();
//				UserInfo item = userInfoService.detail(email);
//			
//				model.addAttribute("id", item.getId());
//				model.addAttribute("email", item.getEmail());
//
//			return "movieinsert";
//		}
//
//		// 글 작성 후, 글 목록 화면으로 이동
//		@RequestMapping(value = "/new.do", method = RequestMethod.POST)
//		public String newBoard(HttpServletRequest request,				
//				String title,
//				String content,
//				String genre,
//				String grade,
//				String mrun,
//				Date start_date,
//				Date end_date,				
//				@RequestParam("m_post") MultipartFile m_post)
//						throws CommonException, Exception {
//
//			Movie movie = new Movie();
//			movie.setTitle(title);
//			movie.setContent(content);
//			movie.setGenre(genre);
//			movie.setGrade(grade);
//			movie.setMrun(mrun);
//			movie.setStart_date(start_date);
//			movie.setEnd_date(end_date);
//			// 최상위 경로 밑에 upload 폴더의 경로를 가져온다.
//			String path = request.getServletContext().getRealPath(UPLOAD_FOLDER);
//
//			// MultipartFile 객체에서 파일명을 가져온다.
//			String originalName = m_post.getOriginalFilename();
//
//			// upload 폴더가 없다면, upload 폴더 생성
//			File directory = new File(path);
//			if (!directory.exists()) {
//				directory.mkdir();
//			}
//
//			// attachment 객체를 이용하여, 파일을 서버에 전송
//			if (m_post != null && !m_post.isEmpty()) {
//				int idx = originalName.lastIndexOf(".");
//				String name = originalName.substring(0, idx);
//				String ext = originalName.substring(idx, originalName.length());
//				String uploadFilename = name
//						+ Long.toHexString(System.currentTimeMillis())
//						+ ext;
//				m_post.transferTo(new File(path, uploadFilename));
//				uploadFilename = URLEncoder.encode(uploadFilename, "UTF-8");
//				movie.setM_post(uploadFilename);
//			}
//		
//			movieService.newMovie(movie);
//			return "redirect:list.do";
//		}
}
