package com.myport.mapper;

import com.myport.domain.MemberVO;	

public interface MemberMapper {
	public void memberJoin(MemberVO member);
	
	public int idCheck(String memberId);
	
	public MemberVO memberLogin(MemberVO member);
}
