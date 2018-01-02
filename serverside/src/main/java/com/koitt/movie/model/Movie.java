package com.koitt.movie.model;

import java.util.Date;

public class Movie {
	
	private Integer Movie_no;
	private String title;
	private String content;
	private String genre;
	private String grade;
	private String mrun;
	private Date start_date;
	private Date end_date;
	private String m_post; 

	public Movie() {}

	public Movie(Integer movie_no, String title, String content, String genre, String grade, String mrun,
			Date start_date, Date end_date, String m_post) {
		super();
		Movie_no = movie_no;
		this.title = title;
		this.content = content;
		this.genre = genre;
		this.grade = grade;
		this.mrun = mrun;
		this.start_date = start_date;
		this.end_date = end_date;
		this.m_post = m_post;
	}

	public Integer getMovie_no() {
		return Movie_no;
	}

	public void setMovie_no(Integer movie_no) {
		Movie_no = movie_no;
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

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getM_post() {
		return m_post;
	}

	public void setM_post(String m_post) {
		this.m_post = m_post;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Movie_no == null) ? 0 : Movie_no.hashCode());
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((end_date == null) ? 0 : end_date.hashCode());
		result = prime * result + ((genre == null) ? 0 : genre.hashCode());
		result = prime * result + ((grade == null) ? 0 : grade.hashCode());
		result = prime * result + ((m_post == null) ? 0 : m_post.hashCode());
		result = prime * result + ((mrun == null) ? 0 : mrun.hashCode());
		result = prime * result + ((start_date == null) ? 0 : start_date.hashCode());
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
		if (Movie_no == null) {
			if (other.Movie_no != null)
				return false;
		} else if (!Movie_no.equals(other.Movie_no))
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (end_date == null) {
			if (other.end_date != null)
				return false;
		} else if (!end_date.equals(other.end_date))
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
		if (m_post == null) {
			if (other.m_post != null)
				return false;
		} else if (!m_post.equals(other.m_post))
			return false;
		if (mrun == null) {
			if (other.mrun != null)
				return false;
		} else if (!mrun.equals(other.mrun))
			return false;
		if (start_date == null) {
			if (other.start_date != null)
				return false;
		} else if (!start_date.equals(other.start_date))
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
		builder.append("Movie [Movie_no=");
		builder.append(Movie_no);
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
		builder.append(", start_date=");
		builder.append(start_date);
		builder.append(", end_date=");
		builder.append(end_date);
		builder.append(", m_post=");
		builder.append(m_post);
		builder.append("]");
		return builder.toString();
	}	
	
	
}
