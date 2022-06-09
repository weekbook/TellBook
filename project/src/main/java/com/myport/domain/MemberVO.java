package com.myport.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class MemberVO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberMail;
	private String memberAddr1;
	private String memberAddr2;
	private String memberAddr3;
	private int adminCk;
	private Date regDate; // 6월 9일 int를 Date로 변경
	private int money;
	private int point;
	
	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", memberMail=" + memberMail + ", memberAddr1=" + memberAddr1 + ", memberAddr2=" + memberAddr2
				+ ", memberAddr3=" + memberAddr3 + ", adminCk=" + adminCk + ", regDate=" + regDate + ", money=" + money
				+ ", point=" + point + "]";
	}
	
	
}
