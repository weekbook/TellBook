package com.myport.mapper;

import java.util.List;

import com.myport.domain.BookVO;
import com.myport.domain.Criteria;

public interface BookMapper {

	/* ��ǰ �˻� */
	public List<BookVO> getGoodsList(Criteria cri);
	
	/* ��ǰ �� ���� */
	public int goodsGetTotal(Criteria cri);
	
	// �۰� id ����Ʈ ��û
	public String[] getAuthorIdList(String keyword);
}
