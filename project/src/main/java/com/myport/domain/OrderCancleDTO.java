package com.myport.domain;

import lombok.Data;

@Data
public class OrderCancleDTO {
	
	// 주문 취소 기능에 필요 변수
	private String memberId;
	private String orderId;
	
	// 리다이렉트시 필요한 페이지 정보
	private String keyword;
	private String amount;
	private String pageNum;
	
}
