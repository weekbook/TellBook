package com.myport.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.myport.domain.BookVO;
import com.myport.domain.Criteria;
import com.myport.domain.ReplyDTO;
import com.myport.domain.ReplyPageDTO;
import com.myport.domain.ReplyVO;
import com.myport.service.BookService;
import com.myport.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController // 뷰를 만들지 않고 http body에 바로 데이터를 담아 반환할 것이기 때문에 RestController
@RequestMapping("/reply")
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService replyService;
	
	// 댓글 등록
	@PostMapping("/enroll")
	public void enrollReplyPOST(ReplyDTO dto) {
		replyService.enrollReply(dto);
	}
	
	// 댓글 체크
	@PostMapping("/check")
	public String replyCheckPOST(ReplyDTO dto) {
		return replyService.checkReply(dto);
	}
	
	// 댓글 페이징
	@GetMapping(value="/list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ReplyPageDTO replyListPOST(Criteria cri) {
		return replyService.replyList(cri);
	}
	
	// 댓글 수정
	@PostMapping("/update")
	public void replyModifyPOST(ReplyDTO dto) {
		replyService.updateReply(dto);
	}
	
	// 댓글 삭제
	@PostMapping("/delete")
	public void replyDeletePOST(ReplyDTO dto) {
		replyService.deleteReply(dto);
	}
	
//	@PostMapping(value = "/new", consumes = "application/json"
//			, produces = {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
//		log.info("ReplyVO: " + vo);
//		int insertCount = service.register(vo);
//		log.info("Reply insert count: " + insertCount);
//		
//		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
//	
//	@GetMapping(value = "/pages/{bno}/{page}",
//			produces = {MediaType.APPLICATION_JSON_VALUE})
//	public ResponseEntity<ReplyPageDTO> getList(
//			@PathVariable("page") int page,
//			@PathVariable("bno") Long bno){	
//		log.info("紐⑸줉");
//		Criteria cri = new Criteria(page, 10);
//		log.info(cri);
//		
//		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
//	}
//	
//	@GetMapping(value = "/{rno}",
//			produces = {MediaType.APPLICATION_JSON_VALUE})
//	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno){
//		log.info("1媛쒖씫湲�" + rno);
//		return new ResponseEntity<>(
//				service.get(rno),HttpStatus.OK);
//	}
//	
//	@DeleteMapping(value = "/{rno}",
//			produces = {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> remove(
//			@PathVariable("rno") Long rno, @RequestBody ReplyVO vo){
//		log.info("�궘�젣 : " + rno);
//		
//		return service.remove(rno) == 1 ?
//				new ResponseEntity<>("delete",HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
//	
//	@RequestMapping(method = {RequestMethod.PUT,
//			RequestMethod.PATCH}, value = "/{rno}",
//			consumes = "application/json",
//			produces = {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> modify(
//			@RequestBody ReplyVO vo,
//			@PathVariable("rno") Long rno){
//		vo.setRno(rno);
//		log.info("rno : " + rno);
//		log.info("�닔�젙: " + vo);
//		
//		return service.modify(vo) == 1
//				? new ResponseEntity<>("modify", HttpStatus.OK)
//						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
