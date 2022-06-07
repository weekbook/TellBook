package com.myport.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDTO {
	
	/* �ֹ� ��ȣ */
	private String orderId;
	
	/* ��� �޴��� */
	private String addressee;
	
	/* �ֹ� ȸ�� ���̵� */
	private String memberId;
	
	/* �����ȣ */
	private String memberAddr1;
	
	/* ȸ�� �ּ� */
	private String memberAddr2;
	
	/* ȸ�� ���ּ� */
	private String memberAddr3;
	
	/* �ֹ� ���� */
	private String orderState;
	
	/* �ֹ� ��ǰ */
	private List<OrderItemDTO> orders;	
	
	/* ��ۺ� */
	private int deliveryCost;
	
	/* ��� ����Ʈ */
	private int usePoint;
	
	/* �ֹ� ��¥ */
	private Date orderDate;
	
	/* DB���̺� ���� ���� �ʴ� ������ */
	
	/* �ǸŰ�(��� ��ǰ ���) */
	private int orderSalePrice;
	
	/* ���� ����Ʈ */
	private int orderSavePoint;
	
	/* ���� �Ǹ� ��� */
	private int orderFinalSalePrice;
	
	
	// �ֹ��۾� �ʿ� ������ ����
	public void getOrderPriceInfo() {
		// ��ǰ ���, ��������Ʈ
		for(OrderItemDTO order : orders) {
			orderSalePrice += order.getTotalPrice();
			orderSavePoint += order.getTotalSavePoint();
		}
		// ��ۺ��
		if (orderSalePrice >= 30000) {
			deliveryCost = 0;
		} else {
			deliveryCost = 3000;
		}
		// ���� ���(��ǰ ��� + ��ۺ� - ��� ����Ʈ)
		orderFinalSalePrice = orderSalePrice + deliveryCost - usePoint;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
