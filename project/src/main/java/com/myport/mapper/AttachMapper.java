package com.myport.mapper;

import java.util.List;

import com.myport.domain.AttachImageVO;

public interface AttachMapper {

	// �̹��� ������ ��ȯ
	public List<AttachImageVO> getAttachList(int bookId);
	
	
}
