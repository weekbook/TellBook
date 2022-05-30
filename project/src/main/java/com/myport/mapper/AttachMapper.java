package com.myport.mapper;

import java.util.List;

import com.myport.domain.AttachImageVO;

public interface AttachMapper {

	// 이미지 데이터 반환
	public List<AttachImageVO> getAttachList(int bookId);
	
	
}
