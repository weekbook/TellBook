package com.myport.mapper;

import java.util.List;

import com.myport.domain.AuthorVO;
import com.myport.domain.Criteria;

public interface AuthorMapper {

	// 작가 등록
	public void authorEnroll(AuthorVO author);
	
	// 작가 목록
	public List<AuthorVO> authorGetList(Criteria cri);
	
	// 작가 total
	public int authorGetTotal(Criteria cri);
	
	// 작가 상세
	public AuthorVO authorGetDetail(int authorID);
}
