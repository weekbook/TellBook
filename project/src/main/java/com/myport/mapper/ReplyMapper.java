package com.myport.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myport.domain.Criteria;
import com.myport.domain.ReplyDTO;
import com.myport.domain.ReplyVO;

public interface ReplyMapper {
	
	// ��� ���
	public int enrollReply(ReplyDTO dto);
	
	
	
}
