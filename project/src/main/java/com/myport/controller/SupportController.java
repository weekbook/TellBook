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
		log.info("������");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
	}
	
	@GetMapping("/supportLi1")
	public void supportLi1GET() {
		log.info("��ǰ/ȯ��/��ȯ");
	}
	
	@GetMapping("/supportLi2")
	public void supportLi2GET() {
		log.info("�ֹ�/����");
	}
	
	@GetMapping("/supportLi3")
	public void supportLi3GET() {
		log.info("ȸ��");
	}
	
	@GetMapping("/supportLi4")
	public void supportLi4GET() {
		log.info("����/��ǰ����/������");
	}
	
	@GetMapping("/supportLi5")
	public void supportLi5GET() {
		log.info("���/�����Ͼȳ�");
	}

	@GetMapping("/inquirie")
	public void supportLi6GET() {
		log.info("����/��Ÿ");
	}
}
