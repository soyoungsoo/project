package com.koitt.movie.model;

public class theater {

	private Integer t_no;
	private Integer total_seat_no;
	
	public theater() {}

	public theater(Integer t_no, Integer total_seat_no) {		
		this.t_no = t_no;
		this.total_seat_no = total_seat_no;
	}

	public Integer getT_no() {
		return t_no;
	}

	public void setT_no(Integer t_no) {
		this.t_no = t_no;
	}

	public Integer getTotal_seat_no() {
		return total_seat_no;
	}

	public void setTotal_seat_no(Integer total_seat_no) {
		this.total_seat_no = total_seat_no;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((t_no == null) ? 0 : t_no.hashCode());
		result = prime * result + ((total_seat_no == null) ? 0 : total_seat_no.hashCode());
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
		theater other = (theater) obj;
		if (t_no == null) {
			if (other.t_no != null)
				return false;
		} else if (!t_no.equals(other.t_no))
			return false;
		if (total_seat_no == null) {
			if (other.total_seat_no != null)
				return false;
		} else if (!total_seat_no.equals(other.total_seat_no))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("theater [t_no=");
		builder.append(t_no);
		builder.append(", total_seat_no=");
		builder.append(total_seat_no);
		builder.append("]");
		return builder.toString();
	}
	
	
}
