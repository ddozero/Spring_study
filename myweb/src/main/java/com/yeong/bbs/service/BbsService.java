package com.yeong.bbs.service;

import java.util.*;

import org.springframework.stereotype.Service;

import com.yeong.bbs.model.*;

@Service
public interface BbsService {
	
	public List<BbsDTO> bbsListAll();
	public BbsDTO bbsWrite(BbsDTO dto);
	public BbsDTO bbsContent(int idx);
	public int bbsUpdate(BbsDTO dto);

}
