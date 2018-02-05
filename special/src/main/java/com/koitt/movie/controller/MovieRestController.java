package com.koitt.movie.controller;


import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.koitt.movie.model.Comment;
import com.koitt.movie.model.CommonException;
import com.koitt.movie.model.Member;
import com.koitt.movie.model.Paging;
import com.koitt.movie.model.Reservation;
import com.koitt.movie.model.Schedule;
import com.koitt.movie.model.Seat;
import com.koitt.movie.service.MovieService;
import com.koitt.movie.service.ReservationService;
import com.koitt.movie.service.SelectMovieService;

@RestController
@RequestMapping("/rest")	
public class MovieRestController {
							
	private Logger logger = LogManager.getLogger(this.getClass());
					
	@Autowired
	private ReservationService tkService;
	@Autowired				
	private SelectMovieService smService;							
	@Autowired
	private MovieService mService; 
		
	@RequestMapping(value = "/select", method = RequestMethod.GET,produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			 MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<Seat>> select(@RequestParam("selectElement")String date , @RequestParam("inputVal") Integer mno,UriComponentsBuilder ucBuilder) throws ParseException {
			List<Seat> list = null;			
			Schedule schedule = new Schedule();
																		
			schedule.setMno(mno);					
			schedule.setRdate(date);						
			list = smService.selectDate(schedule);	
			System.out.println("list " +list);
			return new ResponseEntity<List<Seat>>(list,HttpStatus.OK);
	}	
	@RequestMapping(value = "/seat", method = RequestMethod.GET,produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			 MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<Seat>> seat(@RequestParam("rdate")String date , @RequestParam("mno") Integer mno, @RequestParam("tno") Integer tno, Integer scount) throws ParseException {
			List<Seat> list = null;			
			Seat seat = new Seat();
						
			seat.setMno(mno);
			seat.setTno(tno);				
			seat.setRdate(date);
			seat.setScount(scount);
			System.out.println(seat);
			list = smService.select(seat);	
			
			return new ResponseEntity<List<Seat>>(list,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/reserve" , method = RequestMethod.GET)
	public ResponseEntity<List<Reservation>> reserve(HttpSession session, @RequestParam("d")String d) {
			List<Reservation> list = null;
			Reservation rs = new Reservation();
			Member member =(Member)session.getAttribute("member");
			Integer memno = member.getMemno();
			rs.setMemno(memno);
			rs.setTitle(d);
			list = tkService.Lookup(rs);			
		return new ResponseEntity<List<Reservation>>(list,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/vcount", method = RequestMethod.GET)
	public ResponseEntity<Comment> vcount(HttpSession session,Integer mno, Integer cno)
		throws CommonException{
		int status = 0; 
		Member member = (Member)session.getAttribute("member");
		String id = member.getId();
		System.out.println("id " +id);
		System.out.println("cno " +cno);	
		if(session.getAttribute(cno+id) != null) {
			status = (int)session.getAttribute(cno+id);
			System.out.println(status);
		}		
		if (status != 1) {
			Comment c = new Comment();
			c.setMno(mno);
			c.setCno(cno);
			mService.VcountUp(c);		
			session.setAttribute(cno + id, 1);
			
			return new ResponseEntity<Comment>(HttpStatus.OK);
		}
		
		return new ResponseEntity<Comment>(HttpStatus.NO_CONTENT);			
	}	
	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public ResponseEntity<List<Paging>> page(Integer curPage,Integer mno)
		throws CommonException{					
		  Paging page = new Paging();
		  List<Paging> list = null;
   		  // 페이지번호가 없는경우		
		  Integer intpnum = (curPage == null) ? 1 : curPage;				
		  page.setCurPage(intpnum);
		  page.setMno(mno);		  
		  
		  // 현재 페이지 목록 출력
		  list = mService.curPage(page);
		  // 전체페이지
		  Integer allpages = mService.AllPage(mno);
		  page.setAllpages(allpages);
		  // 페이지그룹개수
		  double grouppage = 5;
		  // 시작페이지번호
		  int startgrouppage = ((int)Math.floor((intpnum-1)/grouppage))*(int)grouppage+1;
		  page.setStartgrouppage(startgrouppage);
		  // 종료페이지번호
		  Integer endgrouppage = startgrouppage+((int)grouppage-1);
		  endgrouppage = endgrouppage > allpages ? allpages :  endgrouppage;		  
		  page.setEndgrouppage(endgrouppage);		
		  
		  list.add(page);		  
		return new ResponseEntity<List<Paging>>(list,HttpStatus.OK);			
	}	

}
