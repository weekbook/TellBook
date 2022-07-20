package com.myport.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myport.domain.SelectDTO;
import com.myport.service.BookService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MainController {

	private BookService bookService;

	@RequestMapping("/main")
	public void mainPageGET(Model model) {
		log.info("메인페이지");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());

		model.addAttribute("ls", bookService.likeSelect());
		model.addAttribute("ds", bookService.dateSelect());
		model.addAttribute("bs", bookService.bestSelect());

		// 랜덤 리스트 출력
		List<SelectDTO> random_list = bookService.bestSelect();
		Collections.shuffle(random_list);
		model.addAttribute("rl", random_list);
	}

	@GetMapping("/introduce")
	public void introduceGET(Model model) {
		log.info("introduce page");
	}

	@GetMapping("/terms")
	public void termsGET(Model model) {
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
		
		log.info("terms page");
		// 랜덤 리스트 출력
		List<SelectDTO> random_list = bookService.bestSelect();
		Collections.shuffle(random_list);
		model.addAttribute("rl", random_list);
	}
}
