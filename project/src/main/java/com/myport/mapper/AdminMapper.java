package com.myport.mapper;

import java.util.List;

import com.myport.domain.BookVO;
import com.myport.domain.CateVO;

public interface AdminMapper {
	
	// ��ǰ ���
	public void bookEnroll(BookVO book);
	
	// ī�װ� ����Ʈ
	public List<CateVO> cateList();

}
