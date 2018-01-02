package com.koitt.movie.model;

import java.util.Set;

public class Member {
	
	private Integer Member_no;			// 회원번호 (Primary Key)
	private String id;				// 이메일
	private String pwd;			// 비밀번호
	private String name;				// 이름
	private String birth;				// 아바타 이미지 파일명
	private String email;
	private Set<UserType> userTypes;	// ADMIN, USER
	
	public Member() {}

	public Member(Integer member_no, String id, String pwd, String name, String birth, String email,
			Set<UserType> userTypes) {		
		Member_no = member_no;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.userTypes = userTypes;
	}

	public Integer getMember_no() {
		return Member_no;
	}

	public void setMember_no(Integer member_no) {
		Member_no = member_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set<UserType> getUserTypes() {
		return userTypes;
	}

	public void setUserTypes(Set<UserType> userTypes) {
		this.userTypes = userTypes;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Member_no == null) ? 0 : Member_no.hashCode());
		result = prime * result + ((birth == null) ? 0 : birth.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((pwd == null) ? 0 : pwd.hashCode());
		result = prime * result + ((userTypes == null) ? 0 : userTypes.hashCode());
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
		Member other = (Member) obj;
		if (Member_no == null) {
			if (other.Member_no != null)
				return false;
		} else if (!Member_no.equals(other.Member_no))
			return false;
		if (birth == null) {
			if (other.birth != null)
				return false;
		} else if (!birth.equals(other.birth))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (pwd == null) {
			if (other.pwd != null)
				return false;
		} else if (!pwd.equals(other.pwd))
			return false;
		if (userTypes == null) {
			if (other.userTypes != null)
				return false;
		} else if (!userTypes.equals(other.userTypes))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserInfo [Member_no=");
		builder.append(Member_no);
		builder.append(", id=");
		builder.append(id);
		builder.append(", pwd=");
		builder.append(pwd);
		builder.append(", name=");
		builder.append(name);
		builder.append(", birth=");
		builder.append(birth);
		builder.append(", email=");
		builder.append(email);
		builder.append(", userTypes=");
		builder.append(userTypes);
		builder.append("]");
		return builder.toString();
	}
	
	
}
