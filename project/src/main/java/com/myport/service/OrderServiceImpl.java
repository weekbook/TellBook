package com.myport.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myport.domain.AttachImageVO;
import com.myport.domain.BookVO;
import com.myport.domain.CartDTO;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderCancleDTO;
import com.myport.domain.OrderDTO;
import com.myport.domain.OrderItemDTO;
import com.myport.domain.OrderPageItemDTO;
import com.myport.mapper.AttachMapper;
import com.myport.mapper.BookMapper;
import com.myport.mapper.CartMapper;
import com.myport.mapper.MemberMapper;
import com.myport.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService{
	
	private OrderMapper ordermapper;
	
	private AttachMapper attachMapper;
	
	private MemberMapper memberMapper;
	
	private CartMapper cartMapper;
	
	private BookMapper bookMapper;

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

	@Transactional
	@Override
	public void order(OrderDTO od) {
		// 회원 정보
		MemberVO member = memberMapper.getMemberInfo(od.getMemberId());
		// 주문 정보
		List<OrderItemDTO> ords = new ArrayList<>();
		for(OrderItemDTO oit : od.getOrders()) {
			OrderItemDTO orderItem = ordermapper.getOrderInfo(oit.getBookId());
			// 수량 셋팅
			orderItem.setBookCount(oit.getBookCount());
			// 기본 정보 셋팅
			orderItem.initSaleTotal();
			// list객체 추가
			ords.add(orderItem);
		}
		// OrderDTO 셋팅
		od.setOrders(ords);
		od.getOrderPriceInfo();
		
		/* DB 주문, 주문상품, 배송정보 넣기 */
		// orderID 만들기 및 orderDTO 객체 orderID에 저장
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderId = member.getMemberId() + format.format(date);
		od.setOrderId(orderId);
		
		// db넣기
		ordermapper.enrollOrder(od); // book_order 등록
		for(OrderItemDTO oit : od.getOrders()) { // book_orderItem 등록
			oit.setOrderId(orderId);
			ordermapper.enrollOrderItem(oit);
		}
		
		/* 포인트 변동 적용 */
		// money 변경
		int calMoney = member.getMoney();
		calMoney -= od.getOrderFinalSalePrice();
		member.setMoney(calMoney);
		
		// point 변경
		int calPoint = member.getPoint();
		calPoint = calPoint - od.getUsePoint() + od.getOrderSavePoint();
		member.setPoint(calPoint);
		
		// 변동 db 적용
		ordermapper.updateMoney(member);
		
		/* 재고 변동 적용 */
		for(OrderItemDTO oit : od.getOrders()) {
			// 변동 재고 값 구하기
			BookVO book = bookMapper.getGoodsInfo(oit.getBookId());
			book.setBookStock(book.getBookStock() - oit.getBookCount());
			// db 적용
			ordermapper.updateStock(book);
		}
		
		/* 장바구니에서 제거 */
		for(OrderItemDTO oit : od.getOrders()) {
			CartDTO dto = new CartDTO();
			dto.setMemberId(od.getMemberId());
			dto.setBookId(oit.getBookId());
			
			cartMapper.deleteOrderCart(dto);
		}
	}

	@Override
	@Transactional
	public void orderCancle(OrderCancleDTO dto) {
		// 회원
		MemberVO member = memberMapper.getMemberInfo(dto.getMemberId());
		// 주문상품
		List<OrderItemDTO> ords = ordermapper.getOrderItemInfo(dto.getOrderId());
		for(OrderItemDTO ord : ords) {
			ord.initSaleTotal();
		}
		// 주문
		OrderDTO orw = ordermapper.getOrder(dto.getOrderId());
		orw.setOrders(ords);
		
		orw.getOrderPriceInfo();
		
		// 주문상품 취소 DB
		ordermapper.orderCancle(dto.getOrderId());
		
		// 돈, 포인트, 재고 변환
		int calMoney = member.getMoney();
		calMoney += orw.getOrderFinalSalePrice();
		member.setMoney(calMoney);
		
		int calPoint = member.getPoint();
		calPoint += orw.getUsePoint() - orw.getOrderSavePoint();
		member.setPoint(calPoint);
		
		// DB 적용
		ordermapper.updateMoney(member);
		
		// 재고
		for(OrderItemDTO ord : orw.getOrders()) {
			BookVO book = bookMapper.getGoodsInfo(ord.getBookId());
			book.setBookStock(book.getBookStock() + ord.getBookCount());
			ordermapper.updateStock(book);
		}
	}
	
	
	
	
	
	
	
	
	
}
