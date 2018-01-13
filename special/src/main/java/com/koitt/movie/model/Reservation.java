package com.koitt.movie.model;

public class Reservation {

	private Integer rno; /* 예매번호 */
	private Integer MemNo;  /* 회원번호 */
	private Integer Mno; /* 영화번호 */
	private Integer tno; /* 상영관번호 */
	private String seatno; /* 좌석번호 */
	private String btime; /* 티켓팅코드 */
	
	public Reservation() {}

	public Reservation(Integer rno, Integer memNo, Integer mno, Integer tno, String seatno, String bno) {

		this.rno = rno;
		this.MemNo = memNo;
		this.Mno = mno;
		this.tno = tno;
		this.seatno = seatno;
		this.btime = bno;
	}

	public Integer getRno() {
		return rno;
	}

	public void setRno(Integer rno) {
		this.rno = rno;
	}

	public Integer getMemNo() {
		return MemNo;
	}

	public void setMemNo(Integer memNo) {
		MemNo = memNo;
	}

	public Integer getMno() {
		return Mno;
	}

	public void setMno(Integer mno) {
		Mno = mno;
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

	public String getBno() {
		return btime;
	}

	public void setBno(String bno) {
		this.btime = bno;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((MemNo == null) ? 0 : MemNo.hashCode());
		result = prime * result + ((Mno == null) ? 0 : Mno.hashCode());
		result = prime * result + ((btime == null) ? 0 : btime.hashCode());
		result = prime * result + ((rno == null) ? 0 : rno.hashCode());
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
		Reservation other = (Reservation) obj;
		if (MemNo == null) {
			if (other.MemNo != null)
				return false;
		} else if (!MemNo.equals(other.MemNo))
			return false;
		if (Mno == null) {
			if (other.Mno != null)
				return false;
		} else if (!Mno.equals(other.Mno))
			return false;
		if (btime == null) {
			if (other.btime != null)
				return false;
		} else if (!btime.equals(other.btime))
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
		builder.append(", MemNo=");
		builder.append(MemNo);
		builder.append(", Mno=");
		builder.append(Mno);
		builder.append(", tno=");
		builder.append(tno);
		builder.append(", seatno=");
		builder.append(seatno);
		builder.append(", bno=");
		builder.append(btime);
		builder.append("]");
		return builder.toString();
	}
	
	
}
