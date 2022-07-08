package com.myport.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderInfoDTO {
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
	
	/* ��ۺ� */
	private int deliveryCost;
	
	/* ��� ����Ʈ */
	private int usePoint;
	
	// ���� ����Ʈ
	private int savePoint;
	
	/* �ֹ� ��¥ */
	private Date orderDate;
	
	/* DB���̺� ���� ���� �ʴ� ������ */
	
	// �ֹ��� å �̸�
	private String bookName;
	
	// ���η�
	private double bookDiscount;
	
	// å ����
	private int bookPrice;
	
	// �ֹ� ����
	private int bookCount;
	
	// å ID
	private int bookId;
}
