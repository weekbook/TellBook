package com.myport.mapper;

import java.util.List;

import com.myport.domain.QnaVO;

public interface QnaMapper {

	// 글 작성
	public int insert(QnaVO board);
	
	// 글 조회
	public List<QnaVO> getList();
}
