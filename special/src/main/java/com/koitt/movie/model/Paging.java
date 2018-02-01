package com.koitt.movie.model;
public class Paging {
	
	private Integer curPage;
	private Integer mno;
	private Integer allpages;
	private Integer startgrouppage;
	private Integer endgrouppage;
	private Integer cno;	
	private String id;
	private String mcomment;
	private Integer score;
	private Integer vcount;
	private String ctime;
	
	public Paging() {}

	public Paging(Integer curPage, Integer mno, Integer allpages, Integer startgrouppage, Integer endgrouppage,
			Integer cno, String id, String mcomment, Integer score, Integer vcount, String ctime) {
		super();
		this.curPage = curPage;
		this.mno = mno;
		this.allpages = allpages;
		this.startgrouppage = startgrouppage;
		this.endgrouppage = endgrouppage;
		this.cno = cno;
		this.id = id;
		this.mcomment = mcomment;
		this.score = score;
		this.vcount = vcount;
		this.ctime = ctime;
	}

	public Integer getCurPage() {
		return curPage;
	}

	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
	}

	public Integer getMno() {
		return mno;
	}

	public void setMno(Integer mno) {
		this.mno = mno;
	}

	public Integer getAllpages() {
		return allpages;
	}

	public void setAllpages(Integer allpages) {
		this.allpages = allpages;
	}

	public Integer getStartgrouppage() {
		return startgrouppage;
	}

	public void setStartgrouppage(Integer startgrouppage) {
		this.startgrouppage = startgrouppage;
	}

	public Integer getEndgrouppage() {
		return endgrouppage;
	}

	public void setEndgrouppage(Integer endgrouppage) {
		this.endgrouppage = endgrouppage;
	}

	public Integer getCno() {
		return cno;
	}

	public void setCno(Integer cno) {
		this.cno = cno;
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
		result = prime * result + ((allpages == null) ? 0 : allpages.hashCode());
		result = prime * result + ((cno == null) ? 0 : cno.hashCode());
		result = prime * result + ((ctime == null) ? 0 : ctime.hashCode());
		result = prime * result + ((curPage == null) ? 0 : curPage.hashCode());
		result = prime * result + ((endgrouppage == null) ? 0 : endgrouppage.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((mcomment == null) ? 0 : mcomment.hashCode());
		result = prime * result + ((mno == null) ? 0 : mno.hashCode());
		result = prime * result + ((score == null) ? 0 : score.hashCode());
		result = prime * result + ((startgrouppage == null) ? 0 : startgrouppage.hashCode());
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
		Paging other = (Paging) obj;
		if (allpages == null) {
			if (other.allpages != null)
				return false;
		} else if (!allpages.equals(other.allpages))
			return false;
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
		if (curPage == null) {
			if (other.curPage != null)
				return false;
		} else if (!curPage.equals(other.curPage))
			return false;
		if (endgrouppage == null) {
			if (other.endgrouppage != null)
				return false;
		} else if (!endgrouppage.equals(other.endgrouppage))
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
		if (startgrouppage == null) {
			if (other.startgrouppage != null)
				return false;
		} else if (!startgrouppage.equals(other.startgrouppage))
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
		builder.append("Paging [curPage=");
		builder.append(curPage);
		builder.append(", mno=");
		builder.append(mno);
		builder.append(", allpages=");
		builder.append(allpages);
		builder.append(", startgrouppage=");
		builder.append(startgrouppage);
		builder.append(", endgrouppage=");
		builder.append(endgrouppage);
		builder.append(", cno=");
		builder.append(cno);
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
