package com.myport.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myport.domain.AttachImageVO;
import com.myport.domain.BookVO;
import com.myport.domain.CateVO;
import com.myport.domain.Criteria;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderDTO;
import com.myport.domain.OrderInfoDTO;

public interface AdminMapper {
	
	// 상품 등록
	public void bookEnroll(BookVO book);
	
	// 카테고리 리스트
	public List<CateVO> cateList();
	
	// 상품 리스트
	public List<BookVO> goodsGetList(Criteria cri);
	
	// 상품 총 개수
	public int goodsGetTotal(Criteria cri);
	
	// 상품 조회
	public BookVO goodsGetDetail(int bookId);
	
	// 상품 수정
	public int goodsModify(BookVO book);
	
	// 상품 삭제
	public int goodsDelete(int bookId);

	// 이미지 등록
	public void imageEnroll(AttachImageVO vo);
	
	/* 지정 상품 이미지 전체 삭제 */
	public void deleteImageAll(int bookId);
	
	/* 어제자 날짜 이미지 리스트 */
	public List<AttachImageVO> checkFileList();
	
	/* 지정 상품 이미지 정보 얻기 */
	public List<AttachImageVO> getAttachInfo(int bookId);
	
	// 주문 상품 리스트
	public List<OrderDTO> getOrderList(Criteria cri);
	
	// 주문 총 갯수
	public int getOrderTotal(Criteria cri);
	
	// 회원 리스트
	public List<MemberVO> getMemberList(Criteria cri);
	
	// 회원 총 인원
	public int getMemberTotal(Criteria cri);
	
	// 회원 상세 조회
	public MemberVO memberDetail(String memberId);
}
