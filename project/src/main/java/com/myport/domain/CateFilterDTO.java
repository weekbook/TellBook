package com.myport.domain;

import lombok.Data;

@Data
public class CateFilterDTO {
	
	// 카테고리 이름
	private String cateName;
	
	// 카테고리 넘버
	private String cateCode;
	
	// 카테고리 상품 수
	private int cateCount;
	
	// 국내, 국외 분류
	private String cateGroup;
	
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
		
		// 제일 첫 번째 숫자가 국내, 국외를 구분하므로, 숫자를 추출하여 저장
		this.cateGroup = cateCode.split("")[0];
	}
}
