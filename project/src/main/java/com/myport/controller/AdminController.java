package com.myport.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
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
import oracle.jdbc.proxy.annotation.Post;

@Log4j
@Controller
@RequestMapping("/admin")
@AllArgsConstructor
public class AdminController {

	private AuthorService authorService;

	private AdminService adminService;

	// ������ ���� ������ �̵�
	@GetMapping("/main")
	public void adminMainGET() throws Exception {
		log.info("������ ������ �̵�");
	}

	// ��ǰ ���� ������ ����
	@GetMapping("/goodsManage")
	public void goodsManageGET(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		log.info("��ǰ ���� ������ ����");
		
		List<BookVO> list = adminService.goodsGetList(cri);
		
		if (!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		model.addAttribute("pageMaker", new PageDTO(cri, adminService.goodsGetTotal(cri)));
	}

	// ��ǰ ��� ������ ����
	@GetMapping("/goodsEnroll")
	public void goodsEnrollGET(Model model) throws Exception {
		log.info("��ǰ ��� ������ ����");
		
		// jackson-databind�޼���� static�޼��尡 �ƴϱ� ������ �ν��Ͻ�ȭ�Ͽ� ����ؾ���.
		ObjectMapper objm = new ObjectMapper();
		
		List<CateVO> list = adminService.cateList();
		
		// �ڹ� ��ü�� String Ÿ���� JSON���� �����ͷ� ��ȯ
		String cateList = objm.writeValueAsString(list);
		
		model.addAttribute("cateList", cateList);
		
//		log.info("���� ��" + list);
//		log.info("���� ��" + cateList);
	}
	
	// ��ǰ ��ȸ ������
	@GetMapping({"/goodsDetail","/goodsModify"})
	public void goodsGetInfoGET(int bookId, @ModelAttribute("cri") Criteria cri, Model model) throws JsonProcessingException {
		log.info("goodsGetInfo..." + bookId);
		
		ObjectMapper mapper = new ObjectMapper();
		
		// ī�װ� ����Ʈ ������
		model.addAttribute("cateList", mapper.writeValueAsString(adminService.cateList()));
		
//		model.addAttribute("cri",cri);
		
		model.addAttribute("goodsInfo", adminService.goodsGetDetail(bookId));
	}
	
	// ��ǰ ���
		@PostMapping("/goodsEnroll")
		public String authorModifyPOST(BookVO book, RedirectAttributes rttr) throws Exception {
			log.info("goodsEnrollPOST...." + book);

			adminService.bookEnroll(book);

			rttr.addFlashAttribute("enroll_result", book.getBookName());

			return "redirect:/admin/goodsManage";
		}
	
	// ��ǰ ����
	@PostMapping("/goodsModify")
	public String goodsModifyPOST(BookVO vo, RedirectAttributes rttr) {
		log.info("goodsModifyPOST .." + vo);
		int result = adminService.goodsModify(vo);
		rttr.addFlashAttribute("modify_result", result);
		return "redirect:/admin/goodsManage";
	}
	
	// ��ǰ ����
	@PostMapping("/goodsDelete")
	public String goodsDeletePOST(int bookId, RedirectAttributes rttr) {
		log.info("goodsDelete..." + bookId);
		int result = adminService.goodsDelete(bookId);
		rttr.addFlashAttribute("delete_result", result);
		return "redirect:/admin/goodsManage";
	}

	// �۰� ��� ������ ����
	@GetMapping("/authorEnroll")
	public void authorEnrollGET() throws Exception {
		log.info("�۰� ��� ������ ����");
	}

	// �۰� ���� ������ ����
	@GetMapping("/authorManage")
	public void authorManageGET(Criteria cri, Model model) throws Exception {
		log.info("�۰� ���� ������ ����");

		// �۰� ��� ��� ������
		List<AuthorVO> list = authorService.authorGetList(cri);

		if (!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
		}

		// ������ �̵� �������̽� ������
		int total = authorService.authorGetTotal(cri);

		PageDTO pageMaker = new PageDTO(cri, total);

		model.addAttribute("pageMaker", pageMaker);
	}

	// �۰� ���
	@PostMapping("/authorEnroll.do")
	public String authorEnrollPOST(AuthorVO author, RedirectAttributes rttr) throws Exception {
		log.info("authorEnroll : " + author);

		authorService.authorEnroll(author);

		rttr.addFlashAttribute("enroll_result", author.getAuthorName());

		return "redirect:/admin/authorManage";
	}

	// �۰� �� ������
	@GetMapping({ "/authorDetail", "/authorModify" })
	public void authorGetInfoGET(int authorId, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		log.info("authorDetail..." + authorId);

		// ������ ����
//		model.addAttribute("cri" + cri);

		// ���� �۰� ����
		model.addAttribute("authorInfo", authorService.authorGetDetail(authorId));

	}

	// �۰� ���� ����
	@PostMapping("/authorModify")
	public String authorModifyPOST(AuthorVO author, RedirectAttributes rttr) throws Exception {
		log.info("authorModifyPOSY" + author);
		int result = authorService.authorModify(author);
		rttr.addFlashAttribute("modify_result", result);
		return "redirect:/admin/authorManage";
	}

	// �۰� ����
	@PostMapping("/authorDelete")
	public String authorDeletePOST(int authorId, RedirectAttributes rttr) throws Exception{
		log.info("authorDeletePOST..");
		int result = 0;
		try {
			result = authorService.authorDelete(authorId);
		} catch (Exception e) {
			e.printStackTrace();
			result = 2;
			rttr.addFlashAttribute("delete_result", result);
			
			return "redirect:/admin/authorManage";
		}
		
		rttr.addFlashAttribute("delete_result",result);
		return "redirect:/admin/authorManage";
	}

	// �۰� �˻� �˾�â
	@GetMapping("/authorPop")
	public void authorPopGET(Criteria cri, Model model) throws Exception {
		log.info("authorPopGET......");
		
		// �۰� ��� ��� ������
		List<AuthorVO> list = authorService.authorGetList(cri);

		if (!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, authorService.authorGetTotal(cri)));
	}

}
