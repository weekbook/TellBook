package com.myport.domain;

import lombok.Data;

@Data
public class AttachImageVO {
	
	private String uploadPath;
	
	private String uuid;
	
	private String fileName;
	
	private int bookId;
}
