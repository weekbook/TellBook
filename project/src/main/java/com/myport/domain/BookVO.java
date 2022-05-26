package com.myport.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookVO {
	
	/* ��ǰ id */
	private int bookId;
	
	/* ��ǰ �̸� */
	private String bookName;
	
	/* �۰� id */
	private int authorId;
	
	/* �۰� �̸� */
	private String authorName;
	
	/* ������ */
	private String publeYear;
	
	/* ���ǻ� */
	private String publisher;
	
	/* ī�װ� �ڵ� */
	private String cateCode;
	
	/* ī�װ� �̸� */
	private String cateName;
	
	/* ��ǰ ���� */
	private int bookPrice;
	
	/* ��ǰ ��� */
	private int bookStock;
	
	/* ��ǰ ���η�(�����) */
	private double bookDiscount;
	
	/* ��ǰ �Ұ� */
	private String bookIntro;
	
	/* ��ǰ ���� */
	private String bookContents;
	
	/* ��� ��¥ */
	private Date regDate;
	
	/* ���� ��¥ */
	private Date updateDate;
}
