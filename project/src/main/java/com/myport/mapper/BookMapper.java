package com.myport.mapper;

import java.util.List;

import com.myport.domain.BookVO;
import com.myport.domain.CateFilterDTO;
import com.myport.domain.CateVO;
import com.myport.domain.Criteria;

public interface BookMapper {

	/* ��ǰ �˻� */
	public List<BookVO> getGoodsList(Criteria cri);
	
	/* ��ǰ �� ���� */
	public int goodsGetTotal(Criteria cri);
	
	// �۰� id ����Ʈ ��û
	public String[] getAuthorIdList(String keyword);
	
	/* ���� ī�װ� ����Ʈ */
	public List<CateVO> getCateCode1();
	
	/* �ܱ� ī�װ� ����Ʈ */
	public List<CateVO> getCateCode2();
	
	/* �˻� ��� ī�װ� ����Ʈ */
	public String[] getCateList(Criteria cri);
	
	/* ī�װ� ����(+�˻���� ����) */
	public CateFilterDTO getCateInfo(Criteria cri);
}
