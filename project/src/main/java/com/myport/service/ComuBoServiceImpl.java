package com.myport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.myport.domain.ComuBoVO;
import com.myport.domain.Criteria;
import com.myport.mapper.ComuBoMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ComuBoServiceImpl implements ComuBoService{
	@Setter(onMethod_ = @Autowired)
	private ComuBoMapper mapper;
	
	@Override
	public void register(ComuBoVO board) {
		// TODO Auto-generated method stub
		mapper.insert(board);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ComuBoVO get(Long bno) throws Exception {
		mapper.boardviews(bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(ComuBoVO board) {
		// TODO Auto-generated method stub
		return mapper.update(board)==1;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		return mapper.delete(bno)==1;
	}

	@Override
	public List<ComuBoVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public List<ComuBoVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cri);
	}

}
