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

import com.koitt.movie.model.Actors;
import com.koitt.movie.model.Comment;
import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Intro;
import com.koitt.movie.model.Member;
import com.koitt.movie.model.Movie;
import com.koitt.movie.model.Reservation;
import com.koitt.movie.model.Schedule;
import com.koitt.movie.model.Seat;
import com.koitt.movie.service.FileService;
import com.koitt.movie.service.MemberService;
import com.koitt.movie.service.MovieService;
import com.koitt.movie.service.ReservationService;

@Controller
@RequestMapping("/movie")
public class MovieWebController {

	//private static final String UPLOAD_FOLDER ="/movieImage";
	private Logger logger = LogManager.getLogger(this.getClass());
	
	private static final String UPLOAD_FOLDER ="/resources/image";		
	
	@Autowired
	private MemberService MemberService;
	@Autowired
	private ReservationService ticketService;	
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
	public String detail(HttpServletRequest request, Model model, 
			@RequestParam(value = "mno", required=true) String mno)
					throws CommonException, Exception {
		Intro intro = new Intro();
		double totalScore = 0,rate	= 0; 
		Integer  totalView = null;							
		Movie movie = null;
		List<Comment> list = null;
		List<Actors> actors = null;
		List<Intro> i_list = null;
		String filename = null;
		intro.setMno(Integer.parseInt(mno));			
		movie = movieService.detail(mno);
		filename = movie.getPost();
		
		if (filename != null && !filename.trim().isEmpty()) {
			filename = URLDecoder.decode(filename, "UTF-8");
		}						
		if(movieService.totalScore(Integer.parseInt(mno))!=null) {
			totalScore = movieService.totalScore(Integer.parseInt(mno));			
		};
		if(movieService.totalView(Integer.parseInt(mno))!=null) {
			totalView = movieService.totalView(Integer.parseInt(mno));
		};
		if(movieService.ReserveRate(Integer.parseInt(mno))!=null) {
			rate = (double) movieService.ReserveRate(Integer.parseInt(mno));
		};				
		i_list =movieService.select_Intro_S(intro);
		actors = movieService.select_Actors(Integer.parseInt(mno));		
		list = movieService.commentAll(Integer.parseInt(mno));					
		
		request.setAttribute("total-ts",totalScore);
		request.setAttribute("total-tv",totalView);
		request.setAttribute("total-rate",rate);
		model.addAttribute("Intro",i_list);
		model.addAttribute("actors",actors);
		model.addAttribute("comment", list);
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
			for (String string : seatno_cut) {
				reservation.setMemno(memNo);
				reservation.setMno(mno);
				reservation.setTno(tno);
				reservation.setSeatno(string);
				reservation.setScount(scount);
				seat.setTno(tno);
				seat.setSeatno(string);
				seat.setIssue(1);
				seat.setScount(scount);
				ticketService.ticketing(reservation);
				ticketService.stateChange(seat);				
			}	
				
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('예매 완료되셨습니다.'); location.href='/special/movie/list.do';</script>");
			out.flush();
			// 예매목록으로 가시겠습니까?
			//return "redirect:list.do";
			return null;
		}
		
		@RequestMapping(value = "/ticket-del", method = RequestMethod.POST)
		public String ticketCancel(HttpServletResponse response,Integer rno,Integer tno, Integer scount, String seatno) throws Exception {
			Seat seat = new Seat();			
			seat.setTno(tno);
			seat.setScount(scount);
			seat.setSeatno(seatno);
			seat.setIssue(0);
		
			ticketService.Cancel(rno);
			ticketService.stateChange(seat);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('예매 취소되었습니다..');</script>");
			out.flush();
			return "user/reserve";
		}
		@RequestMapping(value = "/schedule.do", method = RequestMethod.GET)
		public String schedule(Model model,Integer mno)
			throws CommonException, UnsupportedEncodingException{				
				model.addAttribute("mno",mno);
			return "movie-schedule";			
		}
		
