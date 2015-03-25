package com.xuh.platform.base.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONException;

/**
 * html工具累
 * @author xufeng
 *
 */
public class HtmlUtil {
	
	/**
	 * 想response写入对象
	 * @param response
	 * @param object
	 */
	public static void writerJson(HttpServletResponse response,Object object){
			try {
				response.setContentType("application/json");
				writer(response,JSONUtil.toString(object));
			} catch (JSONException e) {
				e.printStackTrace();
			}
	}
	
	
	/**
	 * 想response写入字符串
	 * @param response
	 * @param str
	 */
	public static void writer(HttpServletResponse response,String result){
		try {
			//设置页面不缓存
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out= null;
			out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	} 
}
