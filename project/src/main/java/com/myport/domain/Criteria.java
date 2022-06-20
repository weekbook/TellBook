package com.myport.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum; // ���� ������
	private int amount; // �� �������� �������� ����¡ ����
	
	private String type; // �˻� Ÿ��(����, ����, �ۼ���)
	private String keyword; // �˻���(�˻� Ű����)
	
	private String[] authorArr; // �۰� ����Ʈ
	private String cateCode; // ī�װ� �ڵ�
	
	private int bookId; // ��ǰ��ȣ (��۱��)
	
	public Criteria() { // ����¡ ����Ʈ��
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) { // �޶����� ��
		this.pageNum = pageNum;
		this.amount = amount;
	}

	// �˻� Ÿ�� ��: ����ִ� ���ڿ� �迭 ����
	// �˻� Ÿ�� ��X: �� ���ھ� �߶� ���ڿ� �迭(split �̿�)
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}

	// hidden�� ó��
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("").queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount()).queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());

		return builder.toUriString();
	}
}
