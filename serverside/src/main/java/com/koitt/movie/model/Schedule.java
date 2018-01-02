package com.koitt.movie.model;

import java.util.Date;

public class Schedule {

	private Date s_date;
	private Integer Movie_no;
	private Date sdate;
	private String stime;
	
	public Schedule() {}

	public Schedule(Date s_date, Integer movie_no, Date sdate, String stime) {		
		this.s_date = s_date;
		Movie_no = movie_no;
		this.sdate = sdate;
		this.stime = stime;
	}

	public Date getS_date() {
		return s_date;
	}

	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}

	public Integer getMovie_no() {
		return Movie_no;
	}

	public void setMovie_no(Integer movie_no) {
		Movie_no = movie_no;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public String getStime() {
		return stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Movie_no == null) ? 0 : Movie_no.hashCode());
		result = prime * result + ((s_date == null) ? 0 : s_date.hashCode());
		result = prime * result + ((sdate == null) ? 0 : sdate.hashCode());
		result = prime * result + ((stime == null) ? 0 : stime.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Schedule other = (Schedule) obj;
		if (Movie_no == null) {
			if (other.Movie_no != null)
				return false;
		} else if (!Movie_no.equals(other.Movie_no))
			return false;
		if (s_date == null) {
			if (other.s_date != null)
				return false;
		} else if (!s_date.equals(other.s_date))
			return false;
		if (sdate == null) {
			if (other.sdate != null)
				return false;
		} else if (!sdate.equals(other.sdate))
			return false;
		if (stime == null) {
			if (other.stime != null)
				return false;
		} else if (!stime.equals(other.stime))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Schedule [s_date=");
		builder.append(s_date);
		builder.append(", Movie_no=");
		builder.append(Movie_no);
		builder.append(", sdate=");
		builder.append(sdate);
		builder.append(", stime=");
		builder.append(stime);
		builder.append("]");
		return builder.toString();
	}
	
	
}
