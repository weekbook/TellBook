package com.myport.mapper;

import java.util.List;

import com.myport.domain.AuthorVO;
import com.myport.domain.Criteria;

public interface AuthorMapper {

	// �۰� ���
	public void authorEnroll(AuthorVO author);
	
	// �۰� ���
	public List<AuthorVO> authorGetList(Criteria cri);
	
	// �۰� total
	public int authorGetTotal(Criteria cri);
	
	// �۰� ��
	public AuthorVO authorGetDetail(int authorID);
}
