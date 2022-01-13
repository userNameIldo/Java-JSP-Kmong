package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class TimerFilter implements Filter{

	private FilterConfig config;
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		long before = System.currentTimeMillis();
		
		chain.doFilter(request, response); // 다음 목적지로 데이터를 전송
		
		long after = System.currentTimeMillis();
		
		String uri;
		
		if(request instanceof HttpServletRequest) {
			HttpServletRequest req = (HttpServletRequest)request;
			uri = req.getRequestURI();
			
			// 로그만들기
			config.getServletContext().log(uri+":"+(after-before)+"ms");
		}
			
		
		
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		
		this.config = config;
		
	}
	
	

}
