package com.myport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myport.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class BookController {
	@RequestMapping("/main")
	public void mainPageGET() {
		log.info("메인페이지");
	}
}
