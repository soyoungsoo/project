package com.koitt.movie.model;

import java.util.Set;

public class seat {
	
	private Integer tno;
	private String seatno;
	private Integer issue;
	private Integer	Scount; /* 상영회차*/
	private Set<Schedule> schedule;
	
	public seat() {}

	public seat(Integer tno, String seatno, Integer issue, Integer scount, Set<Schedule> schedule) {
		super();
		this.tno = tno;
		this.seatno = seatno;
		this.issue = issue;
		Scount = scount;
		this.schedule = schedule;
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
		Scount = scount;
	}

	public Set<Schedule> getSchedule() {
		return schedule;
	}

	public void setSchedule(Set<Schedule> schedule) {
		this.schedule = schedule;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Scount == null) ? 0 : Scount.hashCode());
		result = prime * result + ((issue == null) ? 0 : issue.hashCode());
		result = prime * result + ((schedule == null) ? 0 : schedule.hashCode());
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
		if (Scount == null) {
			if (other.Scount != null)
				return false;
		} else if (!Scount.equals(other.Scount))
			return false;
		if (issue == null) {
			if (other.issue != null)
				return false;
		} else if (!issue.equals(other.issue))
			return false;
		if (schedule == null) {
			if (other.schedule != null)
				return false;
		} else if (!schedule.equals(other.schedule))
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
		builder.append(", Scount=");
		builder.append(Scount);
		builder.append(", schedule=");
		builder.append(schedule);
		builder.append("]");
		return builder.toString();
	}
	
	
}
