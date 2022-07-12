package com.myport.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myport.domain.Criteria;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderCancleDTO;
import com.myport.domain.OrderDTO;
import com.myport.domain.PageDTO;
import com.myport.domain.SelectDTO;
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

	private BCryptPasswordEncoder pwEncoder;

	@GetMapping("/myPage")
	public void mainPageGET(Model model) {
		log.info("메인페이지");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());

		// 랜덤 리스트 출력
		List<SelectDTO> random_list = bookService.bestSelect();
		Collections.shuffle(random_list);
		model.addAttribute("rl", random_list);
	}

	@GetMapping("/ordersHistoryList")
	public String OrderHistoryGET(Criteria cri, Model model, HttpServletRequest request) {
		log.info("주문리스트");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());

		// 랜덤 리스트 출력
		List<SelectDTO> random_list = bookService.bestSelect();
		Collections.shuffle(random_list);
		model.addAttribute("rl", random_list);

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		log.info("멤버세션" + vo);

		if (vo != null) {
			String memberId = vo.getMemberId();
			cri.setMemberId(memberId);

			List<OrderDTO> list = mypageService.getMyOrderList(cri);

			if (!list.isEmpty()) {
				model.addAttribute("list", list);
				model.addAttribute("pageMaker", new PageDTO(cri, mypageService.getMyOrderTotal(cri)));
			}
		} else {
			log.info("세션이 없습니다." + vo);
			model.addAttribute("listCheck", "empty");
		}

		return "/mypage/ordersHistoryList";
	}

	// 주문 상세 페이지
	@GetMapping({ "/orderInfo" })
	public String orderInfoGET(String orderId, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		log.info("orderInfoGET..." + orderId);

		// 선택 작가 정보
		model.addAttribute("orderInfo", mypageService.gerOrderInfo(orderId));

		// 랜덤 리스트 출력
		List<SelectDTO> random_list = bookService.bestSelect();
		Collections.shuffle(random_list);
		model.addAttribute("rl", random_list);

		return "/mypage/orderInfo";

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

		return "redirect:/mypage/ordersHistoryList?keyword=" + dto.getKeyword() + "&amount=" + dto.getAmount()
				+ "&pageNum=" + dto.getPageNum();
	}

	@GetMapping("/memberDetail")
	public String memberDetailGet(String memberId, Model model) {

		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());

		model.addAttribute("memberInfo", mypageService.memberPersonalDetail(memberId));

		// 랜덤 리스트 출력
		List<SelectDTO> random_list = bookService.bestSelect();
		Collections.shuffle(random_list);
		model.addAttribute("rl", random_list);

		return "/mypage/memberDetail";
	}

	@GetMapping("/passwordUpdate/{memberId}")
	public String passwordModifyGET(@PathVariable("memberId") String memberId, Model model) {

		MemberVO member = mypageService.memberPersonalDetail(memberId);
		model.addAttribute("memberInfo", member);
		model.addAttribute("memberId", memberId);

		// 랜덤 리스트 출력
		List<SelectDTO> random_list = bookService.bestSelect();
		Collections.shuffle(random_list);
		model.addAttribute("rl", random_list);

		return "/mypage/passwordUpdate";
	}

	@PostMapping("/passwordUpdate")
	public String passwordModifyPOST(HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		// 해야하는거 -> memberID 컨트롤러로 보내서 그걸로 db의 암호화된 비번 받아오기 -> 기존 비번이랑 암호화된비번 match해서
		// 맞는지?
		// 맞다면...뭐알아서 하고 새비번도 파라미터로 받아서 암호화한 다음에 db에 저장시키기
		String rawPw = request.getParameter("memberPw");
		String newPw = request.getParameter("newpassword");
		String memberId = request.getParameter("memberId");
		String encodePw = "";
		String newEncodePw = "";

		MemberVO lvo = mypageService.memberPersonalDetail(memberId);

		log.info("rawPw" + rawPw);
		log.info("newPw" + newPw);
		log.info("memberId" + memberId);
		log.info(lvo);

		if (lvo != null) {
			encodePw = lvo.getMemberPw();

			if (pwEncoder.matches(rawPw, encodePw) == true) {
				newEncodePw = pwEncoder.encode(newPw);
				lvo.setMemberPw(newEncodePw);

				mypageService.passwordModify(lvo);

				// 비빌번호 변경 후 로그아웃 및 메인 창 이동
				// 팝업창페이지에선 session정보가 없어서 기능이 작동안하는듯하다
				HttpSession session = request.getSession();

				session.invalidate();

				return "redirect:/main";

			} else {
				rttr.addFlashAttribute("result", 0);
				return "redirect:/mypage/passwordUpdate/" + memberId;
			}
		} else {
			rttr.addFlashAttribute("result", 0);
			return "redirect:/mypage/passwordUpdate/" + memberId;
		}

	}

	@GetMapping("/memberDelete")
	public String memberDeleteGET(Model model) {

		// 랜덤 리스트 출력
		List<SelectDTO> random_list = bookService.bestSelect();
		Collections.shuffle(random_list);
		model.addAttribute("rl", random_list);

		return "/mypage/memberDelete";
	}

	@PostMapping("/memberDelete")
	public String memberDeletePOST(HttpServletRequest request, RedirectAttributes rttr) {
		String memberId = request.getParameter("memberId");
		String rawPw = request.getParameter("memberPw");
		String encodePw = "";

		log.info(memberId);
		log.info(rawPw);

		MemberVO lvo = mypageService.memberPersonalDetail(memberId);

		if (lvo != null) {
			encodePw = lvo.getMemberPw();

			if (pwEncoder.matches(rawPw, encodePw) == true) {

				mypageService.memeberDelete(memberId);

				// 비빌번호 변경 후 로그아웃 및 메인 창 이동
				// 팝업창페이지에선 session정보가 없어서 기능이 작동안하는듯하다
				HttpSession session = request.getSession();

				session.invalidate();

				rttr.addFlashAttribute("memberDeleteResult", 1);
				return "redirect:/main";

			} else {
				rttr.addFlashAttribute("memberDeleteResult", 0);
				return "redirect:/mypage/memberDelete";
			}
		} else {
			rttr.addFlashAttribute("memberDeleteResult", 0);
			return "redirect:/mypage/memberDelete";
		}
	}
}
