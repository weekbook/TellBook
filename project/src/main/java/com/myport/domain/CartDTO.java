package com.myport.domain;

import java.util.List;

import lombok.Data;

@Data
public class CartDTO {
	
	private int cartId;
	
	private String memberId;
	
	private int bookId;
	
	private int bookCount;
	
	// book
	
	private String bookName;
	
	private int bookPrice;
	
	private double bookDiscount;
	
	// 추가
	private int salePrice;
	
	private int totalPrice;
	
	private int point;
	
	private int totalPoint;
	
	private List<AttachImageVO> imageList;
	
	private int bookStock;
	
	// 할인율 및 할인 가격, 포인트 구하기
	public void initSaleTotal() {
		this.salePrice = (int) (this.bookPrice * (1-this.bookDiscount));
		this.totalPrice = this.salePrice * this.bookCount;
		this.point = (int)(Math.floor(this.salePrice * 0.05));
		this.totalPoint = this.point * this.bookCount;
	}
}
