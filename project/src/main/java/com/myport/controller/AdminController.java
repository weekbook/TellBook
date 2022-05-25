package com.myport.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myport.domain.AuthorVO;
import com.myport.domain.Criteria;
import com.myport.domain.PageDTO;
import com.myport.service.AuthorService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin")
@AllArgsConstructor
public class AdminController {
	
	private AuthorService authorservice;
	
	// ������ ���� ������ �̵�
	@GetMapping("/main")
	public void adminMainGET() throws Exception{
		log.info("������ ������ �̵�");
	}
	
	// ��ǰ ���� ������ ����
	@GetMapping("/goodsManage")
	public void goodsManageGET() throws Exception{
		log.info("��ǰ ���� ������ ����");
	}
	// ��ǰ ��� ������ ����
	@GetMapping("/goodsEnroll")
	public void goodsEnrollGET() throws Exception{
		log.info("��ǰ ��� ������ ����");
	}
	// �۰� ��� ������ ����
	@GetMapping("/authorEnroll")
	public void authorEnrollGET() throws Exception{
		log.info("�۰� ��� ������ ����");
	}
	// �۰� ���� ������ ����
	@GetMapping("/authorManage")
	public void authorManageGET(Criteria cri, Model model) throws Exception{
		log.info("�۰� ���� ������ ����");
		
		// �۰� ��� ��� ������
		List<AuthorVO> list = authorservice.authorGetList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list",list);
		}else {
			model.addAttribute("listCheck","empty");
		}
		
		
		// ������ �̵� �������̽� ������
		int total = authorservice.authorGetTotal(cri);
		
		PageDTO pageMaker = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	// �۰� ���
	@PostMapping("/authorEnroll.do")
	public String authorEnrollPOST(AuthorVO author, RedirectAttributes rttr) throws Exception{
		log.info("authorEnroll : " + author);
		
		authorservice.authorEnroll(author);
		
		rttr.addFlashAttribute("enroll_result",author.getAuthorName());
		
		return "redirect:/admin/authorManage";
	}
	
	@GetMapping("/authorDetail")
	public void authorGetInfoGET(int authorId, Criteria cri, Model model) throws Exception{
		log.info("authorDetail..." + authorId);
		// ������ ����
		model.addAttribute("cri" + cri);
		
		
		// ���� �۰� ����
		model.addAttribute("authorInfo", authorservice.authorGetDetail(authorId));
		
	}
}
