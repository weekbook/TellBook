package com.myport.service;

import java.util.List;

import com.myport.domain.BookVO;
import com.myport.domain.CateVO;

public interface AdminService {
	
	// ��ǰ ���
	public void bookEnroll(BookVO book);
	
	// ī�װ� ����Ʈ
	public List<CateVO> cateList();
	
}
