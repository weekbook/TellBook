package com.myport.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myport.domain.AttachImageVO;
import com.myport.domain.BookVO;
import com.myport.domain.CateVO;
import com.myport.domain.Criteria;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderDTO;
import com.myport.domain.OrderInfoDTO;

public interface AdminMapper {
	
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

	// �̹��� ���
	public void imageEnroll(AttachImageVO vo);
	
	/* ���� ��ǰ �̹��� ��ü ���� */
	public void deleteImageAll(int bookId);
	
	/* ������ ��¥ �̹��� ����Ʈ */
	public List<AttachImageVO> checkFileList();
	
	/* ���� ��ǰ �̹��� ���� ��� */
	public List<AttachImageVO> getAttachInfo(int bookId);
	
	// �ֹ� ��ǰ ����Ʈ
	public List<OrderDTO> getOrderList(Criteria cri);
	
	// �ֹ� �� ����
	public int getOrderTotal(Criteria cri);
	
	// ȸ�� ����Ʈ
	public List<MemberVO> getMemberList(Criteria cri);
	
	// ȸ�� �� �ο�
	public int getMemberTotal(Criteria cri);
	
	// ȸ�� �� ��ȸ
	public MemberVO memberDetail(String memberId);
}
