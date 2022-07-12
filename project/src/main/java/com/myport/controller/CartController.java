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
import org.springframework.web.bind.annotation.ResponseBody;

import com.myport.domain.CartDTO;
import com.myport.domain.MemberVO;
import com.myport.domain.SelectDTO;
import com.myport.service.BookService;
import com.myport.service.CartService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class CartController {

	private CartService cartService;
	
	private BookService bookService;

	// ��ǰ ��ٱ��Ͽ� �߰�
	@PostMapping("/cart/add")
	@ResponseBody
	public String addCartPOST(CartDTO cart, HttpServletRequest request) {
		// �α��� üũ
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		if (mvo == null) {
			return "5";
		}

		// īƮ ���
		int result = cartService.addCart(cart);
		return result + "";
	}

	// ��ٱ��� ������
	@GetMapping("/cart/{memberId}")
	public String cartPageGET(@PathVariable("memberId") String memberId, Model model) {

		model.addAttribute("cartInfo", cartService.getCartList(memberId));

		// ���� ����Ʈ ���
		List<SelectDTO> random_list = bookService.bestSelect();
		Collections.shuffle(random_list);
		model.addAttribute("rl", random_list);

		return "/cart";
	}

	// ��ٱ��� ���� ����
	@PostMapping("/cart/update")
	public String updateCartPOST(CartDTO cart) {
		cartService.modifyCount(cart);
		return "redirect:/cart/" + cart.getMemberId();
	}

	// ��ٱ��� ��ǰ ����
	@PostMapping("/cart/delete")
	public String deleteCartPOST(CartDTO cart) {
		cartService.deleteCart(cart.getCartId());

		return "redirect:/cart/" + cart.getMemberId();
	}

}
