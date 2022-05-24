package com.myport.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class MemberVO implements Serializable {
	// Serializable : 클래스를 VO로 쓰기 위해 반드시 구현해야 하는 인터페이스
	
	private static final long serialVersionUID = 1L;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberMail;
	private String memberAddr1;
	private String memberAddr2;
	private String memberAddr3;
	private int adminCk;
	private int regDate;
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
