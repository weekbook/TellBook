package com.myport.mapper;

import java.util.List;

import com.myport.domain.BookVO;
import com.myport.domain.CateFilterDTO;
import com.myport.domain.CateVO;
import com.myport.domain.Criteria;
import com.myport.domain.SelectDTO;

public interface BookMapper {

	/* 상품 검색 */
	public List<BookVO> getGoodsList(Criteria cri);
	
	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri);
	
	// 작가 id 리스트 요청
	public String[] getAuthorIdList(String keyword);
	
	/* 국내 카테고리 리스트 */
	public List<CateVO> getCateCode1();
	
	/* 외국 카테고리 리스트 */
	public List<CateVO> getCateCode2();
	
	/* 검색 대상 카테고리 리스트 */
	public String[] getCateList(Criteria cri);
	
	/* 카테고리 정보(+검색대상 갯수) */
	public CateFilterDTO getCateInfo(Criteria cri);
	
	// 상품 정보
	public BookVO getGoodsInfo(int bookId);
	
	// 상품 id 이름
	public BookVO getBookIdName(int bookId);
	
	// 평점순 상품 정보
	public List<SelectDTO> likeSelect();
	
	// 날짜순 상품 정보
	public List<SelectDTO> dateSelect();
	
	// 베스트셀러(구매횟수 + 평점) 상품 정보
	public List<SelectDTO> bestSelect();
	
	// 구매횟수 증가
	public int purchaseCount(int bookId);
	
	// 구매횟수 감소
	public int purchaseCountMinus(int bookId);
}
