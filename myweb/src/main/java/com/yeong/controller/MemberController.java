package com.yeong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("/memberJoin")
	public String memberJoinForm() {
		return "member/memberJoin";
	}
}
