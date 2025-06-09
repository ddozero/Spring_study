package com.yeong.member.model;

public interface MemberDAO {
	
	public static final int NOT_ID = 1;
	public static final int NOT_PWD = 2;
	public static final int LOGIN_OK = 3;
	public static final int ERROR = -1;
	
	//1.회원가입
	public int memberJoin(MemberDTO dto);
	
	
	

}
