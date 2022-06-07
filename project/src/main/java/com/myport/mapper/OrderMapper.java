package com.myport.mapper;

import java.util.List;

import com.myport.domain.BookVO;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderDTO;
import com.myport.domain.OrderItemDTO;
import com.myport.domain.OrderPageItemDTO;

public interface OrderMapper {

	// �ֹ� ��ǰ ����
	public OrderPageItemDTO getGoodsInfo(int bookId);
	
	// �ֹ� ��ǰ ����(�ֹ� ó��)
	public OrderItemDTO getOrderInfo(int bookId);
	
	// �ֹ� ���̺� ���
	public int enrollOrder(OrderDTO ord);
	
	// �ֹ� ������ ���̺� ���
	public int enrollOrderItem(OrderItemDTO orid);
	
	// �ֹ� �ݾ� ����
	public int updateMoney(MemberVO member);
	
	// �ֹ� ��� ����
	public int updateStock(BookVO book);
	
	// �ֹ� ���
	public int orderCancle(String orderId);
	
	// �ֹ� ��ǰ ����(�ֹ����)
	public List<OrderItemDTO> getOrderItemInfo(String orderId);
	
	// �ֹ� ����(�ֹ����)
	public OrderDTO getOrder(String orderId);
	
}
