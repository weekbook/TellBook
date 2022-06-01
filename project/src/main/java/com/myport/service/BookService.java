package com.myport.service;

import java.util.List;

import com.myport.domain.BookVO;
import com.myport.domain.Criteria;

public interface BookService {
	
	/* ��ǰ �˻� */
	public List<BookVO> getGoodsList(Criteria cri);
	
	/* ��ǰ �� ���� */
	public int goodsGetTotal(Criteria cri);
}
