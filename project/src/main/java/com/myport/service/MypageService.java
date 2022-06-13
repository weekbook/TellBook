package com.myport.service;

import java.util.List;

import com.myport.domain.Criteria;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderDTO;

import lombok.AllArgsConstructor;

public interface MypageService {

	// �ֹ� ��ǰ ����Ʈ
	public List<OrderDTO> getMyOrderList(Criteria cri);

	// �ֹ� �� ����
	public int getMyOrderTotal(Criteria cri);
	
	// ȸ�� �������� ��ȸ
	public MemberVO memberPersonalDetail(String memberId);
}
