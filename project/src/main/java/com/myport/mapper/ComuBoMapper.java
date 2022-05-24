package com.myport.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myport.domain.ComuBoVO;
import com.myport.domain.Criteria;

public interface ComuBoMapper {
	public List<ComuBoVO> getList();
	
	public List<ComuBoVO> getListWithPaging(Criteria cri);
	
	public int insert(ComuBoVO board);
	
	public void insertSelectKey(ComuBoVO board);
	
	public ComuBoVO read(long l);
	
	public int delete(long l);
	
	public int update(ComuBoVO board);
	
	public int getTotalCount(Criteria cri);
	
	public int updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);

	public Long boardviews(Long bno) throws Exception;
}
