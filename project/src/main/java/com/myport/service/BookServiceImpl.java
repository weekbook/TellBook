package com.myport.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.myport.domain.AttachImageVO;
import com.myport.domain.BookVO;
import com.myport.domain.CateFilterDTO;
import com.myport.domain.CateVO;
import com.myport.domain.Criteria;
import com.myport.mapper.AdminMapper;
import com.myport.mapper.AttachMapper;
import com.myport.mapper.BookMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BookServiceImpl implements BookService {

	private BookMapper bookMapper;

	private AttachMapper attachMapper;
	
	private AdminMapper adminMapper;

	// »óÇ° °Ë»ö
	@Override
	public List<BookVO> getGoodsList(Criteria cri) {
		log.info("getGoodsList().......");

		String type = cri.getType();
		String[] typeArr = type.split("");
		String[] authorArr = bookMapper.getAuthorIdList(cri.getKeyword());

		log.info("authorArr : " + authorArr);

		if (type.equals("A") || type.equals("AC") || type.equals("AT") || type.equals("ACT")) {
			if (authorArr.length == 0) {
				return new ArrayList<BookVO>();
			}
		}

		for (String t : typeArr) {
			if (t.equals("A")) {
				cri.setAuthorArr(authorArr);
			}
		}

		List<BookVO> list = bookMapper.getGoodsList(cri);

		list.forEach(book -> {
			int bookId = book.getBookId();

			List<AttachImageVO> imageList = attachMapper.getAttachList(bookId);

			book.setImageList(imageList);
		});

		return list;
	}

	// »óÇ° ÃÑ °¹¼ö
	@Override
	public int goodsGetTotal(Criteria cri) {
		log.info("getGoodsTotal");
		return bookMapper.goodsGetTotal(cri);
	}

	@Override
	public List<CateVO> getCateCode1() {
		log.info("getCateCode");
		return bookMapper.getCateCode1();
	}

	@Override
	public List<CateVO> getCateCode2() {
		log.info("getCateCode2");
		return bookMapper.getCateCode2();
	}

	@Override
	public List<CateFilterDTO> getCateInfoList(Criteria cri) {
		log.info("getCateInfoList..");
		List<CateFilterDTO> filterInfoList = new ArrayList<CateFilterDTO>();

		String[] typeArr = cri.getType().split("");
		String[] authorArr;

		for (String type : typeArr) {
			if (type.equals("A")) {
				authorArr = bookMapper.getAuthorIdList(cri.getKeyword());
				if(authorArr.length == 0) {
					return filterInfoList;
				}
				cri.setAuthorArr(authorArr);
			}
		}

		String[] cateList = bookMapper.getCateList(cri);

		String tempCateCode = cri.getCateCode();

		for (String cateCode : cateList) {
			cri.setCateCode(cateCode);
			CateFilterDTO filterInfo = bookMapper.getCateInfo(cri);
			filterInfoList.add(filterInfo);
		}

		cri.setCateCode(tempCateCode);

		return filterInfoList;
	}

	@Override
	public BookVO getGoodsInfo(int bookId) {
		BookVO goodsInfo = bookMapper.getGoodsInfo(bookId);
		goodsInfo.setImageList(adminMapper.getAttachInfo(bookId));
		
		return goodsInfo;
	}
}
