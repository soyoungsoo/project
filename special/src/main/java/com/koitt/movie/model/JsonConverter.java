package com.koitt.movie.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

public class JsonConverter {
	public String convert(HashMap<String, String> map) {
		StringBuilder sb = new StringBuilder();
		ArrayList<Entry<String, String>> arJson = new ArrayList<>(map.entrySet());
		sb.append("{");
		for (Entry<String, String> entry : arJson) {
			sb.append("\""+entry.getKey()+"\"");
			sb.append(":");
			sb.append("\""+entry.getValue()+"\"");
			sb.append(",");
		}
		sb.deleteCharAt(sb.lastIndexOf(","));
		sb.append("}");
		
		return sb.toString();
		
	}
}
