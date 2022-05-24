package com.myport.service;

import java.util.List;

import com.myport.domain.ComuBoVO;
import com.myport.domain.Criteria;

public interface ComuBoService {
	public void register(ComuBoVO board);

	public ComuBoVO get(Long bno) throws Exception;

	public boolean modify(ComuBoVO board);

	public boolean remove(Long bno);

	public List<ComuBoVO> getList();

	public List<ComuBoVO> getList(Criteria cri);

	public int getTotal(Criteria cri);
	
}
