package com.myport.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myport.domain.AttachImageVO;
import com.myport.domain.BookVO;
import com.myport.domain.Criteria;
import com.myport.domain.PageDTO;
import com.myport.mapper.AttachMapper;
import com.myport.service.BookService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class BookController {

	private AttachMapper attachMapper;

	private BookService bookService;

	@RequestMapping("/main")
	public void mainPageGET(Model model) {
		log.info("메인페이지");
		model.addAttribute("cate1", bookService.getCateCode1());
		model.addAttribute("cate2", bookService.getCateCode2());
	}

	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName) {
		log.info("getImage.." + fileName);

		File file = new File("c:\\upload\\" + fileName);

		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 이미지 정보 반환
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int bookId) {
		log.info("getAttachList.." + bookId);
		return new ResponseEntity<List<AttachImageVO>>(attachMapper.getAttachList(bookId), HttpStatus.OK);
	}

	// 상품 검색
	@GetMapping("search")
	public String searchGoodsGET(Criteria cri, Model model) {
		log.info("cri : " + cri);

		List<BookVO> list = bookService.getGoodsList(cri);
		log.info("pre list : " + list);
		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			log.info("list : " + list);
		} else {
			model.addAttribute("listcheck", "empty");

			return "search";
		}
		model.addAttribute("pageMaker", new PageDTO(cri, bookService.goodsGetTotal(cri)));

		String[] typeArr = cri.getType().split("");

		for (String s : typeArr) {
			if (s.equals("T") || s.equals("A")) {
				model.addAttribute("filter_info", bookService.getCateInfoList(cri));
			}
		}

		return "search";
	}

}
