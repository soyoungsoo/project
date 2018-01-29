package com.koitt.movie.model;

import java.util.Date;


public class Movie {
	
	private Integer mno;
	private String title;
	private String content;
	private String genre;
	private String grade;
	private String mrun;		
	private Date sdate;	
	private Date edate;
	private String post; 

	public Movie() {}			
	
	public Movie(Integer mno, String title, String content, String genre, String grade, String mrun, Date sdate,
			Date edate, String post) {			
		this.mno = mno;
		this.title = title;
		this.content = content;
		this.genre = genre;
		this.grade = grade;
		this.mrun = mrun;	
		this.sdate = sdate;
		this.edate = edate;
		this.post = post;
	}

	public Integer getMno() {
		return mno;
	}

	public void setMno(Integer mno) {
		this.mno = mno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getMrun() {
		return mrun;
	}

	public void setMrun(String mrun) {
		this.mrun = mrun;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((edate == null) ? 0 : edate.hashCode());
		result = prime * result + ((genre == null) ? 0 : genre.hashCode());
		result = prime * result + ((grade == null) ? 0 : grade.hashCode());
		result = prime * result + ((mno == null) ? 0 : mno.hashCode());
		result = prime * result + ((mrun == null) ? 0 : mrun.hashCode());
		result = prime * result + ((post == null) ? 0 : post.hashCode());
		result = prime * result + ((sdate == null) ? 0 : sdate.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
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
		Movie other = (Movie) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (edate == null) {
			if (other.edate != null)
				return false;
		} else if (!edate.equals(other.edate))
			return false;
		if (genre == null) {
			if (other.genre != null)
				return false;
		} else if (!genre.equals(other.genre))
			return false;
		if (grade == null) {
			if (other.grade != null)
				return false;
		} else if (!grade.equals(other.grade))
			return false;
		if (mno == null) {
			if (other.mno != null)
				return false;
		} else if (!mno.equals(other.mno))
			return false;
		if (mrun == null) {
			if (other.mrun != null)
				return false;
		} else if (!mrun.equals(other.mrun))
			return false;
		if (post == null) {
			if (other.post != null)
				return false;
		} else if (!post.equals(other.post))
			return false;
		if (sdate == null) {
			if (other.sdate != null)
				return false;
		} else if (!sdate.equals(other.sdate))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Movie [mno=");
		builder.append(mno);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append(", genre=");
		builder.append(genre);
		builder.append(", grade=");
		builder.append(grade);
		builder.append(", mrun=");
		builder.append(mrun);
		builder.append(", sdate=");
		builder.append(sdate);
		builder.append(", edate=");
		builder.append(edate);
		builder.append(", post=");
		builder.append(post);
		builder.append("]");
		return builder.toString();
	}

	
}
