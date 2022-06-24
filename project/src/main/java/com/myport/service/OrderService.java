package com.myport.service;

import java.util.List;

import com.myport.domain.OrderCancleDTO;
import com.myport.domain.OrderDTO;
import com.myport.domain.OrderPageItemDTO;

public interface OrderService {
	
	// �ֹ� ����
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders);
	
	// �ֹ�
	public void order(OrderDTO od);
	
	// �ֹ� ���
	public void orderCancle(OrderCancleDTO dto);
	
}
