package com.myport.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myport.domain.BookVO;
import com.myport.domain.Criteria;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderDTO;
import com.myport.domain.OrderInfoDTO;
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
	
//	@Override
//	public List<BookVO> getMyOrderProductName(String memberId, String orderId) {
//		return mypageMapper.getMyOrderProductName(memberId, orderId);
//	}

	@Override
	public int getMyOrderTotal(Criteria cri) {
		return mypageMapper.getMyOrderTotal(cri);
	}

	@Override
	public MemberVO memberPersonalDetail(String memberId) {
		return mypageMapper.memberPersonalDetail(memberId);
	}

	@Override
	public int emailModify(MemberVO vo) {
		return mypageMapper.emailModify(vo);
	}

	@Override
	public int addressModify(MemberVO vo) {
		return mypageMapper.addressModify(vo);
	}

	@Override
	public int passwordModify(MemberVO vo) {
		return mypageMapper.passwordModify(vo);
	}

	@Override
	public int memeberDelete(String memberId) {
		return mypageMapper.memberDelete(memberId);
	}

	@Override
	public List<OrderInfoDTO> gerOrderInfo(String orderId) {
		return mypageMapper.gerOrderInfo(orderId);
	}
	
}
