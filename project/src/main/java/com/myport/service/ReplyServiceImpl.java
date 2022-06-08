package com.myport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myport.domain.Criteria;
import com.myport.domain.PageDTO;
import com.myport.domain.ReplyDTO;
import com.myport.domain.ReplyPageDTO;
import com.myport.domain.ReplyVO;
import com.myport.domain.UpdateReplyDTO;
import com.myport.mapper.ComuBoMapper;
import com.myport.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReplyServiceImpl implements ReplyService{
	
	private ReplyMapper replyMapper;
	
	// 등록
	@Override
	public int enrollReply(ReplyDTO dto) {
		
		int result = replyMapper.enrollReply(dto);
		
		setRating(dto.getBookId());		
		
		return result;
	}

	// 중복체크
	@Override
	public String checkReply(ReplyDTO dto) {
		
		Integer result = replyMapper.checkReply(dto);
		
		if (result == null) {
			return "0";
		} else {
			return "1";
		}
	}

	// 댓글페이징
	@Override
	public ReplyPageDTO replyList(Criteria cri) {
		ReplyPageDTO dto = new ReplyPageDTO();
		
		dto.setList(replyMapper.getReplyList(cri));
		dto.setPageInfo(new PageDTO(cri, replyMapper.getReplyTotal(cri.getBookId())));
		return dto;
	}

	// 댓글 수정
	@Override
	public int updateReply(ReplyDTO dto) {
		
		int result = replyMapper.updateReply(dto);
		
		setRating(dto.getBookId());		
		
		return result;
	}

	// 댓글 수정(페이지)
	@Override
	public ReplyDTO getUpdateReply(int replyId) {
		
		return replyMapper.getUpdateReply(replyId);
	}

	// 댓글 삭제
	@Override
	public int deleteReply(ReplyDTO dto) {
		
		int result = replyMapper.deleteReply(dto.getReplyId());
		
		setRating(dto.getBookId());		
		
		return result;
	}
	
	// 평점 반영
	public void setRating(int bookId) {
		Double ratingAvg = replyMapper.getRatingAverage(bookId);
		
		if(ratingAvg == null) {
			ratingAvg = 0.0;
		}
		
		ratingAvg = (double) (Math.round(ratingAvg*10));
		ratingAvg = ratingAvg / 10;
		
		UpdateReplyDTO urd = new UpdateReplyDTO();
		urd.setBookId(bookId);
		urd.setRatingAvg(ratingAvg);
		
		replyMapper.updateRating(urd);
	}
	
//	@Transactional
//	@Override
//	public int register(ReplyVO vo) {
//		boardMapper.updateReplyCnt(vo.getBno(), 1);
//		return mapper.insert(vo);
//	}
//
//	@Override
//	public ReplyVO get(Long rno) {
//		return mapper.read(rno);
//	}
//
//	@Transactional
//	@Override
//	public int remove(Long rno) {
//		ReplyVO vo = mapper.read(rno);
//		boardMapper.updateReplyCnt(vo.getBno(), -1);
//		return mapper.delete(rno);
//	}
//
//	@Override
//	public int modify(ReplyVO reply) {
//		return mapper.update(reply);
//	}
//
//	@Override
//	public List<ReplyVO> getList(Criteria cri, Long bno) {
//		return mapper.getListWithPaging(cri, bno);
//	}
//
//	@Override
//	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
//		return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri, bno));
//	}
	

}
