package com.yeong.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class MemberController {

	@RequestMapping("/memberJoin")
	public String memberJoinForm() {
		return "member/memberJoin";
	}
}
