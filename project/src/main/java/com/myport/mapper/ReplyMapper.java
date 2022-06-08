package com.myport.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myport.domain.Criteria;
import com.myport.domain.ReplyDTO;
import com.myport.domain.ReplyVO;
import com.myport.domain.UpdateReplyDTO;

public interface ReplyMapper {
	
	// ��� ���
	public int enrollReply(ReplyDTO dto);
	
	// ��� ���� üũ (�ߺ��� ������� Null�� �Ѿ���⶧���� int���ƴ� Integer�� ��ȯ)
	public Integer checkReply(ReplyDTO dto);
	
	// ��� ����¡
	public List<ReplyDTO> getReplyList(Criteria cri);
	
	// ��� �� ����
	public int getReplyTotal(int bookId);
	
	// ��� ����
	public int updateReply(ReplyDTO dto);
	
	// ��� �Ѱ� ����(����������)
	public ReplyDTO getUpdateReply(int replyId);
	
	// ��� ����
	public int deleteReply(int replyId);
	
	// ���� ��� ���ϱ�
	public Double getRatingAverage(int bookId);
	
	// ���� ��� �ݿ��ϱ�
	public int updateRating(UpdateReplyDTO dto);
}
