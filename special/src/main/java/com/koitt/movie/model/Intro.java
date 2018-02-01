package com.koitt.movie.model;

public class Intro {

	private Integer Ino;
	private Integer mno;
	private String image;
	private String video;
	
	public Intro() {}

	public Intro(Integer ino, Integer mno, String image, String video) {
		super();
		Ino = ino;
		this.mno = mno;
		this.image = image;
		this.video = video;
	}

	public Integer getIno() {
		return Ino;
	}

	public void setIno(Integer ino) {
		Ino = ino;
	}

	public Integer getMno() {
		return mno;
	}

	public void setMno(Integer mno) {
		this.mno = mno;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Ino == null) ? 0 : Ino.hashCode());
		result = prime * result + ((image == null) ? 0 : image.hashCode());
		result = prime * result + ((mno == null) ? 0 : mno.hashCode());
		result = prime * result + ((video == null) ? 0 : video.hashCode());
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
		Intro other = (Intro) obj;
		if (Ino == null) {
			if (other.Ino != null)
				return false;
		} else if (!Ino.equals(other.Ino))
			return false;
		if (image == null) {
			if (other.image != null)
				return false;
		} else if (!image.equals(other.image))
			return false;
		if (mno == null) {
			if (other.mno != null)
				return false;
		} else if (!mno.equals(other.mno))
			return false;
		if (video == null) {
			if (other.video != null)
				return false;
		} else if (!video.equals(other.video))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Intro [Ino=");
		builder.append(Ino);
		builder.append(", mno=");
		builder.append(mno);
		builder.append(", image=");
		builder.append(image);
		builder.append(", video=");
		builder.append(video);
		builder.append("]");
		return builder.toString();
	}
	
	
}
