package com.myport.service;

import java.util.List;

import com.myport.domain.OrderCancleDTO;
import com.myport.domain.OrderDTO;
import com.myport.domain.OrderPageItemDTO;

public interface OrderService {
	
	// 주문 정보
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders);
	
	// 주문
	public void order(OrderDTO od);
	
	// 주문 취소
	public void orderCancle(OrderCancleDTO dto);
	
}
