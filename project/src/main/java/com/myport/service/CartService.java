package com.myport.service;

import java.util.List;

import com.myport.domain.CartDTO;

public interface CartService {

	// ��ٱ��� �߰�
	public int addCart(CartDTO cart);
	
	// ��ٱ��� ���� ����Ʈ
	public List<CartDTO> getCartList(String memberId);
}
