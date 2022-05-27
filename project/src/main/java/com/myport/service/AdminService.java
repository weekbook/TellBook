package com.myport.service;

import java.util.List;

import com.myport.domain.BookVO;
import com.myport.domain.CateVO;
import com.myport.domain.Criteria;

public interface AdminService {
	
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
}
