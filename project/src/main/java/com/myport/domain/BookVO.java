package com.myport.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookVO {
	
	/* 상품 id */
	private int bookId;
	
	/* 상품 이름 */
	private String bookName;
	
	/* 작가 id */
	private int authorId;
	
	/* 작가 이름 */
	private String authorName;
	
	/* 출판일 */
	private String publeYear;
	
	/* 출판사 */
	private String publisher;
	
	/* 카테고리 코드 */
	private String cateCode;
	
	/* 카테고리 이름 */
	private String cateName;
	
	/* 상품 가격 */
	private int bookPrice;
	
	/* 상품 재고 */
	private int bookStock;
	
	/* 상품 할인률(백분율) */
	private double bookDiscount;
	
	/* 상품 소개 */
	private String bookIntro;
	
	/* 상품 목차 */
	private String bookContents;
	
	/* 등록 날짜 */
	private Date regDate;
	
	/* 수정 날짜 */
	private Date updateDate;
}
