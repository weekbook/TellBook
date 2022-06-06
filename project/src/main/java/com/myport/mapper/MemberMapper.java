package com.myport.mapper;

import com.myport.domain.MemberVO;	

public interface MemberMapper {
	
	// ȸ������
	public void memberJoin(MemberVO member);
	
	// ���̵� �ߺ� �˻�
	public int idCheck(String memberId);
	
	// �α���
	public MemberVO memberLogin(MemberVO member);
	
	// �ֹ��� �ּ� ����
	public MemberVO getMemberInfo(String memberId);
}
