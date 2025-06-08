package com.yeong.bbs.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;

import com.yeong.bbs.model.*;

public class BbsServiceImple implements BbsService {
	
	
	private BbsDAO bbsDao;

	public BbsDAO getBbsDao() {
		return bbsDao;
	}

	public void setBbsDao(BbsDAO bbsDao) {
		this.bbsDao = bbsDao;
	}

	@Override
	public List<BbsDTO> bbsListAll() {	
		List<BbsDTO> lists = bbsDao.bbsListAll();
		return lists;
	}
	
	@Override
	public BbsDTO bbsWrite(BbsDTO dto) {
		int count = bbsDao.bbsWrite(dto);
		if(count>0) {
			return dto;
		}else {
			return null;
		}
	}
	
	@Override
	public BbsDTO bbsContent(int idx) {
		BbsDTO dto = bbsDao.bbsContent(idx);
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));

		return dto;
	}
	
	@Override
	public int bbsUpdate(BbsDTO dto) {
		int count = bbsDao.bbsUpdate(dto);
		return count;
	}

}
