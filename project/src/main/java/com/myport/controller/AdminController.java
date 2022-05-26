package com.myport.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.myport.domain.AuthorVO;
import com.myport.domain.BookVO;
import com.myport.domain.CateVO;
import com.myport.domain.Criteria;
import com.myport.domain.PageDTO;
import com.myport.service.AdminService;
import com.myport.service.AuthorService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin")
@AllArgsConstructor
public class AdminController {

	private AuthorService authorService;

	private AdminService adminService;

	// 관리자 메인 페이지 이동
	@GetMapping("/main")
	public void adminMainGET() throws Exception {
		log.info("관리자 페이지 이동");
	}

	// 상품 관리 페이지 접속
	@GetMapping("/goodsManage")
	public void goodsManageGET() throws Exception {
		log.info("상품 관리 페이지 접속");
	}

	// 상품 등록 페이지 접속
	@GetMapping("/goodsEnroll")
	public void goodsEnrollGET(Model model) throws Exception {
		log.info("상품 등록 페이지 접속");
		
		// jackson-databind메서드는 static메서드가 아니기 때문에 인스턴스화하여 사용해야함.
		ObjectMapper objm = new ObjectMapper();
		
		List<CateVO> list = adminService.cateList();
		
		// 자바 객체를 String 타입의 JSON형식 데이터로 변환
		String cateList = objm.writeValueAsString(list);
		
		model.addAttribute("cateList", cateList);
		
//		log.info("변경 전" + list);
//		log.info("변경 후" + cateList);
	}

	// 작가 등록 페이지 접속
	@GetMapping("/authorEnroll")
	public void authorEnrollGET() throws Exception {
		log.info("작가 등록 페이지 접속");
	}

	// 작가 관리 페이지 접속
	@GetMapping("/authorManage")
	public void authorManageGET(Criteria cri, Model model) throws Exception {
		log.info("작가 관리 페이지 접속");

		// 작가 목록 출력 데이터
		List<AuthorVO> list = authorService.authorGetList(cri);

		if (!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
		}

		// 페이지 이동 인터페이스 데이터
		int total = authorService.authorGetTotal(cri);

		PageDTO pageMaker = new PageDTO(cri, total);

		model.addAttribute("pageMaker", pageMaker);
	}

	// 작가 등록
	@PostMapping("/authorEnroll.do")
	public String authorEnrollPOST(AuthorVO author, RedirectAttributes rttr) throws Exception {
		log.info("authorEnroll : " + author);

		authorService.authorEnroll(author);

		rttr.addFlashAttribute("enroll_result", author.getAuthorName());

		return "redirect:/admin/authorManage";
	}

	// 작가 상세 페이지
	@GetMapping({ "/authorDetail", "/authorModify" })
	public void authorGetInfoGET(int authorId, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		log.info("authorDetail..." + authorId);

		// 페이지 정보
//		model.addAttribute("cri" + cri);

		// 선택 작가 정보
		model.addAttribute("authorInfo", authorService.authorGetDetail(authorId));

	}

	// 작가 정부 수정
	@PostMapping("/authorModify")
	public String authorModifyPOST(AuthorVO author, RedirectAttributes rttr) throws Exception {
		log.info("authorModifyPOSY" + author);
		int result = authorService.authorModify(author);
		rttr.addFlashAttribute("modify_result", result);
		return "redirect:/admin/authorManage";
	}

	// 상품 등록
	@PostMapping("/goodsEnroll")
	public String authorModifyPOST(BookVO book, RedirectAttributes rttr) throws Exception {
		log.info("goodsEnrollPOST...." + book);

		adminService.bookEnroll(book);

		rttr.addFlashAttribute("enroll_result", book.getBookName());

		return "redirect:/admin/goodsManage";
	}

	// 작가 검색 팝업창
	@GetMapping("/authorPop")
	public void authorPopGET(Criteria cri, Model model) throws Exception {
		log.info("authorPopGET......");
		
		// 작가 목록 출력 데이터
		List<AuthorVO> list = authorService.authorGetList(cri);

		if (!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, authorService.authorGetTotal(cri)));
	}

}
