package com.yeong.bbs.model;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class BbsDAOImple implements BbsDAO {
	
	private SqlSessionTemplate sqlSession;
	
	public BbsDAOImple(SqlSessionTemplate sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public List<BbsDTO> bbsListAll() {
		List<BbsDTO> lists = sqlSession.selectList("bbsListAll");
		return lists;
	}
	
	@Override
	public int bbsWrite(BbsDTO dto) {
		int count = sqlSession.insert("bbsWrite",dto);
		return count;
	}
	
	@Override
	public BbsDTO bbsContent(int idx) {
		BbsDTO dto = sqlSession.selectOne("bbsContent",idx);
		return dto;
	}

}
