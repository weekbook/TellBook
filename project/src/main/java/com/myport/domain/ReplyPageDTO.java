package com.myport.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
public class ReplyPageDTO {
//	private int replyTotalCnt;
	private List<ReplyDTO> list;
	
	PageDTO pageInfo;
}
