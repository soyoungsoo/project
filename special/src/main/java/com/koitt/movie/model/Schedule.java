package com.koitt.movie.model;

import java.util.Date;

public class Schedule {

	private Date rdate; /* 상영일자 */
	private Integer Scount; /* 상영회차*/
	private Integer Mno; /* 영화번호 */
	
	public Schedule() {}

	public Schedule(Date rdate, Integer scount, Integer mno) {
		super();
		this.rdate = rdate;
		Scount = scount;
		Mno = mno;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public Integer getScount() {
		return Scount;
	}

	public void setScount(Integer scount) {
		Scount = scount;
	}

	public Integer getMno() {
		return Mno;
	}

	public void setMno(Integer mno) {
		Mno = mno;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Mno == null) ? 0 : Mno.hashCode());
		result = prime * result + ((Scount == null) ? 0 : Scount.hashCode());
		result = prime * result + ((rdate == null) ? 0 : rdate.hashCode());
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
		if (Mno == null) {
			if (other.Mno != null)
				return false;
		} else if (!Mno.equals(other.Mno))
			return false;
		if (Scount == null) {
			if (other.Scount != null)
				return false;
		} else if (!Scount.equals(other.Scount))
			return false;
		if (rdate == null) {
			if (other.rdate != null)
				return false;
		} else if (!rdate.equals(other.rdate))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Schedule [rdate=");
		builder.append(rdate);
		builder.append(", Scount=");
		builder.append(Scount);
		builder.append(", Mno=");
		builder.append(Mno);
		builder.append("]");
		return builder.toString();
	}


	
}
