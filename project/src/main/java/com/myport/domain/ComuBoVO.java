package com.myport.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ComuBoVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	private int views;
	private int replyCnt;
}
