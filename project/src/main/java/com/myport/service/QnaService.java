package com.myport.service;

import java.util.List;

import com.myport.domain.Criteria;
import com.myport.domain.QnaVO;

public interface QnaService {

	// �� �ۼ�
	public int insert(QnaVO board);

	// �� ��ȸ
	public List<QnaVO> getList(Criteria cri);

	// �� ��ȸ(Admin)
	public List<QnaVO> getListAll(Criteria cri);

	// �Խù� ��
	public int getQnaTotal(Criteria cri);

	// ���� ��
	public QnaVO readQna(Long bId);

	// �亯
	public boolean answerQna(QnaVO board);
}
