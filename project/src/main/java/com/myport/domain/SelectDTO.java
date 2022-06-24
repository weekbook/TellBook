package com.myport.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class SelectDTO {
	
	/* ��ǰ id */
	private int bookId;
	
	/* ��ǰ �̸� */
	private String bookName;
	
	/* ī�װ� �̸� */
	private String cateName;
	
	private double ratingAvg;
	
	/* ��� ��¥ */
	private Date regDate;
	
	// ����Ƚ��
	private int purchaseCount;
	
	/* ��ǰ �̹��� */
	private List<AttachImageVO> imageList;
}
