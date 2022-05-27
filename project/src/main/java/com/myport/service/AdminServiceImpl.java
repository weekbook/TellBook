package com.myport.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myport.domain.BookVO;
import com.myport.domain.CateVO;
import com.myport.domain.Criteria;
import com.myport.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService{
	
	private AdminMapper adminmapper;

	@Override
	public void bookEnroll(BookVO book) {
		log.info("service bookEnroll");
		adminmapper.bookEnroll(book);
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

	@Override
	public int goodsModify(BookVO book) {
		log.info("service modify");
		return adminmapper.goodsModify(book);
	}

	@Override
	public int goodsDelete(int bookId) {
		log.info("service delete");
		return adminmapper.goodsDelete(bookId);
	}
	
	
}
