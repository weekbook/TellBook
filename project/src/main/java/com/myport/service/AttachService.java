package com.myport.service;

import java.util.List;

import com.myport.domain.AttachImageVO;

public interface AttachService {
	
	// �̹��� ������ ��ȯ
	public List<AttachImageVO> getAttachList(int bookId);

}
