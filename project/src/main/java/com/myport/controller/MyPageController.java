package com.myport.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myport.domain.Criteria;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderCancleDTO;
import com.myport.domain.OrderDTO;
import com.myport.domain.PageDTO;
import com.myport.service.BookService;
import com.myport.service.MemberService;
import com.myport.service.MypageService;
import com.myport.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/mypage")
public class MyPageController {
	
	private BookService bookService;
	
	private MypageService mypageService;
	
	private OrderService orderService;
	
	private MemberService memberService;
	
	@GetMapping("/myPage")
	public void mainPageGET(Model model) {
		log.info("메인페이지");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
		model.addAttribute("ls", bookService.likeSelect());
	}

	@GetMapping("/ordersHistoryList")
	public String OrderHistoryGET(Criteria cri, Model model) {
		log.info("주문리스트");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());

		List<OrderDTO> list = mypageService.getMyOrderList(cri);

		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageDTO(cri, mypageService.getMyOrderTotal(cri)));
		} else {
			model.addAttribute("listCheck", "empty");
		}

		return "/mypage/ordersHistoryList";
	}

	// 주문삭제
	@PostMapping("/orderCancle")
	public String orderCanclePOST(OrderDTO od, OrderCancleDTO dto, HttpServletRequest request) {

		orderService.orderCancle(dto);

		// 삭제 후 충전금액, 포인트 갱신
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

		return "redirect:/mypage/OrdersHistoryList?keyword=" + dto.getKeyword() + "&amount=" + dto.getAmount() + "&pageNum="
				+ dto.getPageNum();
	}
	
	@GetMapping("/memberDetail")
	public String memberDetailGet(String memberId, Model model) {
		
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());

		model.addAttribute("memberInfo",mypageService.memberPersonalDetail(memberId)); 
		
		return "/mypage/memberDetail";
	}
	
	@GetMapping("/passwordUpdate/{memberId}")
	public String passwordModifyGET(@PathVariable("memberId") String memberId, Model model) {
		
		MemberVO member = mypageService.memberPersonalDetail(memberId);
		model.addAttribute("memberInfo", member);
		model.addAttribute("memberId", memberId);
		
		return "/mypage/passwordUpdate";
	}
}
