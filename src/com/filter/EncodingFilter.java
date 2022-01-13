package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class EncodingFilter implements Filter{

	private String charset;
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		
		String uri;
		
		if(request instanceof HttpServletRequest) {
			
			HttpServletRequest req = (HttpServletRequest)request;
			
			uri = req.getRequestURI();
			
			if(req.getMethod().equalsIgnoreCase("POST")) {
				
				if(uri.indexOf("abcd.do") != -1) {
					
					req.setCharacterEncoding("euc-kr");
					
				}else {
					
					req.setCharacterEncoding(charset);
					
				}
				
			}
			
		}
		
		chain.doFilter(request, response);//다음 필터로 넘김
		
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		charset = config.getInitParameter("charset");
		if(charset==null) {
			
			charset = "UTF-8";
			
		}
		
	}

}
