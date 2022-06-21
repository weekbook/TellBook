package com.myport.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myport.domain.MemberVO;
import com.myport.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/member")
@AllArgsConstructor
public class MemberController {

	private MemberService service;
	private JavaMailSender mailSender;
	
	private BCryptPasswordEncoder pwEncoder;

	@GetMapping("/join")
	public void loginGET() {
		log.info("ȸ������ ������ ����");
	}

	@GetMapping("/login")
	public void joinGET() {
		log.info("�α��� ������ ����");
	}

	@PostMapping("/join")
	public String joinPOST(MemberVO member) throws Exception {
		
		String rawPw = ""; // ���ڵ� �� ��й�ȣ
		String encodePw = ""; // ���ڵ� �� ��й�ȣ
		
		rawPw = member.getMemberPw(); // ��й�ȣ ������ ����
		encodePw = pwEncoder.encode(rawPw); // ��й�ȣ ���ڵ�
		member.setMemberPw(encodePw); // ���ڵ��� ��й�ȣ member��ü�� �ٽ� ����.
		
		service.memberJoin(member);

		return "redirect:/main";
	}

	// ���̵� �ߺ� �˻�
	@PostMapping("/memberIdChk")
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception {
//		log.info("memberIdChk() ����");

		int result = service.idCheck(memberId);

		log.info("����� = " + result);
		if (result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	// �̸��� �ߺ� �˻�
	@PostMapping("/memberMailChk")
	@ResponseBody
	public String mailOverlabPOST(String memberMail) throws Exception{
		
		int result = service.mailCheck(memberMail);

		log.info("����� = " + result);
		if (result != 0) {
			return "fail";
		} else {
			return "success";
		}
		
	}

	/* �̸��� ���� */
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		/* ��(View)�κ��� �Ѿ�� ������ Ȯ�� */
		log.info("�̸��� ������ ���� Ȯ��");
		log.info("������ȣ : " + email);

		// ������ȣ(����) ����
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("������ȣ " + checkNum);

		/* �̸��� ������ */
		String setFrom = "weekbook@naver.com";
		String toMail = email;
		String title = "TellBook ���� �̸��� �Դϴ�.";
		String content = "Ȩ�������� �湮���ּż� �����մϴ�." + "<br><br>" + "���� ��ȣ�� " + checkNum + "�Դϴ�." + "<br>"
				+ "�ش� ������ȣ�� ������ȣ Ȯ�ζ��� �����Ͽ� �ּ���.";

//		try {
//
//			MimeMessage message = mailSender.createMimeMessage();
//			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
//			helper.setFrom(setFrom);
//			helper.setTo(toMail);
//			helper.setSubject(title);
//			helper.setText(content, true);
//			mailSender.send(message);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		String num = Integer.toString(checkNum);
		return num;
	}
	
	// �α���
	@PostMapping("/login.do")
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
//		log.info("login �޼��� ");
//		log.info("���޵� ������ : " + member);
		
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		
		MemberVO lvo = service.memberLogin(member);
		
		if(lvo != null) {
			rawPw = member.getMemberPw(); // ����ڰ� ������ ��й�ȣ
			encodePw = lvo.getMemberPw(); // �����ͺ��̽��� ������ ���ڵ��� ��й�ȣ
			
			if(true == pwEncoder.matches(rawPw, encodePw)) { // ��й�ȣ ��ġ���� �Ǵ�
				
				lvo.setMemberPw(""); // ���ڵ��� ��й�ȣ ���� ����
				session.setAttribute("member", lvo); // session�� ������� ���� ����
				return "redirect:/main";
				
			} else {
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/login";
			}
		} else {
			rttr.addFlashAttribute("result", 0);
			return "redirect:/member/login";
		}
	}
	
	@GetMapping("/logout.do")
	public String logoutMainGET(HttpServletRequest request) throws Exception{
		log.info("logout �޼���");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/main";
	}
	
	@PostMapping("/logout.do")
	@ResponseBody
	public void logoutPOST(HttpServletRequest reqeust) throws Exception{
		log.info("�񵿱� �α׾ƿ� �޼��� ����");
		
		HttpSession session = reqeust.getSession();
		
		session.invalidate();
	}
	
	@GetMapping("/findMember")
	public String findMemberGET(Model model) {
		
		return "/member/findMember";
	}
	
	@PostMapping("/findMemberID")
	@ResponseBody
	public String findIdPOST(MemberVO vo) {
		
		String result = service.getMemberID(vo.getMemberName(), vo.getMemberMail());
		
		return result;
	}
	
	@PostMapping("/findMemberPw")
	@ResponseBody
	public String findPwPOST(MemberVO vo) {
		
		String result = service.accountCheck(vo.getMemberId(), vo.getMemberMail());
		
		return result;
	}
	
	@PostMapping("/resetPassword")
	@ResponseBody
	public String resetPwPOST(MemberVO vo, RedirectAttributes rttr) {
		
		String rawPw = ""; // ���ڵ� �� ��й�ȣ
		String encodePw = ""; // ���ڵ� �� ��й�ȣ
		
		rawPw = vo.getMemberPw(); // ��й�ȣ ������ ����
		encodePw = pwEncoder.encode(rawPw); // ��й�ȣ ���ڵ�
		vo.setMemberPw(encodePw); // ���ڵ��� ��й�ȣ member��ü�� �ٽ� ����.
		
		service.resetPassword(vo.getMemberId(), encodePw);

		rttr.addFlashAttribute("pwChange", 1);
		return "redirect:/main";
		
	}
}
