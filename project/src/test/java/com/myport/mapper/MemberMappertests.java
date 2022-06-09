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

	// ���̵� �ߺ��˻�
//	@Test
//	public void memberIdChk() throws Exception {
//		String id = "admin"; // �����ϴ� ���̵�
//		String id2 = "test123"; // �������� �ʴ� ���̵�
//		mapper.idCheck(id);
//		mapper.idCheck(id2);
//	}
	
	// �α��� ���� �޼��� �׽�Ʈ
//	@Test
//	public void memberLogin() throws Exception{
//		MemberVO member = new MemberVO(); // MemberVO ���� ���� �� �ʱ�ȭ
//		
//		// �ùٸ� ���̵�� ��й�ȣ
//		member.setMemberId("test1");
//		member.setMemberPw("test1");
//		
//		/* �ùٸ� ���� ���̵� ��� �Է°�� */
////        member.setMemberId("test1123");
////        member.setMemberPw("test1321321");
//        
//        mapper.memberLogin(member);
//        log.info("��� �� : " + mapper.memberLogin(member));
//	}
	
}
