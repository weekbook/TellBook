package com.myport.domain;

import lombok.Data;

@Data
public class OrderCancleDTO {
	
	// �ֹ� ��� ��ɿ� �ʿ� ����
	private String memberId;
	private String orderId;
	
	// �����̷�Ʈ�� �ʿ��� ������ ����
	private String keyword;
	private String amount;
	private String pageNum;
	
}
