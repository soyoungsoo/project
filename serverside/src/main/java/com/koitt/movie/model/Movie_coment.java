package com.koitt.movie.model;

public class Movie_coment {

	private Integer cno;
	private Integer mno;
	private Integer memberno;
	private String coment;
	private Integer score;
	private Integer viewcount;
	
	public Movie_coment() {}

	public Movie_coment(Integer cno, Integer mno, Integer memberno, String coment, Integer score, Integer viewcount) {
		super();
		this.cno = cno;
		this.mno = mno;
		this.memberno = memberno;
		this.coment = coment;
		this.score = score;
		this.viewcount = viewcount;
	}

	public Integer getCno() {
		return cno;
	}

	public void setCno(Integer cno) {
		this.cno = cno;
	}

	public Integer getMno() {
		return mno;
	}

	public void setMno(Integer mno) {
		this.mno = mno;
	}

	public Integer getMemberno() {
		return memberno;
	}

	public void setMemberno(Integer memberno) {
		this.memberno = memberno;
	}

	public String getComent() {
		return coment;
	}

	public void setComent(String coment) {
		this.coment = coment;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getViewcount() {
		return viewcount;
	}

	public void setViewcount(Integer viewcount) {
		this.viewcount = viewcount;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cno == null) ? 0 : cno.hashCode());
		result = prime * result + ((coment == null) ? 0 : coment.hashCode());
		result = prime * result + ((memberno == null) ? 0 : memberno.hashCode());
		result = prime * result + ((mno == null) ? 0 : mno.hashCode());
		result = prime * result + ((score == null) ? 0 : score.hashCode());
		result = prime * result + ((viewcount == null) ? 0 : viewcount.hashCode());
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
		Movie_coment other = (Movie_coment) obj;
		if (cno == null) {
			if (other.cno != null)
				return false;
		} else if (!cno.equals(other.cno))
			return false;
		if (coment == null) {
			if (other.coment != null)
				return false;
		} else if (!coment.equals(other.coment))
			return false;
		if (memberno == null) {
			if (other.memberno != null)
				return false;
		} else if (!memberno.equals(other.memberno))
			return false;
		if (mno == null) {
			if (other.mno != null)
				return false;
		} else if (!mno.equals(other.mno))
			return false;
		if (score == null) {
			if (other.score != null)
				return false;
		} else if (!score.equals(other.score))
			return false;
		if (viewcount == null) {
			if (other.viewcount != null)
				return false;
		} else if (!viewcount.equals(other.viewcount))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Movie_coment [cno=");
		builder.append(cno);
		builder.append(", mno=");
		builder.append(mno);
		builder.append(", memberno=");
		builder.append(memberno);
		builder.append(", coment=");
		builder.append(coment);
		builder.append(", score=");
		builder.append(score);
		builder.append(", viewcount=");
		builder.append(viewcount);
		builder.append("]");
		return builder.toString();
	}
	
	
}
