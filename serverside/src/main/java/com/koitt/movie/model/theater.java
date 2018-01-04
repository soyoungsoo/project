package com.koitt.movie.model;

public class theater {

	private Integer tno;
	private Integer totalSeatNo;
	
	public theater() {}

	public theater(Integer tno, Integer totalSeatNo) {
		super();
		this.tno = tno;
		this.totalSeatNo = totalSeatNo;
	}

	public Integer getTno() {
		return tno;
	}

	public void setTno(Integer tno) {
		this.tno = tno;
	}

	public Integer getTotalSeatNo() {
		return totalSeatNo;
	}

	public void setTotalSeatNo(Integer totalSeatNo) {
		this.totalSeatNo = totalSeatNo;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((tno == null) ? 0 : tno.hashCode());
		result = prime * result + ((totalSeatNo == null) ? 0 : totalSeatNo.hashCode());
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
		if (tno == null) {
			if (other.tno != null)
				return false;
		} else if (!tno.equals(other.tno))
			return false;
		if (totalSeatNo == null) {
			if (other.totalSeatNo != null)
				return false;
		} else if (!totalSeatNo.equals(other.totalSeatNo))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("theater [tno=");
		builder.append(tno);
		builder.append(", totalSeatNo=");
		builder.append(totalSeatNo);
		builder.append("]");
		return builder.toString();
	}
	
	
}
