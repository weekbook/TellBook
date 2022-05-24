package com.myport.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myport.domain.MemberVO;
import com.myport.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService{
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	// ȸ������
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		mapper.memberJoin(member);
	}
	
	// ���̵� �ߺ� �˻�
	@Override
	public int idCheck(String memberId) throws Exception {
		
		return mapper.idCheck(memberId);
	}

	// �α���
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		return mapper.memberLogin(member);
	}


}
