package com.myport.service;

import java.util.List;

import com.myport.domain.OrderPageItemDTO;

public interface OrderService {
	
	// 주문 정보
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders);
}
