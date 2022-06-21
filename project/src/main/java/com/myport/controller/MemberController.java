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
		log.info("회원가입 페이지 진입");
	}

	@GetMapping("/login")
	public void joinGET() {
		log.info("로그인 페이지 진입");
	}

	@PostMapping("/join")
	public String joinPOST(MemberVO member) throws Exception {
		
		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호
		
		rawPw = member.getMemberPw(); // 비밀번호 데이터 얻음
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
		member.setMemberPw(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장.
		
		service.memberJoin(member);

		return "redirect:/main";
	}

	// 아이디 중복 검사
	@PostMapping("/memberIdChk")
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception {
//		log.info("memberIdChk() 실행");

		int result = service.idCheck(memberId);

		log.info("결과값 = " + result);
		if (result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	// 이메일 중복 검사
	@PostMapping("/memberMailChk")
	@ResponseBody
	public String mailOverlabPOST(String memberMail) throws Exception{
		
		int result = service.mailCheck(memberMail);

		log.info("결과값 = " + result);
		if (result != 0) {
			return "fail";
		} else {
			return "success";
		}
		
	}

	/* 이메일 인증 */
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		/* 뷰(View)로부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송 확인");
		log.info("인증번호 : " + email);

		// 인증번호(난수) 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 " + checkNum);

		/* 이메일 보내기 */
		String setFrom = "weekbook@naver.com";
		String toMail = email;
		String title = "TellBook 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

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
	
	// 로그인
	@PostMapping("/login.do")
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
//		log.info("login 메서드 ");
//		log.info("전달된 데이터 : " + member);
		
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		
		MemberVO lvo = service.memberLogin(member);
		
		if(lvo != null) {
			rawPw = member.getMemberPw(); // 사용자가 제출한 비밀번호
			encodePw = lvo.getMemberPw(); // 데이터베이스에 저장한 인코딩된 비밀번호
			
			if(true == pwEncoder.matches(rawPw, encodePw)) { // 비밀번호 일치여부 판단
				
				lvo.setMemberPw(""); // 인코딩된 비밀번호 정보 지움
				session.setAttribute("member", lvo); // session에 사용자의 정보 저장
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
		log.info("logout 메서드");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/main";
	}
	
	@PostMapping("/logout.do")
	@ResponseBody
	public void logoutPOST(HttpServletRequest reqeust) throws Exception{
		log.info("비동기 로그아웃 메서드 진입");
		
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
		
		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호
		
		rawPw = vo.getMemberPw(); // 비밀번호 데이터 얻음
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
		vo.setMemberPw(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장.
		
		service.resetPassword(vo.getMemberId(), encodePw);

		rttr.addFlashAttribute("pwChange", 1);
		return "redirect:/main";
		
	}
}
