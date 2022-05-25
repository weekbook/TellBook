package com.myport.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myport.domain.AuthorVO;
import com.myport.domain.Criteria;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AuthorServiceTests {
	
	@Autowired
	AuthorService service;
	
//	@Test
//	public void authorEnrollTest() throws Exception{
//		AuthorVO author = new AuthorVO();
//		
//		author.setNationId("01");
//		author.setAuthorName("테스트");
//		author.setAuthorIntro("테스트 소개");
//		
//		service.authorEnroll(author);
//	}
	
//	@Test
//	public void authorGetListTest() throws Exception{
//		Criteria cri = new Criteria(1,10);
//		List<AuthorVO> list = service.authorGetList(cri);
//		
//		for (int i = 0; i < list.size(); i++) {
//			System.out.println("list" + i + "....." + list.get(i));
//		}
//	}
	
//	@Test
//	public void authorGetTotalTest() throws Exception{
//		
//		Criteria cri = new Criteria();
//		cri.setKeyword("김난도");
//		
//		int total = service.authorGetTotal(cri);
//		
//		System.out.println("total....." + total);
//	}
	
	@Test
	public void authorGetDetailTest() throws Exception{
		int authorId = 30;
		log.info("author...." + service.authorGetDetail(authorId)); 
	}
}
