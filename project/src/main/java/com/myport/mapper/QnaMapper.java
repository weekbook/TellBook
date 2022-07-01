package com.myport.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myport.domain.Criteria;
import com.myport.domain.QnaVO;

public interface QnaMapper {

	// 글 작성
	public int insert(QnaVO board);
	
	// 글 조회
	public List<QnaVO> getList(Criteria cri);
	
	// 게시물 수
	public int getQnaTotal(Criteria cri);
	
	// 문의 상세
	public QnaVO readQna(Long bId);
	
	// 답변
	public int answerQna(QnaVO board);
}
