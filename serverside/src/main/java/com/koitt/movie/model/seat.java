package com.koitt.movie.model;

public class seat {
	
	private Integer t_no;
	private String seat_no;
	private Integer issue;
	
	public seat() {}

	public seat(Integer t_no, String seat_no, Integer issue) {	
		this.t_no = t_no;
		this.seat_no = seat_no;
		this.issue = issue;
	}

	public Integer getT_no() {
		return t_no;
	}

	public void setT_no(Integer t_no) {
		this.t_no = t_no;
	}

	public String getSeat_no() {
		return seat_no;
	}

	public void setSeat_no(String seat_no) {
		this.seat_no = seat_no;
	}

	public Integer getIssue() {
		return issue;
	}

	public void setIssue(Integer issue) {
		this.issue = issue;
	}

	@Override
	public int hashCode() {
		int result = this.t_no.hashCode() + this.seat_no.hashCode() + this.issue.hashCode();
		
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (!(obj instanceof seat)) {
			return false;
		}
		seat item = (seat) obj;
		if (this.seat_no.equals(item.seat_no)) {
			return true;
		}
		return false;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("seat [t_no=");
		builder.append(t_no);
		builder.append(", seat_no=");
		builder.append(seat_no);
		builder.append(", issue=");
		builder.append(issue);
		builder.append("]");
		return builder.toString();
	}
	
	
}
