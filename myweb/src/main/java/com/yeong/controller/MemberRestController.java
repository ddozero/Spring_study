package com.yeong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yeong.bbs.model.ErrorResponseDTO;
import com.yeong.bbs.model.OkResponseDTO;
import com.yeong.member.model.MemberDTO;
import com.yeong.member.service.MemberService;

@RestController
@RequestMapping("/api")
public class MemberRestController {

	@Autowired
	private MemberService memberService;

	// 1.회원가입
	@PostMapping("/memberJoin")
	public ResponseEntity<?> memberJoin(@RequestBody MemberDTO dto) {
		try {
			int count = memberService.memberJoin(dto);
			if (dto != null) {
				return ResponseEntity.status(HttpStatus.CREATED)
						.body(new OkResponseDTO<MemberDTO>(201, "회원 가입 성공", dto));
			} else {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new ErrorResponseDTO(400, "회원 가입 실패"));

			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body(new ErrorResponseDTO(500, "오류 : " + e.getMessage()));
		}
	}

}
