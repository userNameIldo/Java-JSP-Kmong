package com.event;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListenerTest implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		System.out.println("���� �״´�...");
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
		System.out.println("���� ��Ƴ���...");
		
		ServletContext sc = sce.getServletContext();
		sc.setAttribute("str", "���� ���� �ʱ�ȭ��");
		
	}
	
	

}
