package com.myport.service;

import com.myport.domain.MemberVO;

public interface MemberService {
	// ȸ������
	public void memberJoin(MemberVO member) throws Exception;
	
	// ���̵� �ߺ� �˻�
	public int idCheck(String memberId) throws Exception;
	
	// �α���
	public MemberVO memberLogin(MemberVO member) throws Exception;
	
	// �ֹ��� ����
	public MemberVO getMemberInfo(String memberId);
	
	// ���̵� ã��
	public String getMemberID(String memberName, String memberMail);
}
