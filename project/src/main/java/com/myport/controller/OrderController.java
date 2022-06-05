package com.myport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.myport.domain.OrderPageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class OrderController {
	
	@GetMapping("/order/{memberId}")
	public void orderPageGET(@PathVariable("memberId") String memberId, OrderPageDTO opd, Model model) {
		
		log.info("memberId" + memberId);
		log.info("orders" + opd.getOrders());
	}
}
