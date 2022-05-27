package com.myport.service;

import java.util.List;

import com.myport.domain.BookVO;
import com.myport.domain.CateVO;
import com.myport.domain.Criteria;

public interface AdminService {
	
	// ��ǰ ���
	public void bookEnroll(BookVO book);
	
	// ī�װ� ����Ʈ
	public List<CateVO> cateList();
	
	
	// ��ǰ ����Ʈ
	public List<BookVO> goodsGetList(Criteria cri);
	
	// ��ǰ �� ����
	public int goodsGetTotal(Criteria cri);
	
	// ��ǰ ��ȸ
	public BookVO goodsGetDetail(int bookId);
	
	// ��ǰ ����
	public int goodsModify(BookVO book);
	
	// ��ǰ ����
	public int goodsDelete(int bookId);
}
