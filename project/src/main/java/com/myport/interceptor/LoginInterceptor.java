package com.myport.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor implements HandlerInterceptor{

	// 이전 작업 중 세션이 완전히 제거되지 않아 로그인을 위해 새로운 세션을 저장할 때 발생할 수 있는 에러를 방지하기 위해서
	// 로그인 메서드가 있는 MemberController에 진입하기 전 세션을 제거하는 작업 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
//		System.out.println("로그인 인터셉터");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return true;
	}
	
	

}
