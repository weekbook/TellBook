package com.myport.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myport.domain.Criteria;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderDTO;
import com.myport.domain.PageDTO;
import com.myport.domain.QnaVO;
import com.myport.mapper.QnaMapper;
import com.myport.service.BookService;
import com.myport.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/support/*")
public class SupportController {
	
	private BookService bookService;
	
	private QnaService qnaService;
	
	@GetMapping("/support")
	public void supportGET(Model model) {
		log.info("고객센터");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
	}
	
	@GetMapping("/supportLi1")
	public void supportLi1GET(Model model) {
		log.info("반품/환불/교환");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
	}
	
	@GetMapping("/supportLi2")
	public void supportLi2GET(Model model) {
		log.info("주문/결제");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
	}
	
	@GetMapping("/supportLi3")
	public void supportLi3GET(Model model) {
		log.info("회원");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
	}
	
	@GetMapping("/supportLi4")
	public void supportLi4GET(Model model) {
		log.info("도서/상품정보/교과서");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
	}
	
	@GetMapping("/supportLi5")
	public void supportLi5GET(Model model) {
		log.info("배송/수령일안내");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
	}

	@GetMapping("/inquirie")
	public void inquirieGET(Model model, Criteria cri, HttpServletRequest request) {
		log.info("1:1상담접수/내역확인");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		if(vo != null) {
			String memberId = vo.getMemberId();
			log.info("세션정보" + vo);
			cri.setMemberId(memberId);
		}
		
		List<QnaVO> list = qnaService.getList(cri);
		log.info("sibal" + list);

		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageDTO(cri, qnaService.getQnaTotal(cri)));
		} else {
			model.addAttribute("listCheck", "empty");
		}

	}
}
