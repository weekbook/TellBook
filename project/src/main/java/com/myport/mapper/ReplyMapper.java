package com.myport.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myport.domain.Criteria;
import com.myport.domain.ReplyDTO;
import com.myport.domain.ReplyVO;
import com.myport.domain.UpdateReplyDTO;

public interface ReplyMapper {
	
	// 댓글 등록
	public int enrollReply(ReplyDTO dto);
	
	// 댓글 존재 체크 (중복이 없을경우 Null이 넘어오기때문에 int가아닌 Integer로 반환)
	public Integer checkReply(ReplyDTO dto);
	
	// 댓글 페이징
	public List<ReplyDTO> getReplyList(Criteria cri);
	
	// 댓글 총 갯수
	public int getReplyTotal(int bookId);
	
	// 댓글 수정
	public int updateReply(ReplyDTO dto);
	
	// 댓글 한개 정보(수정페이지)
	public ReplyDTO getUpdateReply(int replyId);
	
	// 댓글 삭제
	public int deleteReply(int replyId);
	
	// 평점 평균 구하기
	public Double getRatingAverage(int bookId);
	
	// 평점 평균 반영하기
	public int updateRating(UpdateReplyDTO dto);
}
