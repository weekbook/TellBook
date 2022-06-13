package com.myport.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myport.domain.Criteria;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderDTO;
import com.myport.mapper.MyPageMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MyPageServiceImpl implements MypageService {
	
	private MyPageMapper mypageMapper;
	
	@Override
	public List<OrderDTO> getMyOrderList(Criteria cri) {
		return mypageMapper.getMyOrderList(cri);
	}

	@Override
	public int getMyOrderTotal(Criteria cri) {
		return mypageMapper.getMyOrderTotal(cri);
	}

	@Override
	public MemberVO memberPersonalDetail(String memberId) {
		return mypageMapper.memberPersonalDetail(memberId);
	}

	
}
