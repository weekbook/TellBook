package com.myport.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.myport.domain.MemberVO;
import com.myport.domain.OrderDTO;
import com.myport.domain.OrderPageDTO;
import com.myport.domain.SelectDTO;
import com.myport.service.BookService;
import com.myport.service.MemberService;
import com.myport.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class OrderController {

	private OrderService orderService;

	private MemberService memberService;
	
	private BookService bookService;

	@GetMapping("/order/{memberId}")
	public String orderPageGET(@PathVariable("memberId") String memberId, OrderPageDTO opd, Model model) {

		model.addAttribute("orderList", orderService.getGoodsInfo(opd.getOrders()));

		model.addAttribute("memberInfo", memberService.getMemberInfo(memberId));

		// 랜덤 리스트 출력
		List<SelectDTO> random_list = bookService.bestSelect();
		Collections.shuffle(random_list);
		model.addAttribute("rl", random_list);

		return "/order";
	}

	@PostMapping("/order")
	public String orderPagePost(OrderDTO od, HttpServletRequest request) {
		log.info(od);

		orderService.order(od);

		MemberVO member = new MemberVO();
		member.setMemberId(od.getMemberId());

		HttpSession session = request.getSession();

		try {
			MemberVO memberLogin = memberService.memberLogin(member);
			memberLogin.setMemberPw("");
			session.setAttribute("member", memberLogin);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/main";
	}
}
