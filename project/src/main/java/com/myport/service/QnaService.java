package com.myport.service;

import java.util.List;

import com.myport.domain.Criteria;
import com.myport.domain.QnaVO;

public interface QnaService {

	// 글 작성
	public int insert(QnaVO board);

	// 글 조회
	public List<QnaVO> getList(Criteria cri);

	// 글 조회(Admin)
	public List<QnaVO> getListAll(Criteria cri);

	// 게시물 수
	public int getQnaTotal(Criteria cri);

	// 문의 상세
	public QnaVO readQna(Long bId);

	// 답변
	public boolean answerQna(QnaVO board);
}
