package com.myport.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myport.domain.BookVO;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderDTO;
import com.myport.domain.OrderItemDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OrderMapperTests {

	@Autowired
	private OrderMapper mapper;
	
	// 주문 처리
//	@Test
//	public void getOrderInfoTest() {
//		OrderItemDTO orderInfo = mapper.getOrderInfo(262);
//		System.out.println("result : " + orderInfo);
//	}
	
	// book_order 테이블 등록
//	@Test
//	public void enrollOrderTest() {
//		OrderDTO ord = new OrderDTO();
//		List<OrderItemDTO> orders = new ArrayList();
//		
//		OrderItemDTO order1 = new OrderItemDTO();
//		
//		order1.setBookId(262);
//		order1.setBookCount(5);
//		order1.setBookPrice(70000);
//		order1.setBookDiscount(0.1);
//		order1.initSaleTotal();
//		
//		ord.setOrders(orders);
//		
//		ord.setOrderId("2022_test1");
//		ord.setAddressee("test");
//		ord.setMemberId("admin");
//		ord.setMemberAddr1("test");
//		ord.setMemberAddr2("test");
//		ord.setMemberAddr3("test");
//		ord.setOrderState("배송중비");
//		ord.getOrderPriceInfo();
//		ord.setUsePoint(1000);
//		
//		mapper.enrollOrder(ord);
//	}
	
	// 테이블 등록
//	@Test
//	public void enrollOrderItemTest() {
//		
//		OrderItemDTO oid = new OrderItemDTO();
//		
//		oid.setOrderId("2022_test1");
//		oid.setBookId(262);
//		oid.setBookCount(1);
//		oid.setBookPrice(70000);
//		oid.setBookDiscount(0.1);
//				
//		oid.initSaleTotal();
//		
//		mapper.enrollOrderItem(oid);
//	}
	
	// 회원 돈,포인트 변경
//	@Test
//	public void deductMoneyTest() {
//		MemberVO member = new MemberVO();
//		
//		member.setMemberId("admin");
//		member.setMoney(400000);
//		member.setPoint(20000);
//		
//		mapper.deductMoney(member);
//	}
		
	
	// 상품 재고 변경
//	@Test
//	public void deductStockTest() {
//		BookVO book = new BookVO();
//		
//		book.setBookId(262);
//		book.setBookStock(77);
//		
//		mapper.deductStock(book);
//	}
//	
	
	
	
	
	
	
	
	
	
	
	
	
}
