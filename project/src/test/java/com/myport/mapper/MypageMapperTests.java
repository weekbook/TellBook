package com.myport.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myport.domain.BookVO;
import com.myport.domain.OrderInfoDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MypageMapperTests {
	
	@Autowired
	private MyPageMapper mapper;
	
	@Test
	public void productNameTest() {
		
//		List<BookVO> list = mapper.getMyOrderProductName("admin", "admin_2022070746");
		
//		for(BookVO s : list) {
//			System.out.println(s.getBookName());
//		}
		
	}
	
	@Test
	public void orderInfo() {
		
		List<OrderInfoDTO> list = mapper.gerOrderInfo("admin_2022070746");
		
		System.out.println(list);
		
	}
}
