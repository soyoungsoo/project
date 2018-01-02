package com.koitt.movie.model;

public class Ticket {

	private Integer Movie_no; // 영화번호
	private Integer T_no;	  // 티켓번호 (Primary Key)
	private Integer r_no;	  // 예매번호
	
	public Ticket() {}

	public Ticket(Integer movie_no, Integer t_no, Integer r_no) {		
		this.Movie_no = movie_no;
		this.T_no = t_no;
		this.r_no = r_no;
	}

	public Integer getMovie_no() {
		return Movie_no;
	}

	public void setMovie_no(Integer movie_no) {
		Movie_no = movie_no;
	}

	public Integer getT_no() {
		return T_no;
	}

	public void setT_no(Integer t_no) {
		T_no = t_no;
	}

	public Integer getR_no() {
		return r_no;
	}

	public void setR_no(Integer r_no) {
		this.r_no = r_no;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Movie_no == null) ? 0 : Movie_no.hashCode());
		result = prime * result + ((T_no == null) ? 0 : T_no.hashCode());
		result = prime * result + ((r_no == null) ? 0 : r_no.hashCode());
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
		if (Movie_no == null) {
			if (other.Movie_no != null)
				return false;
		} else if (!Movie_no.equals(other.Movie_no))
			return false;
		if (T_no == null) {
			if (other.T_no != null)
				return false;
		} else if (!T_no.equals(other.T_no))
			return false;
		if (r_no == null) {
			if (other.r_no != null)
				return false;
		} else if (!r_no.equals(other.r_no))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Ticket [Movie_no=");
		builder.append(Movie_no);
		builder.append(", T_no=");
		builder.append(T_no);
		builder.append(", r_no=");
		builder.append(r_no);
		builder.append("]");
		return builder.toString();
	}
	
	
}
