package com.yeong.bbs.model;

import java.util.*;

public interface BbsDAO {
	
	public List<BbsDTO> bbsListAll();
	public int bbsWrite(BbsDTO dto);
	public BbsDTO bbsContent(int idx);
	

	
}
