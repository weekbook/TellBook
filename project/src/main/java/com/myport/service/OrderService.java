package com.myport.service;

import java.util.List;

import com.myport.domain.OrderPageItemDTO;

public interface OrderService {
	
	// �ֹ� ����
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders);
}
