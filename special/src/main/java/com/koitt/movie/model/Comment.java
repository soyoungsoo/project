package com.koitt.movie.model;

public class Comment {

	private Integer cno;
	private Integer mno;
	private String id;
	private String mcomment;
	private Integer score;
	private Integer vcount;
	private String ctime;
	
	public Comment() {}

	public Comment(Integer cno, Integer mno, String id, String mcomment, Integer score, Integer vcount, String ctime) {
		super();
		this.cno = cno;
		this.mno = mno;
		this.id = id;
		this.mcomment = mcomment;
		this.score = score;
		this.vcount = vcount;
		this.ctime = ctime;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMcomment() {
		return mcomment;
	}

	public void setMcomment(String mcomment) {
		this.mcomment = mcomment;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getVcount() {
		return vcount;
	}

	public void setVcount(Integer vcount) {
		this.vcount = vcount;
	}

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cno == null) ? 0 : cno.hashCode());
		result = prime * result + ((ctime == null) ? 0 : ctime.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((mcomment == null) ? 0 : mcomment.hashCode());
		result = prime * result + ((mno == null) ? 0 : mno.hashCode());
		result = prime * result + ((score == null) ? 0 : score.hashCode());
		result = prime * result + ((vcount == null) ? 0 : vcount.hashCode());
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
		Comment other = (Comment) obj;
		if (cno == null) {
			if (other.cno != null)
				return false;
		} else if (!cno.equals(other.cno))
			return false;
		if (ctime == null) {
			if (other.ctime != null)
				return false;
		} else if (!ctime.equals(other.ctime))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (mcomment == null) {
			if (other.mcomment != null)
				return false;
		} else if (!mcomment.equals(other.mcomment))
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
		if (vcount == null) {
			if (other.vcount != null)
				return false;
		} else if (!vcount.equals(other.vcount))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Comment [cno=");
		builder.append(cno);
		builder.append(", mno=");
		builder.append(mno);
		builder.append(", id=");
		builder.append(id);
		builder.append(", mcomment=");
		builder.append(mcomment);
		builder.append(", score=");
		builder.append(score);
		builder.append(", vcount=");
		builder.append(vcount);
		builder.append(", ctime=");
		builder.append(ctime);
		builder.append("]");
		return builder.toString();
	}

	
}
