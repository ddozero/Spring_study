package com.yeong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;
import com.yeong.bbs.service.*;
import com.yeong.bbs.model.*;

@RestController
@RequestMapping("/api")
public class BbsRestController {

	@Autowired
	private BbsService bbsService;

	@GetMapping(value = "/bbsList", produces = "application/json; charset=UTF-8")
	public ResponseEntity<?> bbsList() {
		try {

			List<BbsDTO> lists = bbsService.bbsListAll();
			System.out.println("bbsListAll : " + (lists == null ? "null" : lists.size()));

			if (lists != null) {
				if (lists.isEmpty()) {
					return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ErrorResponseDTO(404, "등록 게시물 없음"));
				} else {
					return ResponseEntity.ok(new OkResponseDTO<List<BbsDTO>>(200, "게시물 조회 성공", lists));
				}
			} else {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new ErrorResponseDTO(500, "서버 오류"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body(new ErrorResponseDTO(500, "오류 안내 : " + e.getMessage()));
		}
	}
	
	//게시물 작성
	@PostMapping(value = "/bbsWrite", produces = "application/json; charset=UTF-8")
	public ResponseEntity<?> bbsWrite(@RequestBody BbsDTO dto){
		try {
			dto = bbsService.bbsWrite(dto);
			if(dto !=null) {
				return ResponseEntity.status(HttpStatus.CREATED).body(new OkResponseDTO<BbsDTO>(201,"게시물 등록 성공",dto));
			}else {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new ErrorResponseDTO(400,"게시물 등록 실패"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new ErrorResponseDTO(500,"오류 : "+e.getMessage()));
		}
	}
	
	//게시물 보기
	@GetMapping(value="/bbsContent", produces = "application/json; charset=UTF-8")
	public ResponseEntity<?> bbsContent(
			@RequestParam(value = "idx", defaultValue = "0")int idx){
		
		try {
			BbsDTO dto = bbsService.bbsContent(idx);
			
			if(dto==null) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ErrorResponseDTO(404, "삭제된 게시물입니다."));
			}else {
				return ResponseEntity.ok(new OkResponseDTO<BbsDTO>(200,"게시물 조회 성공",dto));

			}			
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new ErrorResponseDTO(500,"오류 : " + e.getMessage()));
		}
		
		
	}
	
	
	
	
	
	

}