		@RequestMapping(value = "/schedule", method = RequestMethod.POST)
		public String schedule(HttpServletRequest request,Integer mno,Integer tno, String runTime, String runDay,String seatno)
			throws CommonException, UnsupportedEncodingException{
			
			Schedule sc = new Schedule();
			Seat seat = new Seat();
			StringBuilder sb = new StringBuilder();
			sb.append(runDay);
			sb.append(" ");
			sb.append(runTime);						
			sc.setMno(mno);
			sc.setRdate(sb.toString());		
			sc.setTno(tno);
			movieService.runCount(sc);			
			Integer scount = sc.getScount();
			seat.setTno(tno);
			seat.setScount(scount);							
			movieService.seatEnrollment(seat);		
			if(seatno != null) {
				String[] seatnos = seatno.split(",");
				
				for (String string : seatnos) {
					seat.setIssue(2);
					seat.setSeatno(string);
					ticketService.stateChange(seat);
					System.out.println("foreach "+seat);
				}
			}
			return "redirect:list.do";			
		}
		@RequestMapping(value = "/comment", method = RequestMethod.POST)
		public String comment(HttpSession session,Integer mno_i,String write_area,Integer star_input)
			throws CommonException{			
				Comment comment = new Comment();
				Member member = (Member)session.getAttribute("member");
				comment.setMno(mno_i);
				comment.setId(member.getId());
				comment.setMcomment(write_area);
				comment.setScore(star_input);		
				comment.setVcount(0);
				movieService.comment(comment);
			return "redirect:detail.do?mno="+mno_i;			
		}	
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		public String delete(Integer mno, Integer cno)
			throws CommonException{
				movieService.commentDel(cno);						
			return "redirect:detail.do?mno="+mno;			
		}
		@RequestMapping(value = "/insert_actors", method = RequestMethod.GET)
		public String actors(Model model,Integer mno) throws Exception {		
			model.addAttribute("item",mno);
			return "actors-insert";
		}
		@RequestMapping(value = "/insert_actors", method = RequestMethod.POST)
		public String actros(HttpServletRequest request, MultipartFile[] photo,String name, String job,Integer mno)
				throws Exception {			
			Actors actors = new Actors();					
			String[] names = name.split(",");
			String[] jobs = job.split(",");
			int length = names.length;							
			for (MultipartFile file : photo) {
				for(int i=0;i<length;i++) {
					// 최상위 경로 밑에 upload 폴더의 경로를 가져온다.
					String path = request.getServletContext().getRealPath(UPLOAD_FOLDER);					
					actors.setMno(mno);
					actors.setName(names[i]);
					actors.setJob(jobs[i]);
					// MultipartFile 객체에서 파일명을 가져온다.
					String originalName = file.getOriginalFilename();				
					// upload 폴더가 없다면, upload 폴더 생성
					File directory = new File(path);
					if (!directory.exists()) {
						directory.mkdir();
					}				
					// attachment 객체를 이용하여, 파일을 서버에 전송
					if (file != null && !file.isEmpty()) {
						int idx = originalName.lastIndexOf(".");
						String filename = originalName.substring(0, idx);
						String ext = originalName.substring(idx, originalName.length());
						String uploadFilename = filename
								+ Long.toHexString(System.currentTimeMillis())
								+ ext;
						file.transferTo(new File(path, uploadFilename));
						uploadFilename = URLEncoder.encode(uploadFilename, "UTF-8");
						
						actors.setPhoto(uploadFilename);						
					}
					movieService.insert_Actors(actors);
				}					
			}
			return "redirect:list.do";
		}
		@RequestMapping(value = "/insert_Intro", method = RequestMethod.GET)
		public String Intro(Model model,Integer mno) throws Exception {		
			model.addAttribute("item",mno);
			return "Intro-insert";
		}
		@RequestMapping(value = "/insert_Intro", method = RequestMethod.POST)
		public String Intro(HttpServletRequest request, Integer mno, MultipartFile[] image, String video) throws Exception {
			Intro intro = new Intro();
			intro.setVideo(video);				
			for (MultipartFile file : image) {	
				
					// 최상위 경로 밑에 upload 폴더의 경로를 가져온다.
					String path = request.getServletContext().getRealPath(UPLOAD_FOLDER);					
					intro.setMno(mno);									
					// MultipartFile 객체에서 파일명을 가져온다.
					String originalName = file.getOriginalFilename();
					
					// upload 폴더가 없다면, upload 폴더 생성
					File directory = new File(path);
					if (!directory.exists()) {
						directory.mkdir();
					}
	
					// attachment 객체를 이용하여, 파일을 서버에 전송
					if (file != null && !file.isEmpty()) {
						int idx = originalName.lastIndexOf(".");
						String filename = originalName.substring(0, idx);
						String ext = originalName.substring(idx, originalName.length());
						String uploadFilename = filename
								+ Long.toHexString(System.currentTimeMillis())
								+ ext;
						file.transferTo(new File(path, uploadFilename));
						uploadFilename = URLEncoder.encode(uploadFilename, "UTF-8");
						
						intro.setImage(uploadFilename);
						System.out.println(uploadFilename);
					}	
					movieService.insert_Intro_S(intro);
					intro.setVideo(null);
				}							
			return "redirect:list.do";
		}
	}