package com.myport.mapper;

import java.util.List;

import com.myport.domain.Criteria;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderDTO;

public interface MyPageMapper {

	// 주문 상품 리스트
	public List<OrderDTO> getMyOrderList(Criteria cri);

	// 주문 총 갯수
	public int getMyOrderTotal(Criteria cri);
	
	// 회원 개인정보 조회
	public MemberVO memberPersonalDetail(String memberId);
	
	// 이메일 수정
	public int emailModify(MemberVO vo);
	
	// 주소 수정
	public int addressModify(MemberVO vo);
	
	// 비밀번호 수정
	public int passwordModify(MemberVO vo);
	
}
