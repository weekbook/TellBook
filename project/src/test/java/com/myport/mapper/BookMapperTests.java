package com.myport.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myport.domain.BookVO;
import com.myport.domain.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BookMapperTests {
	
	@Autowired
	private BookMapper mapper;
	
//	@Test
//	public void getGoodsListTest() {
//		
//		Criteria cri = new Criteria();
//		// 테스트 키워드
//		// cri.setKeyword("test");
//		System.out.println("cri : " + cri);
//		
//		List<BookVO> list = mapper.getGoodsList(cri);
//		System.out.println("list : " + list);
//		
//		System.out.println("=============");
//		int goodsTotal = mapper.goodsGetTotal(cri);
//		System.out.println("total" + goodsTotal);
//	}
	
	//작가 id 리스트 요청
//	@Test
//	public void getAuthorId() {
//		String keyword = "김";
//		String[] list = mapper.getAuthorIdList(keyword);
//		System.out.println("결과 : " + list.toString());
//		for(String id : list) {
//			System.out.println("개별 결과 " + id);
//		}
//	}
	
	/* 검색 (동적 쿼리 적용) - 작가*/
//	@Test 
//	public void getGoodsListTest1() {
//		//
//		Criteria cri = new Criteria();
//		String type = "A";
//		//String keyword = "수정123";		// DB에 등록된 작가 데이터
//		String keyword = "없음";		// DB에 등록된 작가 데이터
//		String catecode = "";
//		
//		cri.setType(type);
//		cri.setKeyword(keyword);
//		cri.setAuthorArr(mapper.getAuthorIdList(keyword));
//		cri.setCateCode(catecode);
//		
//		List<BookVO> list = mapper.getGoodsList(cri);
//		
//		System.out.println("cri : " + cri);
//		System.out.println("list : " + list);
//		
//	}
	
	
	/* 검색 (동적 쿼리 적용) - 책제목*/
//	@Test 
//	public void getGoodsListTest2() {
//		Criteria cri = new Criteria();
//		String type = "T";
//		String keyword = "두르";			// 테이블에 등록된 책 제목 데이터
//		// String keyword = "없음";				// 테이블에 등록되지 않은 데이터
//		String catecode = "";	
//		
//		cri.setType(type);
//		cri.setKeyword(keyword);
//		cri.setAuthorArr(mapper.getAuthorIdList(keyword));
//		cri.setCateCode(catecode);
//		
//		List<BookVO> list = mapper.getGoodsList(cri);
//		
//		System.out.println("cri : " + cri);
//		System.out.println("list : " + list);
//		
//	}
//	
	
	/* 검색 (동적 쿼리 적용) - 카테고리*/
//	@Test 
//	public void getGoodsListTest3() {
//		Criteria cri = new Criteria();
//		String type = "C";
//		String keyword = "";
//		String catecode = "202002";		
//		
//		cri.setType(type);
//		cri.setKeyword(keyword);
//		cri.setAuthorArr(mapper.getAuthorIdList(keyword));
//		cri.setCateCode(catecode);
//		
//		List<BookVO> list = mapper.getGoodsList(cri);
//		
//		System.out.println("cri : " + cri);
//		System.out.println("list : " + list);
//	}
	
	
	
	/* 검색 (동적 쿼리 적용) - 카테고리 + 작가 */
//	@Test 
//	public void getGoodsListTest4() {
//		Criteria cri = new Criteria();
//		String type = "AC";
//		//String keyword = "수정123";	// 카테고리에 존재하는 작가
//		String keyword = "머스크";	// 카테고리에 존재하지 않는 작가
//		String catecode = "202002";
//		
//		cri.setType(type);
//		cri.setKeyword(keyword);
//		cri.setAuthorArr(mapper.getAuthorIdList(keyword));
//		cri.setCateCode(catecode);
//		
//		List<BookVO> list = mapper.getGoodsList(cri);
//		
//		System.out.println("cri : " + cri);
//		System.out.println("list : " + list);	
//		
//	}
	
	
	
	
	/* 검색 (동적 쿼리 적용) - 카테고리 + 책 제목 */
//	@Test 
//	public void getGoodsListTest5() {
//		Criteria cri = new Criteria();
//		String type = "CT";			// 카테고리에 존재하는 책
//		String keyword = "테스트";	// 카테고리에 존재하지 않는 책
//		//String keyword = "없음";
//		String catecode = "202002";
//		
//		cri.setType(type);
//		cri.setKeyword(keyword);
//		cri.setAuthorArr(mapper.getAuthorIdList(keyword));
//		cri.setCateCode(catecode);
//		
//		List<BookVO> list = mapper.getGoodsList(cri);
//		
//		System.out.println("cri : " + cri);
//		System.out.println("list : " + list);	
//		
//	}
	
	
	/* 카테고리 리스트 */
//	@Test
//	public void getCateListTest1() {
//		
//		Criteria cri = new Criteria();
//		
//		String type = "TC";
//		String keyword = "셜록";
//		//String type = "A";
//		//String keyword = "유홍준";		
//
//		cri.setType(type);
//		cri.setKeyword(keyword);
//		//cri.setAuthorArr(mapper.getAuthorIdList(keyword));		
//		
//		String[] cateList = mapper.getCateList(cri)		;
//		for(String codeNum : cateList) {
//			System.out.println("codeNum ::::: " + codeNum);
//		}
//		
//		
//	}
	
	
	/* 카테고리 정보 얻기 */	
//	@Test
//	public void getCateInfoTest1() {
//		
//		Criteria cri = new Criteria();
//		
//		String type = "TC";
//		String keyword = "셜록";	
//		String cateCode="201001";
//
//		cri.setType(type);
//		cri.setKeyword(keyword);
//		cri.setCateCode(cateCode);
//		
//		mapper.getCateInfo(cri);
//		
//	}
	
	// 상품 정보
	@Test
	public void getGoodsInfo() {
		int bookId = 26;
		BookVO goodsInfo = mapper.getGoodsInfo(bookId);
		System.out.println("=====================");
		System.out.println(goodsInfo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
