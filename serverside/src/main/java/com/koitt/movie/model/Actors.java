package com.koitt.movie.model;

public class Actors {

	private Integer ano;
	private Integer Movie_no;
	private String name;
	private String job;
	
	public Actors() {}

	public Actors(Integer ano, Integer movie_no, String name, String job) {	
		this.ano = ano;
		Movie_no = movie_no;
		this.name = name;
		this.job = job;
	}

	public Integer getAno() {
		return ano;
	}

	public void setAno(Integer ano) {
		this.ano = ano;
	}

	public Integer getMovie_no() {
		return Movie_no;
	}

	public void setMovie_no(Integer movie_no) {
		Movie_no = movie_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Movie_no == null) ? 0 : Movie_no.hashCode());
		result = prime * result + ((ano == null) ? 0 : ano.hashCode());
		result = prime * result + ((job == null) ? 0 : job.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
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
		Actors other = (Actors) obj;
		if (Movie_no == null) {
			if (other.Movie_no != null)
				return false;
		} else if (!Movie_no.equals(other.Movie_no))
			return false;
		if (ano == null) {
			if (other.ano != null)
				return false;
		} else if (!ano.equals(other.ano))
			return false;
		if (job == null) {
			if (other.job != null)
				return false;
		} else if (!job.equals(other.job))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Actors [ano=");
		builder.append(ano);
		builder.append(", Movie_no=");
		builder.append(Movie_no);
		builder.append(", name=");
		builder.append(name);
		builder.append(", job=");
		builder.append(job);
		builder.append("]");
		return builder.toString();
	}
	
	
}
