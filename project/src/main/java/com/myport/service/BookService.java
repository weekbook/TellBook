package com.myport.service;

import java.util.List;

import com.myport.domain.BookVO;
import com.myport.domain.Criteria;

public interface BookService {
	
	/* »óÇ° °Ë»ö */
	public List<BookVO> getGoodsList(Criteria cri);
	
	/* »óÇ° ÃÑ °¹¼ö */
	public int goodsGetTotal(Criteria cri);
}
