package com.koitt.movie.model;

public class Schedule {
		
	private String rdate; /* 상영일자 */
	private Integer Scount; /* 상영회차*/
	private Integer mno; /* 영화번호 */
	
	public Schedule() {}

	public Schedule(String rdate, Integer mno) {
		this.rdate = rdate;
		this.mno = mno;
	}
	public Schedule(String rdate, Integer scount, Integer mno) {		
		this.rdate = rdate;
		this.Scount = scount;
		this.mno = mno;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public Integer getScount() {
		return Scount;
	}

	public void setScount(Integer scount) {
		Scount = scount;
	}

	public Integer getMno() {
		return mno;
	}

	public void setMno(Integer mno) {
		this.mno = mno;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mno == null) ? 0 : mno.hashCode());
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
		if (mno == null) {
			if (other.mno != null)
				return false;
		} else if (!mno.equals(other.mno))
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
		builder.append(", mno=");
		builder.append(mno);
		builder.append("]");
		return builder.toString();
	}

	
	
}
