package com.myport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myport.service.BookService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/support/*")
public class SupportController {
	
	private BookService bookService;
	
	@GetMapping("/support")
	public void supportGET(Model model) {
		log.info("고객센터");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
	}
	
	@GetMapping("/supportLi1")
	public void supportLi1GET() {
		log.info("반품/환불/교환");
	}
	
	@GetMapping("/supportLi2")
	public void supportLi2GET() {
		log.info("주문/결제");
	}
	
	@GetMapping("/supportLi3")
	public void supportLi3GET() {
		log.info("회원");
	}
	
	@GetMapping("/supportLi4")
	public void supportLi4GET() {
		log.info("도서/상품정보/교과서");
	}
	
	@GetMapping("/supportLi5")
	public void supportLi5GET() {
		log.info("배송/수령일안내");
	}

	@GetMapping("/inquirie")
	public void supportLi6GET() {
		log.info("서비스/기타");
	}
}
