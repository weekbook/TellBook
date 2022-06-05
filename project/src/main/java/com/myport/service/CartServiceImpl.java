package com.myport.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myport.domain.AttachImageVO;
import com.myport.domain.CartDTO;
import com.myport.mapper.AttachMapper;
import com.myport.mapper.CartMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CartServiceImpl implements CartService {
	
	private CartMapper cartMapper;
	
	private AttachMapper attachMapper;
	
	
	@Override
	public int addCart(CartDTO cart) {
		
		// ��ٱ��� ������ üũ
		CartDTO checkCart = cartMapper.checkCart(cart);
		
		if(checkCart != null) {
			return 2;
		}
		
		try {
			return cartMapper.addCart(cart);
		} catch (Exception e) {
			return 0;
		}
	}


	@Override
	public List<CartDTO> getCartList(String memberId) {
		List<CartDTO> cart = cartMapper.getCart(memberId);
		
		for(CartDTO dto : cart) {
			
			// ���� ���� �ʱ�ȭ
			dto.initSaleTotal();
			
			// �̹��� ���� ���
			int bookId = dto.getBookId();
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(bookId);
			
			dto.setImageList(imageList);
		}
		return cart;
	}


	@Override
	public int modifyCount(CartDTO cart) {
		
		return cartMapper.modifyCount(cart);
	}


	@Override
	public int deleteCart(int cartId) {
		
		return cartMapper.deleteCart(cartId);
	}

}
