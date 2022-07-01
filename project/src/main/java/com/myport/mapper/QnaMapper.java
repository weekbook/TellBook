package com.myport.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myport.domain.Criteria;
import com.myport.domain.QnaVO;

public interface QnaMapper {

	// �� �ۼ�
	public int insert(QnaVO board);
	
	// �� ��ȸ
	public List<QnaVO> getList(Criteria cri);
	
	// �Խù� ��
	public int getQnaTotal(Criteria cri);
	
	// ���� ��
	public QnaVO readQna(Long bId);
	
	// �亯
	public int answerQna(QnaVO board);
}
