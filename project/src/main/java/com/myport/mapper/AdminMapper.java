package com.myport.mapper;

import java.util.List;

import com.myport.domain.BookVO;
import com.myport.domain.CateVO;

public interface AdminMapper {
	
	// 상품 등록
	public void bookEnroll(BookVO book);
	
	// 카테고리 리스트
	public List<CateVO> cateList();

}
