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

import com.koitt.movie.model.Member;
import com.koitt.movie.model.Reservation;
import com.koitt.movie.model.Schedule;
import com.koitt.movie.model.Seat;
import com.koitt.movie.service.SelectMovieService;
import com.koitt.movie.service.ReservationService;

@RestController
@RequestMapping("/rest")	
public class MovieRestController {
							
	private Logger logger = LogManager.getLogger(this.getClass());
					
	@Autowired
	private ReservationService tkService;
	@Autowired				
	private SelectMovieService smService;							
	
		
	@RequestMapping(value = "/select", method = RequestMethod.GET,produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			 MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<Seat>> select(@RequestParam("selectElement")String date , @RequestParam("inputVal") Integer mno,UriComponentsBuilder ucBuilder) throws ParseException {
			List<Seat> list = null;			
			Schedule schedule = new Schedule();
																		
			schedule.setMno(mno);					
			schedule.setRdate(date);						
			list = smService.selectDate(schedule);										
			
			return new ResponseEntity<List<Seat>>(list,HttpStatus.OK);
	}	
	@RequestMapping(value = "/seat", method = RequestMethod.GET,produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			 MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<Seat>> seat(@RequestParam("rdate")String date , @RequestParam("mno") Integer mno, @RequestParam("tno") Integer tno,UriComponentsBuilder ucBuilder) throws ParseException {
			List<Seat> list = null;			
			Seat seat = new Seat();
						
			seat.setMno(mno);
			seat.setTno(tno);				
			seat.setRdate(date);
						
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

}
