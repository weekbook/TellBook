package com.myport.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myport.domain.BookVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {
	
	@Autowired
	private AdminMapper mapper;
	
	/* ��ǰ ��� */
//	@Test
//	public void bookEnrollTest() throws Exception{
//		
//		BookVO book = new BookVO();
//		
//		book.setBookName("mapper �׽�Ʈ");
//		book.setAuthorId(123);
//		book.setPubleYear("2021-03-18");
//		book.setPublisher("���ǻ�");
//		book.setCateCode("0231");
//		book.setBookPrice(20000);
//		book.setBookStock(300);
//		book.setBookDiscount(0.23);
//		book.setBookIntro("å �Ұ� ");
//		book.setBookContents("å ���� ");
//		
//		mapper.bookEnroll(book);
//	}
	
	
	// ī�װ� �׽�Ʈ
	@Test
	public void cateListTest() throws Exception{
		System.out.println("cateList().." + mapper.cateList());
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
