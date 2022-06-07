package com.myport.domain;

import lombok.Data;

@Data
public class OrderItemDTO {
	
	/* �ֹ� ��ȣ */
	private String orderId;
	
	/* ��ǰ ��ȣ */
    private int bookId;
    
	/* �ֹ� ���� */
    private int bookCount;
    
	/* book_orderItem �⺻Ű */
    private int orderItemId;
    
	/* ��ǰ �� �� ���� */
    private int bookPrice;
    
	/* ��ǰ ���� �� */
    private double bookDiscount;
    
	/* ��ǰ �Ѱ� ���� �� ȹ�� ����Ʈ */
    private int savePoint;
    
	/* DB���̺� ���� ���� �ʴ� ������ */
	/* ���� ����� ���� */
    private int salePrice;
    
	/* �� ����(���� ����� ���� * �ֹ� ����) */
    private int totalPrice;
    
	/* �� ȹ�� ����Ʈ(��ǰ �Ѱ� ���� �� ȹ�� ����Ʈ * ����) */
    private int totalSavePoint;
    
    // �ʱ�ȭ
    public void initSaleTotal() {
		this.salePrice = (int) (this.bookPrice * (1-this.bookDiscount));
		this.totalPrice = this.salePrice*this.bookCount;
		this.savePoint = (int)(Math.floor(this.salePrice*0.05));
		this.totalSavePoint =this.savePoint * this.bookCount;
	}
}
