package com.xuh.platform.base.util;

import javax.servlet.http.HttpServletRequest;

/**
 * 浏览器工具类
 * @author xufeng
 * @date 2014.8.20
 */
public class BrowserUtil {
	private final static String IE11 = "rv:11.0";
	private final static String IE10 = "MSIE 10.0";
	private final static String IE9 = "MSIE 9.0";
	private final static String IE8 = "MSIE 8.0";
	private final static String IE7 = "MSIE 7.0";
	private final static String IE6 = "MSIE 6.0";
	private final static String FIREFOX = "Firefox";
	private final static String OPERA = "Opera";
	private final static String CHROME = "Chrome";
	private final static String SAFARI = "Safari";
	
	/**
	 * 判断是否IE浏览器
	 * @param request
	 * @return
	 */
	public static boolean isIE(HttpServletRequest request) {
		return (request.getHeader("USER-AGENT").toLowerCase().indexOf("msie") > 0||
				request.getHeader("USER-AGENT").toLowerCase().indexOf("rv:11.0")>0)? true : false;
	}

	/**
	 * 获取IE版本
	 * @param request
	 * @return
	 */
	public static Double getIEversion(HttpServletRequest request) {
		Double version = 0.0;
		if (checkBrowserType(request, IE11)) {
			version = 11.0;
		}else if (checkBrowserType(request, IE10)) {
			version = 10.0;
		}else if (checkBrowserType(request, IE9)) {
			version = 9.0;
		}else if (checkBrowserType(request, IE8)) {
			version = 8.0;
		}else if (checkBrowserType(request, IE7)) {
			version = 7.0;
		}else if (checkBrowserType(request, IE6)) {
			version = 6.0;
		}
		return version;
	}

	/**
	 * 获取浏览器类型
	 * @param request
	 * @return
	 */
	public static BrowserType checkBrowserType(HttpServletRequest request) {
		BrowserType browserType = null;
		if (checkBrowserType(request, IE11)) {
			browserType = BrowserType.IE11;
		}
		if (checkBrowserType(request, IE10)) {
			browserType = BrowserType.IE10;
		}
		if (checkBrowserType(request, IE9)) {
			browserType = BrowserType.IE9;
		}
		if (checkBrowserType(request, IE8)) {
			browserType = BrowserType.IE8;
		}
		if (checkBrowserType(request, IE7)) {
			browserType = BrowserType.IE7;
		}
		if (checkBrowserType(request, IE6)) {
			browserType = BrowserType.IE6;
		}
		if (checkBrowserType(request, FIREFOX)) {
			browserType = BrowserType.Firefox;
		}
		if (checkBrowserType(request, SAFARI)) {
			browserType = BrowserType.Safari;
		}
		if (checkBrowserType(request, CHROME)) {
			browserType = BrowserType.Chrome;
		}
		if (checkBrowserType(request, OPERA)) {
			browserType = BrowserType.Opera;
		}
		if (checkBrowserType(request, "Camino")) {
			browserType = BrowserType.Camino;
		}
		return browserType;
	}

	/**
	 * 检测浏览器类型
	 * @param request
	 * @param brosertype 浏览器类型
	 * @return
	 */
	private static boolean checkBrowserType(HttpServletRequest request, String brosertype) {
		return request.getHeader("USER-AGENT").toLowerCase().indexOf(brosertype) > 0 ? true : false;
	}

}
