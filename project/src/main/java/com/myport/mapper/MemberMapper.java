package com.myport.mapper;

import org.apache.ibatis.annotations.Param;

import com.myport.domain.MemberVO;	

public interface MemberMapper {
	
	// ȸ������
	public void memberJoin(MemberVO member);
	
	// ���̵� �ߺ� �˻�
	public int idCheck(String memberId);
	
	// �̸��� �ߺ� �˻�
	public int mailCheck(String memberMail);
	
	// �α���
	public MemberVO memberLogin(MemberVO member);
	
	// �ֹ��� �ּ� ����
	public MemberVO getMemberInfo(String memberId);
	
	// ���̵� ����
	public String getMemberId(@Param("memberName") String memberName, @Param("memberMail") String memberMail);
	
	// ���� Ȯ��
	public String accountCheck(@Param("memberId") String memberId, @Param("memberMail") String memberMail);
	
	// ��й�ȣ �缳��
	public int resetPassword(@Param("memberId") String memberId, @Param("memberPw") String memberPw);
}
