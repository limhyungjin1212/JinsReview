package com.lhj.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.lhj.model.UserVO;
import com.lhj.service.UserService;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger= LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Inject
	private UserService us;
	
	
	private void saveDest(HttpServletRequest req) { //원래사용자가 원하는 페이지의 정보를 dest라는 이름으로 저장
		String uri = req.getRequestURI();
		String query = req.getQueryString();
		
		if(query == null || query.equals("null")) {
			query = ""; 
		} else {
			query = "?"+query;
		}
		
		if(req.getMethod().equals("GET")) {
			System.out.println("dest :"+(uri+query));
			req.getSession().setAttribute("dest", uri+query);
		}
	}
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null) {//세션에 로그인이라고된 정보가 널 일경우 
			
			logger.info("current user is not logined");
			System.out.println("여기로는 오는가 여기는 어스인포");
			saveDest(request); //이전에 갈려고하던 페이지
			Cookie loginCookie = WebUtils.getCookie(request,"loginCookie"); //로그인쿠키라는값이 저장되어있는걸 가져온다.
			//System.out.println("로그인쿠키1"+loginCookie.getValue());
			if(loginCookie != null) {
				System.out.println("로그인쿠키2"+loginCookie.getValue());
				UserVO uv = us.checkLoginBefore(loginCookie.getValue());
				System.out.println("USERVO="+uv);
				
				if(uv != null) {
					session.setAttribute("login", uv);
					return true;
				}
			}
			
			response.sendRedirect("./login");
			return false;
		}
		return true;
	}
	
}
