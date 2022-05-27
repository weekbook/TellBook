package com.myport.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myport.domain.AuthorVO;
import com.myport.domain.Criteria;
import com.myport.mapper.AuthorMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class AuthorServiceImpl implements AuthorService{

	AuthorMapper authorMapper;
	
	@Override
	public void authorEnroll(AuthorVO author) throws Exception {
		
		authorMapper.authorEnroll(author);
	}

	@Override
	public List<AuthorVO> authorGetList(Criteria cri) throws Exception {
		log.info("service : authorGetList()...." + cri);
		return authorMapper.authorGetList(cri);
	}

	@Override
	public int authorGetTotal(Criteria cri) throws Exception {
		log.info("total()" + cri);
		return authorMapper.authorGetTotal(cri);
	}

	@Override
	public AuthorVO authorGetDetail(int authorId) throws Exception {
		log.info("authorDetail..." + authorId);
		return authorMapper.authorGetDetail(authorId);
	}

	@Override
	public int authorModify(AuthorVO author) throws Exception {
		log.info("authorModify... " + author);
		return authorMapper.authorModify(author);
	}

	@Override
	public int authorDelete(int authorId) throws Exception {
		log.info("authorDelete.."+authorId);
		return authorMapper.authorDelete(authorId);
	}

}
