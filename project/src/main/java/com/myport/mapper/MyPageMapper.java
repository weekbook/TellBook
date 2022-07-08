package com.myport.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myport.domain.BookVO;
import com.myport.domain.Criteria;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderDTO;
import com.myport.domain.OrderInfoDTO;

public interface MyPageMapper {

	// �ֹ� ��ǰ ����Ʈ
	public List<OrderDTO> getMyOrderList(Criteria cri);

	// �ֹ� ��
	public List<OrderInfoDTO> gerOrderInfo(String orderId);

	// �ֹ� ��ǰ�� ���
	public List<String> getMyOrderProductName(@Param("memberId") String memberId, @Param("orderId") String orderId);

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

	// ȸ�� Ż��
	public int memberDelete(String memberId);

}
