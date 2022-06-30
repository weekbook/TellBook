package com.myport.mapper;

import java.util.List;

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
	
	//�Խñ� ���
//	@Test
//	public void boardEnrollTest() throws Exception{
//		
//		QnaVO vo = new QnaVO();
//		
//		vo.setBName("�׽�Ʈ1");
//		vo.setBTitle("Ÿ��Ʋ1");
//		vo.setBContent("������1");
//		vo.setBType("�ֹ�/���");
//		vo.setBGroup(0);
//		vo.setBStep(0);
//		vo.setBIndent(0);
//		vo.setMemberId("admin1");
//		
//		System.out.println(vo);
//		
//		mapper.insert(vo);
//	}
	
	
	// �� ��ȸ
	@Test
	public void boardSelectTest() throws Exception{
		
		QnaVO vo = new QnaVO();
		
		vo.setMemberId("admin1");
		
		List<QnaVO> list =  mapper.getList(vo.getMemberId());
		for(int i=0; i<list.size(); i++) {
			System.out.println("result....." + i + " : " + list.get(i));
		}
		
	}

}
