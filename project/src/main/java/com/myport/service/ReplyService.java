package com.myport.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myport.domain.Criteria;
import com.myport.domain.ReplyDTO;
import com.myport.domain.ReplyPageDTO;
import com.myport.domain.ReplyVO;

public interface ReplyService {
	
	// 댓글 등록
	public int enrollReply(ReplyDTO dto);
	
	// 댓글 중복 체크
	public String checkReply(ReplyDTO dto);
	
	// 댓글 페이징
	public ReplyPageDTO replyList(Criteria cri);
	
	// 댓글 수정
	public int updateReply(ReplyDTO dto);
	
	// 댓글 한개 정보(수정페이지)
	public ReplyDTO getUpdateReply(int replyId);
	
	// 댓글 삭제
	public int deleteReply(ReplyDTO dto);
	
//	public int register(ReplyVO vo);
//	public ReplyVO get(Long rno);
//	public int remove(Long rno);
//	public int modify(ReplyVO reply);
//	public List<ReplyVO>getList(
//			@Param("cri") Criteria cri,
//			@Param("bno") Long bno);
//	public ReplyPageDTO getListPage(Criteria cri, Long bno);
}
