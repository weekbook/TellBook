package com.myport.service;

import java.util.List;

import com.myport.domain.BookVO;
import com.myport.domain.CateFilterDTO;
import com.myport.domain.CateVO;
import com.myport.domain.Criteria;
import com.myport.domain.SelectDTO;

public interface BookService {
	
	/* ��ǰ �˻� */
	public List<BookVO> getGoodsList(Criteria cri);
	
	/* ��ǰ �� ���� */
	public int goodsGetTotal(Criteria cri);
	
	/* ���� ī�װ� ����Ʈ */
	public List<CateVO> getCateCode1();
	
	/* �ܱ� ī�װ� ����Ʈ */
	public List<CateVO> getCateCode2();
	
	/* �˻���� ī�װ� ���� ���� */
	public List<CateFilterDTO> getCateInfoList(Criteria cri);
	
	// ��ǰ ����
	public BookVO getGoodsInfo(int bookId);
	
	// ��ǰ id �̸�
	public BookVO getBookIdName(int bookId);
	
	// ������ ��ǰ ����
	public List<SelectDTO> likeSelect();
}
