package com.myport.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {
	
	private int replyId;
	
	private int bookId;
	
	private String memberId;

	private Date regDate;
	
	private String content;
	
	private double rating;
}
