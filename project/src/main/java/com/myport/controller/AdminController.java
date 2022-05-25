package com.myport.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myport.domain.AuthorVO;
import com.myport.domain.Criteria;
import com.myport.domain.PageDTO;
import com.myport.service.AuthorService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin")
@AllArgsConstructor
public class AdminController {
	
	private AuthorService authorservice;
	
	// 관리자 메인 페이지 이동
	@GetMapping("/main")
	public void adminMainGET() throws Exception{
		log.info("관리자 페이지 이동");
	}
	
	// 상품 관리 페이지 접속
	@GetMapping("/goodsManage")
	public void goodsManageGET() throws Exception{
		log.info("상품 관리 페이지 접속");
	}
	// 상품 등록 페이지 접속
	@GetMapping("/goodsEnroll")
	public void goodsEnrollGET() throws Exception{
		log.info("상품 등록 페이지 접속");
	}
	// 작가 등록 페이지 접속
	@GetMapping("/authorEnroll")
	public void authorEnrollGET() throws Exception{
		log.info("작가 등록 페이지 접속");
	}
	// 작가 관리 페이지 접속
	@GetMapping("/authorManage")
	public void authorManageGET(Criteria cri, Model model) throws Exception{
		log.info("작가 관리 페이지 접속");
		
		// 작가 목록 출력 데이터
		List<AuthorVO> list = authorservice.authorGetList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list",list);
		}else {
			model.addAttribute("listCheck","empty");
		}
		
		
		// 페이지 이동 인터페이스 데이터
		int total = authorservice.authorGetTotal(cri);
		
		PageDTO pageMaker = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	// 작가 등록
	@PostMapping("/authorEnroll.do")
	public String authorEnrollPOST(AuthorVO author, RedirectAttributes rttr) throws Exception{
		log.info("authorEnroll : " + author);
		
		authorservice.authorEnroll(author);
		
		rttr.addFlashAttribute("enroll_result",author.getAuthorName());
		
		return "redirect:/admin/authorManage";
	}
	
	@GetMapping("/authorDetail")
	public void authorGetInfoGET(int authorId, Criteria cri, Model model) throws Exception{
		log.info("authorDetail..." + authorId);
		// 페이지 정보
		model.addAttribute("cri" + cri);
		
		
		// 선택 작가 정보
		model.addAttribute("authorInfo", authorservice.authorGetDetail(authorId));
		
	}
}
