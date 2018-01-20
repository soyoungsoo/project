package com.koitt.movie.model;


public class Seat {
	
	private Integer tno;
	private String seatno;
	private Integer issue;
	private Integer	Scount; /* 상영회차*/	
	private String rdate;
	private Integer mno; /* 영화번호 */
	private Integer d;
	private Integer f;
	
	public Seat() {}
	
	public Seat(Integer tno, Integer mno, String rdate) {
		this.tno=tno;
		this.mno=mno;
		this.rdate=rdate;
	}
	public Seat(Integer tno, String seatno, Integer issue, Integer scount, String rdate, Integer mno, Integer d,
			Integer f) {		
		this.tno = tno;
		this.seatno = seatno;
		this.issue = issue;
		this.Scount = scount;
		this.rdate = rdate;
		this.mno = mno;
		this.d = d;
		this.f = f;
	}

	public Seat(String rdate,Integer tno, String seatno, Integer issue) {
		this.rdate=rdate;
		this.tno=tno;
		this.seatno=seatno;
		this.issue=issue;
	}
	public Integer getTno() {
		return tno;
	}

	public void setTno(Integer tno) {
		this.tno = tno;
	}

	public String getSeatno() {
		return seatno;
	}

	public void setSeatno(String seatno) {
		this.seatno = seatno;
	}

	public Integer getIssue() {
		return issue;
	}

	public void setIssue(Integer issue) {
		this.issue = issue;
	}

	public Integer getScount() {
		return Scount;
	}

	public void setScount(Integer scount) {
		this.Scount = scount;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public Integer getMno() {
		return mno;
	}

	public void setMno(Integer mno) {
		this.mno = mno;
	}

	public Integer getD() {
		return d;
	}

	public void setD(Integer d) {
		this.d = d;
	}

	public Integer getF() {
		return f;
	}

	public void setF(Integer f) {
		this.f = f;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mno == null) ? 0 : mno.hashCode());
		result = prime * result + ((Scount == null) ? 0 : Scount.hashCode());
		result = prime * result + ((d == null) ? 0 : d.hashCode());
		result = prime * result + ((f == null) ? 0 : f.hashCode());
		result = prime * result + ((issue == null) ? 0 : issue.hashCode());
		result = prime * result + ((rdate == null) ? 0 : rdate.hashCode());
		result = prime * result + ((seatno == null) ? 0 : seatno.hashCode());
		result = prime * result + ((tno == null) ? 0 : tno.hashCode());
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
		Seat other = (Seat) obj;
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
		if (d == null) {
			if (other.d != null)
				return false;
		} else if (!d.equals(other.d))
			return false;
		if (f == null) {
			if (other.f != null)
				return false;
		} else if (!f.equals(other.f))
			return false;
		if (issue == null) {
			if (other.issue != null)
				return false;
		} else if (!issue.equals(other.issue))
			return false;
		if (rdate == null) {
			if (other.rdate != null)
				return false;
		} else if (!rdate.equals(other.rdate))
			return false;
		if (seatno == null) {
			if (other.seatno != null)
				return false;
		} else if (!seatno.equals(other.seatno))
			return false;
		if (tno == null) {
			if (other.tno != null)
				return false;
		} else if (!tno.equals(other.tno))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Seat [tno=");
		builder.append(tno);
		builder.append(", seatno=");
		builder.append(seatno);
		builder.append(", issue=");
		builder.append(issue);
		builder.append(", Scount=");
		builder.append(Scount);
		builder.append(", rdate=");
		builder.append(rdate);
		builder.append(", mno=");
		builder.append(mno);
		builder.append(", d=");
		builder.append(d);
		builder.append(", f=");
		builder.append(f);
		builder.append("]");
		return builder.toString();
	}


	
	
}
