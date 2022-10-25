package com.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.domain.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	
	// AdminInterceptor는 HandlerInterceptorAdapter를 상속받고, 컨트롤러 실행 전에 실행되는 preHandel 메서드와, 컨트롤러 실행 후 실행되는 postHandle로 나뉩니다.
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception{
		
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member == null) {
			res.sendRedirect("/member/signin");
			return false;
		}
		
		if(member.getVerify() !=9) {
			res.sendRedirect("/");
			return false;
		}
		
		return true;
		
	}

}
