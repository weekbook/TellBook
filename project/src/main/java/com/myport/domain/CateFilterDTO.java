package com.myport.domain;

import lombok.Data;

@Data
public class CateFilterDTO {
	
	// ī�װ� �̸�
	private String cateName;
	
	// ī�װ� �ѹ�
	private String cateCode;
	
	// ī�װ� ��ǰ ��
	private int cateCount;
	
	// ����, ���� �з�
	private String cateGroup;
	
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
		
		// ���� ù ��° ���ڰ� ����, ���ܸ� �����ϹǷ�, ���ڸ� �����Ͽ� ����
		this.cateGroup = cateCode.split("")[0];
	}
}
