package com.myport.mapper;

import com.myport.domain.OrderPageItemDTO;

public interface OrderMapper {

	// 주문 상품 정보
	public OrderPageItemDTO getGoodsInfo(int bookId);
}
