package com.myport.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myport.domain.MemberVO;
import com.myport.service.MypageService;
import com.myport.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController // 뷰를 만들지 않고 http body에 바로 데이터를 담아 반환할 것이기 때문에 RestController
@RequestMapping("/mypage")
@AllArgsConstructor
public class MyPageAjaxController {
	
	private MypageService mypageService;
	
	@PostMapping("emailModify")
	public void emailModifyPOST(MemberVO vo) {
		mypageService.emailModify(vo);
		
	}
	
	@PostMapping("addressModify")
	public void addressModfiyPOST(MemberVO vo) {
		mypageService.addressModify(vo);
	}
}
