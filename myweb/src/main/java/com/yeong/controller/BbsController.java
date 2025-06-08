package com.yeong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BbsController {
	
	@RequestMapping("/bbsList")
	public String bbsListForm() {
		return "bbs/bbsList";
	}
	
	@RequestMapping("/bbsWrite")
	public String bbsWriteForm() {
		return "bbs/bbsWrite";
	}
	
	@RequestMapping("/bbsContent")
	public String BbsContent() {
		return "bbs/bbsContent";
	}


}
