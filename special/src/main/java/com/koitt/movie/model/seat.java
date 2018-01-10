package com.koitt.movie.model;

public class seat {
	
	private Integer tno;
	private String seatno;
	private Integer issue;
	
	public seat() {}

	public seat(Integer tno, String seatno, Integer issue) {		
		this.tno = tno;
		this.seatno = seatno;
		this.issue = issue;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((issue == null) ? 0 : issue.hashCode());
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
		seat other = (seat) obj;
		if (issue == null) {
			if (other.issue != null)
				return false;
		} else if (!issue.equals(other.issue))
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
		builder.append("seat [tno=");
		builder.append(tno);
		builder.append(", seatno=");
		builder.append(seatno);
		builder.append(", issue=");
		builder.append(issue);
		builder.append("]");
		return builder.toString();
	}

	
}
