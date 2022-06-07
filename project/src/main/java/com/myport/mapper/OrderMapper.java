package com.myport.mapper;

import java.util.List;

import com.myport.domain.BookVO;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderDTO;
import com.myport.domain.OrderItemDTO;
import com.myport.domain.OrderPageItemDTO;

public interface OrderMapper {

	// 주문 상품 정보
	public OrderPageItemDTO getGoodsInfo(int bookId);
	
	// 주문 상품 정보(주문 처리)
	public OrderItemDTO getOrderInfo(int bookId);
	
	// 주문 테이블 등록
	public int enrollOrder(OrderDTO ord);
	
	// 주문 아이템 테이블 등록
	public int enrollOrderItem(OrderItemDTO orid);
	
	// 주문 금액 변경
	public int updateMoney(MemberVO member);
	
	// 주문 재고 차감
	public int updateStock(BookVO book);
	
	// 주문 취소
	public int orderCancle(String orderId);
	
	// 주문 상품 정보(주문취소)
	public List<OrderItemDTO> getOrderItemInfo(String orderId);
	
	// 주문 정보(주문취소)
	public OrderDTO getOrder(String orderId);
	
}
