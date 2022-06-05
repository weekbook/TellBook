package com.myport.domain;

import lombok.Data;

@Data
public class OrderPageItemDTO {
	
	// ��� ���� ���޹��� ��
	private int bookId;
	private int bookCount;
	
	// DB�κ��� ������ ��
	private int bookName;
	private int bookPrice;
	private double bookDiscount;
	
	// ����� �� ��
	private int salePrice;
	private int totalPrice;
	private int point;
	private int totalPotint;
	
	// �� �ʱ�ȭ
	public void initSaleTotal() {
		this.salePrice = (int) (this.bookPrice * (1 - this.bookDiscount));
		this.totalPrice = this.salePrice * this.bookCount;
		this.point = (int) (Math.floor(this.salePrice * 0.05));
		this.totalPotint = this.point * this.bookCount;
	}
}
