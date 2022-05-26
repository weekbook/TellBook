package com.myport.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myport.domain.BookVO;
import com.myport.domain.CateVO;
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
	
	
}
