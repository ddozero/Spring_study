package com.yeong.member.service;

import com.yeong.member.model.MemberDAO;
import com.yeong.member.model.MemberDTO;

public class MemberServiceImple implements MemberService {

	private MemberDAO memberDao;

	public MemberDAO getMemberDao() {
		return memberDao;
	}

	public void setMemberDao(MemberDAO memberDao) {
		this.memberDao = memberDao;
	}

	
	//1.회원가입
	@Override
	public int memberJoin(MemberDTO dto) {
		int count = memberDao.memberJoin(dto);
		return count;
	}
}
