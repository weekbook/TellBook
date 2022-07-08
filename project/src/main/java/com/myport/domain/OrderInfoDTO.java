package com.myport.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderInfoDTO {
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
	
	/* 배송비 */
	private int deliveryCost;
	
	/* 사용 포인트 */
	private int usePoint;
	
	// 적립 포인트
	private int savePoint;
	
	/* 주문 날짜 */
	private Date orderDate;
	
	/* DB테이블 존재 하지 않는 데이터 */
	
	// 주문한 책 이름
	private String bookName;
	
	// 할인률
	private double bookDiscount;
	
	// 책 가격
	private int bookPrice;
	
	// 주문 수량
	private int bookCount;
	
	// 책 ID
	private int bookId;
}
