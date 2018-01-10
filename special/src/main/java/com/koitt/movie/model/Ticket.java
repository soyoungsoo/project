package com.koitt.movie.model;

public class Ticket {

	private Integer mno; // 영화번호
	private Integer Tno;	  // 티켓번호 (Primary Key)
	private Integer rno;	  // 예매번호
	
	public Ticket() {}

	public Ticket(Integer mno, Integer tno, Integer rno) {		
		this.mno = mno;
		this.Tno = tno;
		this.rno = rno;
	}

	public Integer getMno() {
		return mno;
	}

	public void setMno(Integer mno) {
		this.mno = mno;
	}

	public Integer getTno() {
		return Tno;
	}

	public void setTno(Integer tno) {
		Tno = tno;
	}

	public Integer getRno() {
		return rno;
	}

	public void setRno(Integer rno) {
		this.rno = rno;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Tno == null) ? 0 : Tno.hashCode());
		result = prime * result + ((mno == null) ? 0 : mno.hashCode());
		result = prime * result + ((rno == null) ? 0 : rno.hashCode());
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
		Ticket other = (Ticket) obj;
		if (Tno == null) {
			if (other.Tno != null)
				return false;
		} else if (!Tno.equals(other.Tno))
			return false;
		if (mno == null) {
			if (other.mno != null)
				return false;
		} else if (!mno.equals(other.mno))
			return false;
		if (rno == null) {
			if (other.rno != null)
				return false;
		} else if (!rno.equals(other.rno))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Ticket [mno=");
		builder.append(mno);
		builder.append(", Tno=");
		builder.append(Tno);
		builder.append(", rno=");
		builder.append(rno);
		builder.append("]");
		return builder.toString();
	}

	
}
