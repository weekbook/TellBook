package com.myport.service;

import java.util.List;

import com.myport.domain.Criteria;
import com.myport.domain.QnaVO;

public interface QnaService {

	// �� �ۼ�
	public int insert(QnaVO board);

	// �� ��ȸ
	public List<QnaVO> getList(Criteria cri);
	
	// �Խù� ��
	public int getQnaTotal(Criteria cri);
}
