package com.myport.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class SelectDTO {
	
	/* 상품 id */
	private int bookId;
	
	/* 상품 이름 */
	private String bookName;
	
	/* 카테고리 이름 */
	private String cateName;
	
	private double ratingAvg;
	
	/* 등록 날짜 */
	private Date regDate;
	
	// 구매횟수
	private int purchaseCount;
	
	/* 상품 이미지 */
	private List<AttachImageVO> imageList;
}
