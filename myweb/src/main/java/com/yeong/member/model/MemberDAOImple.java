package com.yeong.member.model;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {
	
	private SqlSessionTemplate sqlSession;

	public MemberDAOImple(SqlSessionTemplate sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}
	
	public MemberDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public int memberJoin(MemberDTO dto) {
		int count = sqlSession.insert("memberJoin",dto);
		return count;
	}
	
	
	
	
	

}
