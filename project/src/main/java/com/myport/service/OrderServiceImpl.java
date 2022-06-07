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
		// ȸ�� ����
		MemberVO member = memberMapper.getMemberInfo(od.getMemberId());
		// �ֹ� ����
		List<OrderItemDTO> ords = new ArrayList<>();
		for(OrderItemDTO oit : od.getOrders()) {
			OrderItemDTO orderItem = ordermapper.getOrderInfo(oit.getBookId());
			// ���� ����
			orderItem.setBookCount(oit.getBookCount());
			// �⺻ ���� ����
			orderItem.initSaleTotal();
			// list��ü �߰�
			ords.add(orderItem);
		}
		// OrderDTO ����
		od.setOrders(ords);
		od.getOrderPriceInfo();
		
		/* DB �ֹ�, �ֹ���ǰ, ������� �ֱ� */
		// orderID ����� �� orderDTO ��ü orderID�� ����
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderId = member.getMemberId() + format.format(date);
		od.setOrderId(orderId);
		
		// db�ֱ�
		ordermapper.enrollOrder(od); // book_order ���
		for(OrderItemDTO oit : od.getOrders()) { // book_orderItem ���
			oit.setOrderId(orderId);
			ordermapper.enrollOrderItem(oit);
		}
		
		/* ����Ʈ ���� ���� */
		// money ����
		int calMoney = member.getMoney();
		calMoney -= od.getOrderFinalSalePrice();
		member.setMoney(calMoney);
		
		// point ����
		int calPoint = member.getPoint();
		calPoint = calPoint - od.getUsePoint() + od.getOrderSavePoint();
		member.setPoint(calPoint);
		
		// ���� db ����
		ordermapper.updateMoney(member);
		
		/* ��� ���� ���� */
		for(OrderItemDTO oit : od.getOrders()) {
			// ���� ��� �� ���ϱ�
			BookVO book = bookMapper.getGoodsInfo(oit.getBookId());
			book.setBookStock(book.getBookStock() - oit.getBookCount());
			// db ����
			ordermapper.updateStock(book);
		}
		
		/* ��ٱ��Ͽ��� ���� */
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
		// ȸ��
		MemberVO member = memberMapper.getMemberInfo(dto.getMemberId());
		// �ֹ���ǰ
		List<OrderItemDTO> ords = ordermapper.getOrderItemInfo(dto.getOrderId());
		for(OrderItemDTO ord : ords) {
			ord.initSaleTotal();
		}
		// �ֹ�
		OrderDTO orw = ordermapper.getOrder(dto.getOrderId());
		orw.setOrders(ords);
		
		orw.getOrderPriceInfo();
		
		// �ֹ���ǰ ��� DB
		ordermapper.orderCancle(dto.getOrderId());
		
		// ��, ����Ʈ, ��� ��ȯ
		int calMoney = member.getMoney();
		calMoney += orw.getOrderFinalSalePrice();
		member.setMoney(calMoney);
		
		int calPoint = member.getPoint();
		calPoint += orw.getUsePoint() - orw.getOrderSavePoint();
		member.setPoint(calPoint);
		
		// DB ����
		ordermapper.updateMoney(member);
		
		// ���
		for(OrderItemDTO ord : orw.getOrders()) {
			BookVO book = bookMapper.getGoodsInfo(ord.getBookId());
			book.setBookStock(book.getBookStock() + ord.getBookCount());
			ordermapper.updateStock(book);
		}
	}
	
	
	
	
	
	
	
	
	
}
