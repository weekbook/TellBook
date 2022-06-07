package com.myport.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myport.domain.CartDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartMapperTests {

	@Autowired
	private CartMapper mapper;
	
	
//	@Test
//	public void addCart() {
//		String memberId = "admin";
//		int bookId = 241;
//		int count = 5;
//		
//		CartDTO cart = new CartDTO();
//		cart.setMemberId(memberId);
//		cart.setBookId(bookId);
//		cart.setBookCount(count);
//		
//		int result = 0;
//		result = mapper.addCart(cart);
//		
//		System.out.println("��� : " + result);
//	}
	
	
	// īƮ ����
//	@Test
//	public void deleteCartTest() {
//		int cartId = 3;
//		
//		mapper.deleteCart(cartId);
//	}
	
	// īƮ ����
//	@Test
//	public void modifyCartTest() {
//		int cartId = 1;
//		int count = 5;
//		
//		CartDTO cart = new CartDTO();
//		cart.setCartId(cartId);
//		cart.setBookCount(count);
//		
//		mapper.modifyCount(cart);
//	}
	
	// īƮ ���
//	@Test
//	public void getCartTest() {
//		String memberId = "admin";
//		
//		List<CartDTO> list = mapper.getCart(memberId);
//		for(CartDTO cart : list) {
//			System.out.println(cart);
//			cart.initSaleTotal();
//			System.out.println("init cart : " + cart);
//		}
//	}
	
	// īƮ Ȯ��
//	@Test
//	public void checkCartTest() {
//		
//		String memberId = "admin";
//		int bookId = 263;
//		
//		CartDTO cart = new CartDTO();
//		cart.setMemberId(memberId);
//		cart.setBookId(bookId);
//		
//		CartDTO resultCart = mapper.checkCart(cart);
//		System.out.println("��� : " + resultCart);
//	}
	
	// ��ٱ��� ����(�ֹ� �Ϸ� ��)
	@Test
	public void deleteOrderCart() {
		String memberId = "admin";
		int bookId = 262;
		
		CartDTO dto = new CartDTO();
		dto.setMemberId(memberId);
		dto.setBookId(bookId);
		
		mapper.deleteOrderCart(dto);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}