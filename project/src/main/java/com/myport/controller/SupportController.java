package com.myport.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myport.domain.CateVO;
import com.myport.domain.ComuBoVO;
import com.myport.domain.Criteria;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderDTO;
import com.myport.domain.PageDTO;
import com.myport.domain.QnaVO;
import com.myport.mapper.QnaMapper;
import com.myport.service.BookService;
import com.myport.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/support/*")
public class SupportController {
	
	private BookService bookService;
	
	private QnaService qnaService;
	
	@GetMapping("/support")
	public void supportGET(Model model) {
		log.info("������");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
	}
	
	@GetMapping("/supportLi1")
	public void supportLi1GET(Model model) {
		log.info("��ǰ/ȯ��/��ȯ");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
	}
	
	@GetMapping("/supportLi2")
	public void supportLi2GET(Model model) {
		log.info("�ֹ�/����");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
	}
	
	@GetMapping("/supportLi3")
	public void supportLi3GET(Model model) {
		log.info("ȸ��");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
	}
	
	@GetMapping("/supportLi4")
	public void supportLi4GET(Model model) {
		log.info("����/��ǰ����/������");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
	}
	
	@GetMapping("/supportLi5")
	public void supportLi5GET(Model model) {
		log.info("���/�����Ͼȳ�");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
	}

	@GetMapping("/inquirie")
	public void inquirieGET(Model model, Criteria cri, HttpServletRequest request) {
		log.info("1:1�������/����Ȯ��");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		log.info("�������" + vo);
		
		List<QnaVO> list = null;
		
		if(vo != null) {
			String memberId = vo.getMemberId();
			cri.setMemberId(memberId);
			
			if (vo.getAdminCk() == 1) {
				// ���� ������ ��� ���ǳ����� �� �� �ְ�.
				list = qnaService.getListAll(cri);
			}else {
				// �ƴ϶�� �ش� ���� memberId�� �Խù��� �� �� �ְ�
				list = qnaService.getList(cri);
			}
			
			if (!list.isEmpty()) {
				model.addAttribute("list", list);
				model.addAttribute("pageMaker", new PageDTO(cri, qnaService.getQnaTotal(cri)));
			}
		} else {
			log.info("������ �����ϴ�." + vo);
			model.addAttribute("listCheck", "empty");
		}

	}
	
	@GetMapping("/register")
	public void registerGET() {

	}
	
	@PostMapping("/register")
	public String register(QnaVO board, RedirectAttributes rttr) {
		log.info("���" + board);
		qnaService.insert(board);

		rttr.addFlashAttribute("result", board.getBId());
		return "redirect:/support/inquirie";
	}
	
	@GetMapping("/inquirieDetail")
	public void inquirieDetailGET(@RequestParam("bId") Long bId, Model model, @ModelAttribute("cri") Criteria cri) throws Exception {
		log.info("detailGet...");
		model.addAttribute("board", qnaService.readQna(bId));
	}
	
	@PostMapping("/answer")
	public String answer(QnaVO board, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		log.info("modify:" + board);
		if (qnaService.answerQna(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/support/inquirie" + cri.getListLink();
	}
}
