package com.myport.mapper;

import org.apache.ibatis.annotations.Param;

import com.myport.domain.MemberVO;	

public interface MemberMapper {
	
	// 회원가입
	public void memberJoin(MemberVO member);
	
	// 아이디 중복 검사
	public int idCheck(String memberId);
	
	// 이메일 중복 검사
	public int mailCheck(String memberMail);
	
	// 로그인
	public MemberVO memberLogin(MemberVO member);
	
	// 주문자 주소 정보
	public MemberVO getMemberInfo(String memberId);
	
	// 아이디 정보
	public String getMemberId(@Param("memberName") String memberName, @Param("memberMail") String memberMail);
	
	// 계정 확인
	public String accountCheck(@Param("memberId") String memberId, @Param("memberMail") String memberMail);
	
	// 비밀번호 재설정
	public int resetPassword(@Param("memberId") String memberId, @Param("memberPw") String memberPw);
}
