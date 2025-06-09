package com.yeong.member.model;

import java.sql.Date;

public class MemberDTO {

	private int idx;
	private String id;
	private String password;
	private String name;
	private String email;
	private String tel;
	private String address;
	private Date joindate;

	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(int idx, String id, String password, String name, String email, String tel, String address,
			Date joindate) {
		super();
		this.idx = idx;
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.address = address;
		this.joindate = joindate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

}
