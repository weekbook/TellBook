package com.myport.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myport.domain.BookVO;
import com.myport.domain.Criteria;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderDTO;
import com.myport.domain.OrderInfoDTO;

import lombok.AllArgsConstructor;

public interface MypageService {

	// 주문 상품 리스트
	public List<OrderDTO> getMyOrderList(Criteria cri);

	// 주문 상세
	public List<OrderInfoDTO> gerOrderInfo(String orderId);

	// 주문 상품명 출력
//	public List<BookVO> getMyOrderProductName(@Param("memberId") String memberId, @Param("orderId") String orderId);

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

	// 회원 탈퇴
	public int memeberDelete(String memberId);
}
