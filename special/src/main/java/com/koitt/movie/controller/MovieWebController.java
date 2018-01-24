package com.koitt.movie.controller;

import java.io.File;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.koitt.movie.dao.MovieDao;
import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Member;
import com.koitt.movie.model.Movie;
import com.koitt.movie.model.Reservation;
import com.koitt.movie.model.Schedule;
import com.koitt.movie.model.Seat;
import com.koitt.movie.service.FileService;
import com.koitt.movie.service.MemberService;
import com.koitt.movie.service.MovieService;
import com.koitt.movie.service.TicketService;

@Controller
@RequestMapping("/movie")
public class MovieWebController {

	private static final String UPLOAD_FOLDER ="/movieImage";

	@Autowired
	private MemberService MemberService;
	@Autowired
	private TicketService ticketService;
	
	private Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private MovieService movieService;

	@Autowired
	private FileService fileService;	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage() {
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
		return "home-rewrite";
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
		
		
		return "detail-rewrite";	// /WEB-INF/views/detail.jsp 페이지로 이동
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
		System.out.println("실행");
		return "redirect:list.do";
	}

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
		@RequestMapping(value="/ticket", method=RequestMethod.GET)
		public String reserve(HttpSession session,Model model, @RequestParam(value = "mno", required = true)Integer mno) {			
			
			if (session.getAttribute("member")!=null) {
				model.addAttribute("mno",mno);
				return "reservation";
			}
			return "login";
		}

		@RequestMapping(value = "/ticket", method = RequestMethod.POST)
		public String reserve(HttpSession session, HttpServletRequest request, HttpServletResponse response, Integer mno, Integer tno, String seatno, Integer scount)
			throws CommonException, Exception{				
					
			Reservation reservation = new Reservation();			
			Seat seat = new Seat();
			Member member = (Member) session.getAttribute("member");
			Integer memNo = member.getMemno();
			String seatno_cut[] = seatno.split(",");
			System.out.println("scount "+ scount);
			for (String string : seatno_cut) {
				reservation.setMemNo(memNo);
				reservation.setMno(mno);
				reservation.setTno(tno);
				reservation.setSeatno(string);
				seat.setTno(tno);
				seat.setSeatno(string);
				seat.setIssue(1);
				seat.setScount(scount);
				ticketService.ticketing(reservation);
				ticketService.stateChange(seat);
				System.out.println(seat);
			}	
			return "redirect:list.do";		
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>alert('예매 완료되셨습니다.'); location.href='/special/movie/list.do';</script>");
//			out.flush();
			// 예매목록으로 가시겠습니까?
			
		}
		
		@RequestMapping(value = "/schedule.do", method = RequestMethod.GET)
		public String schedule(Model model,Integer mno)
			throws CommonException, UnsupportedEncodingException{				
				model.addAttribute("mno",mno);
			return "movie-schedule";			
		}
		
		@RequestMapping(value = "/schedule", method = RequestMethod.POST)
		public String schedule(HttpServletRequest request,Integer mno, String runTime, String runDay)
			throws CommonException, UnsupportedEncodingException{				
			
			Schedule sc = new Schedule();
			StringBuilder sb = new StringBuilder();
			sb.append(runDay);
			sb.append(" ");
			sb.append(runTime);						
			sc.setMno(mno);
			sc.setRdate(sb.toString());			
			movieService.runCount(sc);
			Integer scount = sc.getScount();
			System.out.println("scount "+ sc.getScount());
			return "redirect:list.do";			
		}
	}