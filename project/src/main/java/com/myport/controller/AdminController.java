package com.myport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	// ������ ���� ������ �̵�
	@GetMapping("/main")
	public void adminMainGET() throws Exception{
		log.info("������ ������ �̵�");
	}
}
