package com.koitt.movie.model;


public class Reservation {

	private Integer rno; /* 예매번호 */
	private Integer memno;  /* 회원번호 */
	private Integer mno; /* 영화번호 */	
	private Integer tno; /* 상영관번호 */
	private String seatno; /* 좌석번호 */
	private String btime; /* 티켓팅코드 */
	private Integer Scount;	
	private String title;
	private String rdate;
	
	public Reservation() {}

	public Reservation(Integer rno, Integer memno, Integer mno, Integer tno, String seatno, String btime,
			Integer scount, String title, String rdate) {		
		this.rno = rno;
		this.memno = memno;
		this.mno = mno;
		this.tno = tno;
		this.seatno = seatno;
		this.btime = btime;
		this.Scount = scount;
		this.title = title;
		this.rdate = rdate;
	}

	public Integer getRno() {
		return rno;
	}

	public void setRno(Integer rno) {
		this.rno = rno;
	}

	public Integer getMemno() {
		return memno;
	}

	public void setMemno(Integer memno) {
		this.memno = memno;
	}

	public Integer getMno() {
		return mno;
	}

	public void setMno(Integer mno) {
		this.mno = mno;
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

	public String getBtime() {
		return btime;
	}

	public void setBtime(String btime) {
		this.btime = btime;
	}

	public Integer getScount() {
		return Scount;
	}

	public void setScount(Integer scount) {
		this.Scount = scount;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Scount == null) ? 0 : Scount.hashCode());
		result = prime * result + ((btime == null) ? 0 : btime.hashCode());
		result = prime * result + ((memno == null) ? 0 : memno.hashCode());
		result = prime * result + ((mno == null) ? 0 : mno.hashCode());
		result = prime * result + ((rdate == null) ? 0 : rdate.hashCode());
		result = prime * result + ((rno == null) ? 0 : rno.hashCode());
		result = prime * result + ((seatno == null) ? 0 : seatno.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
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
		Reservation other = (Reservation) obj;
		if (Scount == null) {
			if (other.Scount != null)
				return false;
		} else if (!Scount.equals(other.Scount))
			return false;
		if (btime == null) {
			if (other.btime != null)
				return false;
		} else if (!btime.equals(other.btime))
			return false;
		if (memno == null) {
			if (other.memno != null)
				return false;
		} else if (!memno.equals(other.memno))
			return false;
		if (mno == null) {
			if (other.mno != null)
				return false;
		} else if (!mno.equals(other.mno))
			return false;
		if (rdate == null) {
			if (other.rdate != null)
				return false;
		} else if (!rdate.equals(other.rdate))
			return false;
		if (rno == null) {
			if (other.rno != null)
				return false;
		} else if (!rno.equals(other.rno))
			return false;
		if (seatno == null) {
			if (other.seatno != null)
				return false;
		} else if (!seatno.equals(other.seatno))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
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
		builder.append("Reservation [rno=");
		builder.append(rno);
		builder.append(", memno=");
		builder.append(memno);
		builder.append(", mno=");
		builder.append(mno);
		builder.append(", tno=");
		builder.append(tno);
		builder.append(", seatno=");
		builder.append(seatno);
		builder.append(", btime=");
		builder.append(btime);
		builder.append(", Scount=");
		builder.append(Scount);
		builder.append(", title=");
		builder.append(title);
		builder.append(", rdate=");
		builder.append(rdate);
		builder.append("]");
		return builder.toString();
	}
	
	
}
