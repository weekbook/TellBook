package com.myport.mapper;

import java.util.List;

import com.myport.domain.QnaVO;

public interface QnaMapper {

	// �� �ۼ�
	public int insert(QnaVO board);
	
	// �� ��ȸ
	public List<QnaVO> getList();
}
