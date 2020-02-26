package com.lhj.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN = "login";
	
	private static final Logger logger= LoggerFactory.getLogger(LoginInterceptor.class);
	
	/*
	 * preHandle : 컨트롤러가 호출되기 전에 실행
	 * postHandle : 컨트롤러가 호출된 후에 실행
	 */
	
	//로그인 한 후
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response,
			Object handler , ModelAndView modelAndView ) throws Exception{
		
		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		//Object userVO = modelAndView.getModel().get("userVO");
		Object userVO = modelMap.get("userVO");
		String reqRef = request.getParameter("ref");
		System.out.println("userVO="+userVO);
		
		if(userVO !=null) { //사용자의 정보가 있다면 HttpSession에 로그인 처리
			logger.info("new login success");
			session.setAttribute(LOGIN, userVO); //세션에 회원 정보 저장
			
			if(request.getParameter("useCookie") != null) { //받아온 쿠키가 널이 아니면
				
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setMaxAge(60 * 60 * 24 * 7); //일주일간 유지
				loginCookie.setPath("/");
				response.addCookie(loginCookie);
				System.out.println("cookie...."+loginCookie.getValue());
				System.out.println("cookie 경로...."+loginCookie.getPath());
			}
			Object dest = session.getAttribute("ref");
			System.out.println("reqRef"+reqRef);
			if(reqRef !=null && !reqRef.equals("")) {
				System.out.println("aa??");
				dest = reqRef;
			}
			System.out.println("dest="+dest);
			if(dest != null) {
				if(dest.equals("http://localhost:8080/lhj/login") || dest.equals("http://localhost:8080/lhj/join")) {
					response.sendRedirect("main");
				} else {
					response.sendRedirect((String) dest);
				}
			} else {
			   response.sendRedirect("main");
			}
				
			
			/*
			 * if(uri !=null ) { //받아온 uri 가 null이 아닐경우 response.sendRedirect("../"+uri); }
			 * else { response.sendRedirect("../main");//로그인 성공한 후 메인으로 이동 }
			 */
		}
		
		
	}
	
	//로그인 하기 전
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
		
		
		
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute(LOGIN) !=null) { //기존에 로그인 했엇다면 로그인 정보 삭제
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}
	
	
}
