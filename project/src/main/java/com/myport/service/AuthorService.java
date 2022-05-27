package com.myport.service;

import java.util.List;

import com.myport.domain.AuthorVO;
import com.myport.domain.Criteria;

public interface AuthorService {

	public void authorEnroll(AuthorVO author) throws Exception;
	
	public List<AuthorVO> authorGetList(Criteria cri) throws Exception;
	
	public int authorGetTotal(Criteria cri) throws Exception;
	
	public AuthorVO authorGetDetail(int authorId) throws Exception;
	
	public int authorModify(AuthorVO author) throws Exception;
	
	public int authorDelete(int authorId) throws Exception;
	
}
