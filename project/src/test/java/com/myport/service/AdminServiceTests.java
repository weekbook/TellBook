package com.myport.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myport.domain.AttachImageVO;
import com.myport.domain.BookVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminServiceTests {
	
	@Autowired
	private AdminService service;
	
	// ��ǰ���, �̹��� ��� �׽�Ʈ
	@Test
	public void bookEnrollTests() {
		BookVO book = new BookVO();
		// ��ǰ ����
		book.setBookName("service �׽�Ʈ");
		book.setAuthorId(228);
		book.setPubleYear("2021-03-18");
		book.setPublisher("���ǻ�");
		book.setCateCode("202001");
		book.setBookPrice(20000);
		book.setBookStock(300);
		book.setBookDiscount(0.23);
		book.setBookIntro("å �Ұ� ");
		book.setBookContents("å ���� ");

		// �̹��� ����
		List<AttachImageVO> imageList = new ArrayList<AttachImageVO>(); 
		
		AttachImageVO image1 = new AttachImageVO();
		AttachImageVO image2 = new AttachImageVO();
		
		image1.setFileName("test Image 1");
		image1.setUploadPath("test image 1");
		image1.setUuid("test1111");
		
		image2.setFileName("test Image 2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		image2.setUploadPath("test image 2");
		image2.setUuid("test2222");
		
		imageList.add(image1);
		imageList.add(image2);
		
		book.setImageList(imageList);        
		
		// bookEnroll() �޼��� ȣ��
		service.bookEnroll(book);
		
		System.out.println("��ϵ� VO : " + book);
	}
}
