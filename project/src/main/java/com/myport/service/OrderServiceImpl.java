package com.myport.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.myport.domain.AttachImageVO;
import com.myport.domain.OrderPageItemDTO;
import com.myport.mapper.AttachMapper;
import com.myport.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService{
	
	private OrderMapper ordermapper;
	
	private AttachMapper attachMapper;

	@Override
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders) {
		
		List<OrderPageItemDTO> result = new ArrayList<OrderPageItemDTO>();
		
		for(OrderPageItemDTO ord : orders) {
			
			OrderPageItemDTO goodsInfo = ordermapper.getGoodsInfo(ord.getBookId());
			
			goodsInfo.setBookCount(ord.getBookCount());
			
			goodsInfo.initSaleTotal();
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(goodsInfo.getBookId());
			
			goodsInfo.setImageList(imageList);
			
			result.add(goodsInfo);
		}
		
		return result;
	}
	
	
}
