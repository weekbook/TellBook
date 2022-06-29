package com.myport.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myport.domain.QnaVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class QnaMapperTests {
	
	@Autowired
	private QnaMapper mapper;
	
	//게시글 등록
	@Test
	public void boardEnrollTest() throws Exception{
		
		QnaVO vo = new QnaVO();
		
		vo.setBName("테스트1");
		vo.setBTitle("타이틀1");
		vo.setBContent("컨텐츠1");
		vo.setBType("주문/배송");
		vo.setBGroup(0);
		vo.setBStep(0);
		vo.setBIndent(0);
		
		System.out.println(vo);
		
		mapper.insert(vo);
	}

}
