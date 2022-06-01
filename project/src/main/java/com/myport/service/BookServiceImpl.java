package com.myport.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.myport.domain.AttachImageVO;
import com.myport.domain.BookVO;
import com.myport.domain.Criteria;
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
}
