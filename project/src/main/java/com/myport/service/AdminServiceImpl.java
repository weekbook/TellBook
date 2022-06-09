package com.myport.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myport.domain.AttachImageVO;
import com.myport.domain.BookVO;
import com.myport.domain.CateVO;
import com.myport.domain.Criteria;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderDTO;
import com.myport.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService{
	
	private AdminMapper adminmapper;

	@Transactional
	@Override
	public void bookEnroll(BookVO book) {
		log.info("service bookEnroll");
		adminmapper.bookEnroll(book);
		
		if(book.getImageList() == null || book.getImageList().size() <= 0 ) {
			return;
		}
		
		book.getImageList().forEach(attach ->{
			attach.setBookId(book.getBookId());
			adminmapper.imageEnroll(attach);
		});
	}

	@Override
	public List<CateVO> cateList() {
		log.info("service cateList");
		return adminmapper.cateList();
	}

	@Override
	public List<BookVO> goodsGetList(Criteria cri) {
		log.info("service goodsGetList");
		return adminmapper.goodsGetList(cri);
	}

	@Override
	public int goodsGetTotal(Criteria cri) {
		log.info("service goodsgetTotal");
		return adminmapper.goodsGetTotal(cri);
	}

	@Override
	public BookVO goodsGetDetail(int bookId) {
		log.info("service getDetail" );
		return adminmapper.goodsGetDetail(bookId);
	}

	@Transactional
	@Override
	public int goodsModify(BookVO book) {
		int result = adminmapper.goodsModify(book);
		
		if(result == 1 && book.getImageList() != null && book.getImageList().size() > 0) {
			adminmapper.deleteImageAll(book.getBookId());
			
			book.getImageList().forEach(attach -> {
				attach.setBookId(book.getBookId());
				adminmapper.imageEnroll(attach);
			});
		}
		
		return result;
	}

	@Override
	@Transactional
	public int goodsDelete(int bookId) {
		log.info("service delete");
		
		adminmapper.deleteImageAll(bookId);
		
		return adminmapper.goodsDelete(bookId);
	}

	@Override
	public List<AttachImageVO> getAttachInfo(int bookId) {
		log.info("getAttachInfo..");
		return adminmapper.getAttachInfo(bookId);
	}

	@Override
	public List<OrderDTO> getOrderList(Criteria cri) {
		return adminmapper.getOrderList(cri);
	}

	@Override
	public int getOrderTotal(Criteria cri) {
		return adminmapper.getOrderTotal(cri);
	}

	@Override
	public List<MemberVO> getMemberList(Criteria cri) {
		return adminmapper.getMemberList(cri);
	}

	@Override
	public int getMemberTotal(Criteria cri) {
		return adminmapper.getMemberTotal(cri);
	}

	@Override
	public MemberVO memberDetail(String memberId) {
		return adminmapper.memberDetail(memberId);
	}
	
	
}
