package com.myport.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDTO {
	
	/* 주문 번호 */
	private String orderId;
	
	/* 배송 받는이 */
	private String addressee;
	
	/* 주문 회원 아이디 */
	private String memberId;
	
	/* 우편번호 */
	private String memberAddr1;
	
	/* 회원 주소 */
	private String memberAddr2;
	
	/* 회원 상세주소 */
	private String memberAddr3;
	
	/* 주문 상태 */
	private String orderState;
	
	/* 주문 상품 */
	private List<OrderItemDTO> orders;	
	
	/* 배송비 */
	private int deliveryCost;
	
	/* 사용 포인트 */
	private int usePoint;
	
	/* 주문 날짜 */
	private Date orderDate;
	
	/* DB테이블 존재 하지 않는 데이터 */
	
	/* 판매가(모든 상품 비용) */
	private int orderSalePrice;
	
	/* 적립 포인트 */
	private int orderSavePoint;
	
	/* 최종 판매 비용 */
	private int orderFinalSalePrice;
	
	
	// 주문작업 필요 데이터 세팅
	public void getOrderPriceInfo() {
		// 상품 비용, 적립포인트
		for(OrderItemDTO order : orders) {
			orderSalePrice += order.getTotalPrice();
			orderSavePoint += order.getTotalSavePoint();
		}
		// 배송비용
		if (orderSalePrice >= 30000) {
			deliveryCost = 0;
		} else {
			deliveryCost = 3000;
		}
		// 최종 비용(상품 비용 + 배송비 - 사용 포인트)
		orderFinalSalePrice = orderSalePrice + deliveryCost - usePoint;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
