package com.myport.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum; // 현재 페이지
	private int amount; // 한 페이지에 보여지는 페이징 개수
	
	private String type; // 검색 타입(내용, 제목, 작성자)
	private String keyword; // 검색어(검색 키워드)
	
	private String[] authorArr; // 작가 리스트
	private String cateCode; // 카테고리 코드
	
	private int bookId; // 상품번호 (댓글기능)
	
	public Criteria() { // 페이징 디폴트값
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) { // 달라지는 값
		this.pageNum = pageNum;
		this.amount = amount;
	}

	// 검색 타입 널: 비어있는 문자열 배열 생성
	// 검색 타입 널X: 한 글자씩 잘라서 문자열 배열(split 이용)
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}

	// hidden값 처리
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("").queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount()).queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());

		return builder.toUriString();
	}
}
