package com.xuh.platform.base.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.xuh.platform.base.util.HtmlUtil;

/**
 * Controller基类
 * @author xufeng
 * @date 2014.8.22
 */
public class BaseController {
	
	public final static String SUCCESS ="success";  
	
	public final static String MSG ="msg";  
	
	/**
	 * 转发:服务器直接访问目标地址的URL(浏览器地址栏中还是原来的地址)
	 * @param viewName
	 * @return
	 */
	public ModelAndView forword(String viewName){
		return new ModelAndView(viewName); 
	}
	

	/**
	 * 重定向:浏览器会用刚才请求的所有参数重新请求，所有session，requst参数都可以获取
	 * @param viewName
	 * @return
	 */
     public ModelAndView redirect(String viewName) {
         return new ModelAndView("redirect:"+viewName);
     }

	/**
	 * 跳转到错误界面
	 * @param errMsg
	 * @return
	 */
	public ModelAndView error(String errMsg){
		return new ModelAndView("error"); 
	}
	
	/**
	 *
	 * 提示成功信息
	 *
	 * @param message
	 *
	 */
	public void sendSuccessMessage(HttpServletResponse response,String message) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(SUCCESS, true);
		result.put(MSG, message);
		HtmlUtil.writerJson(response, result);
	}

	/**
	 *
	 * 提示失败信息
	 *
	 * @param message
	 *
	 */
	public void sendFailureMessage(HttpServletResponse response,String message) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(SUCCESS, false);
		result.put(MSG, message);
		HtmlUtil.writerJson(response, result);
	}
	
	/**
	 *
	 * 直接返回结果
	 *
	 * @param message
	 *
	 */
	public void sendMessage(HttpServletResponse response,String result) {
		HtmlUtil.writer(response, result);
	}
	
}
