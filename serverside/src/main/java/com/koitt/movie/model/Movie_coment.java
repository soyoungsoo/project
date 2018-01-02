package com.koitt.movie.model;

public class Movie_coment {

	private Integer coment_no;
	private Integer Movie_no;
	private Integer Member_no;
	private String coment;
	private Integer score;
	private Integer viewcount;
	
	public Movie_coment() {}

	public Movie_coment(Integer coment_no, Integer movie_no, Integer member_no, String coment, Integer score,
			Integer viewcount) {
		super();
		this.coment_no = coment_no;
		Movie_no = movie_no;
		Member_no = member_no;
		this.coment = coment;
		this.score = score;
		this.viewcount = viewcount;
	}

	public Integer getComent_no() {
		return coment_no;
	}

	public void setComent_no(Integer coment_no) {
		this.coment_no = coment_no;
	}

	public Integer getMovie_no() {
		return Movie_no;
	}

	public void setMovie_no(Integer movie_no) {
		Movie_no = movie_no;
	}

	public Integer getMember_no() {
		return Member_no;
	}

	public void setMember_no(Integer member_no) {
		Member_no = member_no;
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
		result = prime * result + ((Member_no == null) ? 0 : Member_no.hashCode());
		result = prime * result + ((Movie_no == null) ? 0 : Movie_no.hashCode());
		result = prime * result + ((coment == null) ? 0 : coment.hashCode());
		result = prime * result + ((coment_no == null) ? 0 : coment_no.hashCode());
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
		if (Member_no == null) {
			if (other.Member_no != null)
				return false;
		} else if (!Member_no.equals(other.Member_no))
			return false;
		if (Movie_no == null) {
			if (other.Movie_no != null)
				return false;
		} else if (!Movie_no.equals(other.Movie_no))
			return false;
		if (coment == null) {
			if (other.coment != null)
				return false;
		} else if (!coment.equals(other.coment))
			return false;
		if (coment_no == null) {
			if (other.coment_no != null)
				return false;
		} else if (!coment_no.equals(other.coment_no))
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
		builder.append("Movie_coment [coment_no=");
		builder.append(coment_no);
		builder.append(", Movie_no=");
		builder.append(Movie_no);
		builder.append(", Member_no=");
		builder.append(Member_no);
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
