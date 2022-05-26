package com.myport.mapper;

import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myport.domain.AuthorVO;
import com.myport.domain.Criteria;
import com.myport.mapper.AuthorMapper;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AuthorMapperTests {
	
	@Autowired
	private AuthorMapper mapper;
	
	
	// �۰� ��� �׽�Ʈ
//	@Test
//	public void authorEnroll() throws Exception{
//		AuthorVO author = new AuthorVO();
//		
//		author.setNationId("01");
//		author.setAuthorName("�׽�Ʈ");
//		author.setAuthorIntro("�׽�Ʈ �Ұ�");
//		
//		mapper.authorEnroll(author);
//	}
	
//	@Test
//	public void authorGetListTest() throws Exception{
//		Criteria cri = new Criteria(3,10); // 3������ & 10�� �� ǥ��
//		cri.setKeyword("�賭��");
//		
//		List<AuthorVO> list = mapper.authorGetList(cri);
//		
//		
//		for (int i = 0; i < list.size(); i++) {
//			System.out.println("list" + i + "....." + list.get(i));
//		}
//	}
	
//	@Test
//	public void authorGetTotalTest() throws Exception{
//		
//		Criteria cri = new Criteria();
//		cri.setKeyword("�賭��");
//		
//		int total = mapper.authorGetTotal(cri);
//		
//		System.out.println("total....." + total);
//	}
	
//	@Test
//	public void authorGetDetailTest() {
//		int authorId = 30;
//		AuthorVO author = mapper.authorGetDetail(authorId);
//		System.out.println("author....." + author);
//	}
	

	@Test
	public void authorModifyTest() {
		AuthorVO author = new AuthorVO();
		
		author.setAuthorId(226);
		System.out.println("���� ��...." + mapper.authorGetDetail(author.getAuthorId()));
		
		author.setAuthorName("����");
		author.setNationId("01");
		author.setAuthorIntro("�Ұ� ���� �Ͽ����ϴ�.");
		
		mapper.authorModify(author);
		System.out.println("���� �� ... "  + mapper.authorGetDetail(author.getAuthorId()));
	}
	
	
	
	
	
	
}
