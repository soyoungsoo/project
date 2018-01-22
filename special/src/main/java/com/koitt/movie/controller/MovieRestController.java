package com.koitt.movie.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.koitt.movie.model.Schedule;
import com.koitt.movie.model.Seat;
import com.koitt.movie.service.SelectMovieService;

@RestController
@RequestMapping("/rest")	
public class MovieRestController {
							
	private Logger logger = LogManager.getLogger(this.getClass());
							
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
						
			System.out.println("tno " + tno);
			System.out.println("mno " + mno);
			System.out.println("date " + date);
			seat.setMno(mno);
			seat.setTno(tno);				
			seat.setRdate(date);
						
			list = smService.select(seat);				
			System.out.println(list);			
			
			return new ResponseEntity<List<Seat>>(list,HttpStatus.OK);
	}	
}
