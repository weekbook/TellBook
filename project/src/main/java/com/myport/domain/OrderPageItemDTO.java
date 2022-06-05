package com.myport.domain;

import lombok.Data;

@Data
public class OrderPageItemDTO {
	
	// 뷰로 부터 전달받을 값
	private int bookId;
	private int bookCount;
	
	// DB로부터 꺼내올 값
	private int bookName;
	private int bookPrice;
	private double bookDiscount;
	
	// 만들어 낼 값
	private int salePrice;
	private int totalPrice;
	private int point;
	private int totalPotint;
	
	// 값 초기화
	public void initSaleTotal() {
		this.salePrice = (int) (this.bookPrice * (1 - this.bookDiscount));
		this.totalPrice = this.salePrice * this.bookCount;
		this.point = (int) (Math.floor(this.salePrice * 0.05));
		this.totalPotint = this.point * this.bookCount;
	}
}
