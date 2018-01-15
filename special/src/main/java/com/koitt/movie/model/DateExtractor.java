package com.koitt.movie.model;

import java.util.ArrayList;
import java.util.HashMap;

public class DateExtractor {
	
	public static String extract(String movDate) {
		
		String[] strTemp = null;
		String[] dateTemp = null;
		JsonConverter jsonConvert = new JsonConverter();
		HashMap<String, String> dateToJson = new HashMap<>();
		
		
		strTemp = movDate.split(" ");
		
		String date = strTemp[0];
		
		dateTemp = date.split("-");
		
		dateToJson.put("year", dateTemp[0]);
		dateToJson.put("month", dateTemp[1]);
		dateToJson.put("day", dateTemp[2]);
		
		
		
		
		return jsonConvert.convert(dateToJson);
		
	}
	
	
}
