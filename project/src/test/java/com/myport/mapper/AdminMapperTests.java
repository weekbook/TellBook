package com.myport.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myport.domain.Criteria;
import com.myport.domain.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {
	
	@Autowired
	private AdminMapper mapper;
	
	/* 상품 등록 */
//	@Test
//	public void bookEnrollTest() throws Exception{
//		
//		BookVO book = new BookVO();
//		
//		book.setBookName("mapper 테스트");
//		book.setAuthorId(601);
//		book.setPubleYear("2022-05-18");
//		book.setPublisher("출판사");
//		book.setCateCode("0231");
//		book.setBookPrice(104001);
//		book.setBookStock(300);
//		book.setBookDiscount(0.23);
//		book.setBookIntro("책 소개 ");
//		book.setBookContents("책 목차 ");
//		
//		System.out.println("Before" + book);
//		
//		mapper.bookEnroll(book);
//		
//		System.out.println("After BookVo" + book);
//	}
	
	
	// 카테고리 테스트
//	@Test
//	public void cateListTest() throws Exception{
//		System.out.println("cateList().." + mapper.cateList());
//	}
	
	// 상품 리스트, 상품 총 갯수
//	@Test
//	public void goodsGetListTest() {
//		Criteria cri = new Criteria();
//		
//		// 검색 조건
//		cri.setKeyword("두르");
//		
//		// 검색 리스트
//		List<BookVO> list = mapper.goodsGetList(cri);
//		for (int i = 0; i < list.size(); i++) {
//			System.out.println("result....." + i + " : " + list.get(i));
//		}
//		
//		// 상품 총 갯수
//		int result = mapper.goodsGetTotal(cri);
//		System.out.println("resultTotal" + result);
//	}
	
	// 상품 조회
//	@Test
//	public void goodsGetDetailTest() {
//		int bookId = 45;
//		BookVO result = mapper.goodsGetDetail(bookId);
//		System.out.println("상품 조회 " + result);
//	}
	
	
	/* 상품 정보 수정 */
//	@Test
//	public void goodsModifyTest() {
//		
//		BookVO book = new BookVO();
//		
//		book.setBookId(21);
//		book.setBookName("mapper 테스트");
//		book.setAuthorId(609);
//		book.setPubleYear("2021-03-18");
//		book.setPublisher("출판사");
//		book.setCateCode("103002");
//		book.setBookPrice(20000);
//		book.setBookStock(300);
//		book.setBookDiscount(0.23);
//		book.setBookIntro("책 소개 ");
//		book.setBookContents("책 목차 ");
//		
//		mapper.goodsModify(book);
//		
//	}
	
	// 상품 삭제
//	@Test
//	public void goodsDeleteTest() {
//		int bookId = 21;
//		int result = mapper.goodsDelete(bookId);
//		if(result == 1) {
//			System.out.println("삭제 성공");
//		}
//	}
	
	// 이미지 등록
//	@Test
//	public void imageEnrollTer() {
//		AttachImageVO vo = new AttachImageVO();
//		
//		vo.setBookId(137);
//		vo.setFileName("test");
//		vo.setUploadPath("test");
//		vo.setUuid("test2");
//		
//		mapper.imageEnroll(vo);
//	}
	
	/* 지정 상품 이미지 삭제 */
//	@Test
//	public void deleteImageAllTest() {
//		
//		int bookId = 237;
//		
//		mapper.deleteImageAll(bookId);
//		
//	}
	
	/* 어제자 날짜 이미지 리스트 */
//	@Test
//	public void checkImageListTest() {
//		
//		mapper.checkFileList();
//		
//	}
	
	/* 지정 상품 이미지 정보 얻기 */
//	@Test
//	public void getAttachInfoTest() {
//		
//		int bookId = 242;
//		
//		List<AttachImageVO> list = mapper.getAttachInfo(bookId);
//		
//		System.out.println("list : " + list);
//		
//	}
//	// 검색 조건
//	cri.setKeyword("두르");
//	
//	// 검색 리스트
//	List<BookVO> list = mapper.goodsGetList(cri);
//	for (int i = 0; i < list.size(); i++) {
//		System.out.println("result....." + i + " : " + list.get(i));
//	}
//	
//	// 상품 총 갯수
//	int result = mapper.goodsGetTotal(cri);
//	System.out.println("resultTotal" + result);
	
	// 멤버 조회
//	@Test
//	public void getMemberList() {
//		
//		Criteria cri = new Criteria();
//
//		List<MemberVO> list = mapper.getMemberList(cri);
//		for(MemberVO lists : list) {
//			System.out.println("result...." + lists);
//		}
//		
//		int result = mapper.getMemberTotal(cri);
//		System.out.println("total : " + result);
//	}
	
	@Test
	public void memberDetail() {
		MemberVO member = new MemberVO();
		member.setMemberId("admin");
		
		MemberVO list = mapper.memberDetail(member.getMemberId());
		
		System.out.println(list);
	}
}


