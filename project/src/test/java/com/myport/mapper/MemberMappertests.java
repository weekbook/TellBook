package com.myport.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myport.domain.MemberVO;
import com.myport.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMappertests {
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

//	@Test
//	public void memberJoin() throws Exception {
//		MemberVO member = new MemberVO();
//
//		member.setMemberId("test1");
//		member.setMemberPw("test1");
//		member.setMemberName("test1");
//		member.setMemberMail("test1");
//		member.setMemberAddr1("test1");
//		member.setMemberAddr2("test1");
//		member.setMemberAddr3("test1");
//
//		mapper.memberJoin(member);
//	}

	// 아이디 중복검사
//	@Test
//	public void memberIdChk() throws Exception {
//		String id = "admin"; // 존재하는 아이디
//		String id2 = "test123"; // 존재하지 않는 아이디
//		mapper.idCheck(id);
//		mapper.idCheck(id2);
//	}
	
	// 로그인 쿼라 메서드 테스트
//	@Test
//	public void memberLogin() throws Exception{
//		MemberVO member = new MemberVO(); // MemberVO 변수 선언 및 초기화
//		
//		// 올바른 아이디와 비밀번호
//		member.setMemberId("test1");
//		member.setMemberPw("test1");
//		
//		/* 올바른 않은 아이디 비번 입력경우 */
////        member.setMemberId("test1123");
////        member.setMemberPw("test1321321");
//        
//        mapper.memberLogin(member);
//        log.info("결과 값 : " + mapper.memberLogin(member));
//	}
	
}
