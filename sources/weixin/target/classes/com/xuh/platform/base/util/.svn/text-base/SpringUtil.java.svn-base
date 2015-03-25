package com.xuh.platform.base.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 获得spring上下文
 * @author xufeng
 * @date 2014.8.18
 */
public class SpringUtil  implements ApplicationContextAware{
	private static ApplicationContext context;
	
	public void setApplicationContext(ApplicationContext context)
			throws BeansException {
		SpringUtil.context = context;
	}

	/**
	 * 获得spring上下文
	 * @return
	 */
	public static ApplicationContext getContext() {
		return context;
	}
	
	/**
	 * 根据bean的ID获得bean
	 */
	public static Object getBean(String bean){
		return context.getBean(bean);
	}
	
	
	/**
	 * SpringMvc下获取request
	 * 
	 * @return
	 */
	public static HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		return request;

	}
	
	
	/**
	 * SpringMvc下获取session
	 * 
	 * @return
	 */
	public static HttpSession getSession() {
		HttpSession session = getRequest().getSession();
		return session;
	}
	
}
