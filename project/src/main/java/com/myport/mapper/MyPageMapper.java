package com.myport.mapper;

import java.util.List;

import com.myport.domain.Criteria;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderDTO;

public interface MyPageMapper {

	// �ֹ� ��ǰ ����Ʈ
	public List<OrderDTO> getMyOrderList(Criteria cri);

	// �ֹ� �� ����
	public int getMyOrderTotal(Criteria cri);
	
	// ȸ�� �������� ��ȸ
	public MemberVO memberPersonalDetail(String memberId);
	
	// �̸��� ����
	public int emailModify(MemberVO vo);
	
	// �ּ� ����
	public int addressModify(MemberVO vo);
	
	// ��й�ȣ ����
	public int passwordModify(MemberVO vo);
	
}
