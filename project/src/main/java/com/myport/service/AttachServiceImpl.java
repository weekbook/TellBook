package com.myport.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myport.domain.AttachImageVO;
import com.myport.mapper.AttachMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class AttachServiceImpl implements AttachService{
	
	private AttachMapper attachMapper;

	// �̹��� ������ ��ȯ
	@Override
	public List<AttachImageVO> getAttachList(int bookId) {
		log.info("getAttachList...");
		return attachMapper.getAttachList(bookId);
	}

}
