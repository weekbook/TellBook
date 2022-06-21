package com.myport.service;

import com.myport.domain.MemberVO;

public interface MemberService {
	// 회원가입
	public void memberJoin(MemberVO member) throws Exception;
	
	// 아이디 중복 검사
	public int idCheck(String memberId) throws Exception;
	
	// 이메일 중복 검사
	public int mailCheck(String memberMail) throws Exception;
	
	// 로그인
	public MemberVO memberLogin(MemberVO member) throws Exception;
	
	// 주문자 정보
	public MemberVO getMemberInfo(String memberId);
	
	// 아이디 찾기
	public String getMemberID(String memberName, String memberMail);
	
	// 계정 확인
	public String accountCheck(String memberId, String memberMail);
	
	// 비밀번호 재설정
	public int resetPassword(String memberId, String memberPw);
}
