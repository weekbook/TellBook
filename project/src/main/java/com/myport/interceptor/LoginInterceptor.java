package com.myport.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor implements HandlerInterceptor{

	// ���� �۾� �� ������ ������ ���ŵ��� �ʾ� �α����� ���� ���ο� ������ ������ �� �߻��� �� �ִ� ������ �����ϱ� ���ؼ�
	// �α��� �޼��尡 �ִ� MemberController�� �����ϱ� �� ������ �����ϴ� �۾� 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
//		System.out.println("�α��� ���ͼ���");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return true;
	}
	
	

}
