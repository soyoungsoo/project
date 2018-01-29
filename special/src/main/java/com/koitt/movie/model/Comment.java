package com.koitt.movie.model;

public class Comment {

	private Integer cno;
	private Integer mno;
	private String id;
	private String comment;
	private Integer score;
	private Integer viewcount;
	private String ctime;
	
	public Comment() {}

	public Comment(Integer cno, Integer mno, String id, String comment, Integer score, Integer viewcount,
			String ctime) {
		super();
		this.cno = cno;
		this.mno = mno;
		this.id = id;
		this.comment = comment;
		this.score = score;
		this.viewcount = viewcount;
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

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
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
		result = prime * result + ((comment == null) ? 0 : comment.hashCode());
		result = prime * result + ((ctime == null) ? 0 : ctime.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		Comment other = (Comment) obj;
		if (cno == null) {
			if (other.cno != null)
				return false;
		} else if (!cno.equals(other.cno))
			return false;
		if (comment == null) {
			if (other.comment != null)
				return false;
		} else if (!comment.equals(other.comment))
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
		builder.append("Comment [cno=");
		builder.append(cno);
		builder.append(", mno=");
		builder.append(mno);
		builder.append(", id=");
		builder.append(id);
		builder.append(", comment=");
		builder.append(comment);
		builder.append(", score=");
		builder.append(score);
		builder.append(", viewcount=");
		builder.append(viewcount);
		builder.append(", ctime=");
		builder.append(ctime);
		builder.append("]");
		return builder.toString();
	}

	
}
