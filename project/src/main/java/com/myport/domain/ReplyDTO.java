package com.myport.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

import lombok.Data;

@Data
public class ReplyDTO {
	
	private int replyId;
	
	private int bookId;
	
	private String memberId;

	// Date, LocalDateTime 타입의 데이터를 json으로 변환할 경우 "yyyy-MM-dd"형식으로 변환안됨, 따라서 어노테이션으로 어떤형식으로 할지 지정해주면 해결
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date regDate;
	
	private String content;
	
	private double rating;
	
	
}
