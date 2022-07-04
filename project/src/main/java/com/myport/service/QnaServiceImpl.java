package com.myport.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myport.domain.Criteria;
import com.myport.domain.QnaVO;
import com.myport.mapper.AdminMapper;
import com.myport.mapper.QnaMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QnaServiceImpl implements QnaService {
	
	private QnaMapper qnaMapper;

	@Override
	public int insert(QnaVO board) {
		return qnaMapper.insert(board);
	}

	@Override
	public List<QnaVO> getList(Criteria cri) {
		return qnaMapper.getList(cri);
	}

	@Override
	public int getQnaTotal(Criteria cri) {
		return qnaMapper.getQnaTotal(cri);
	}

	@Override
	public QnaVO readQna(Long bId) {
		return qnaMapper.readQna(bId);
	}

	@Override
	public boolean answerQna(QnaVO board) {
		return qnaMapper.answerQna(board) == 1;
	}

	@Override
	public List<QnaVO> getListAll(Criteria cri) {
		return qnaMapper.getListAll(cri);
	}
	
	
	

}
