package com.myport.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	
	private Long bId;
	
	private String bName;
	
	private String bTitle;
	
	private String bContent;
	
	private Date bDate;
	
	private String bType;
	
	private int bGroup;
	
	private int bStep;
	
	private int bIndent;
	
	private String memberId;
	
	public QnaVO() {
		
	}
}
