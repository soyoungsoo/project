package com.koitt.movie.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping("/rest")
public class MovieRestController {

	private Logger logger = LogManager.getLogger(this.getClass());
	
	
	@RequestMapping(value = "/select", method = RequestMethod.GET,produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			 MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<String> select(@RequestParam("selectElement") String no,@RequestParam("inputVal")	String str,UriComponentsBuilder ucBuilder) {

			System.out.println("no " + no );
			System.out.println("str " + str );
			return new ResponseEntity<String>(HttpStatus.OK);
	}					
}
