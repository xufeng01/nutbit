package com.xuh.platform.base.util;

import java.io.File;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;


/**
 * 资源工具类
 * @author xufeng
 * @date 2014.8.21
 */
public class ResourceUtil {

	private static final ResourceBundle bundle = java.util.ResourceBundle.getBundle("sysConfig");

	/**
	 * 获取session定义名称
	 * 
	 * @return
	 */
	public static final String getSessionattachmenttitle(String sessionName) {
		return bundle.getString(sessionName);
	}
	
	/**
	 * 获得用户名称
	 * @return
	 */
	public static final Object getSessionUserName() {
		//HttpSession session = SpringContextUtil.getSession();
		return null;
	}
	
	/**
	 * 获取登录用户微信账号信息
	 * @return
	 */
	public static final Object getWeiXinAccount() {
		//HttpSession session = SpringContextUtil.getSession();
		return null;
	}
	
	/**
	 * 获取登录用户微信账号ID
	 * @return
	 */
	public static final String getWeiXinAccountId() {
		//HttpSession session = SpringContextUtil.getSession();
		return null;
	}
	
	/**
	 * 获取浏览用户的openId
	 * @return
	 */
	public static final String getUserOpenId() {
		//HttpSession session = SpringContextUtil.getSession();
		return null;
	} 
	
	/**
	 * 获得请求路径
	 * 
	 * @param request
	 * @return
	 */
	public static String getRequestPath(HttpServletRequest request) {
		String requestPath = request.getRequestURI() + "?" + request.getQueryString();
		if (requestPath.indexOf("&") > -1) {// 去掉其他参数
			requestPath = requestPath.substring(0, requestPath.indexOf("&"));
		}
		requestPath = requestPath.substring(request.getContextPath().length() + 1);// 去掉项目路径
		return requestPath;
	}
	
	/**
	 * 没有登录，跳转到登陆界面，获得登录前的url
	 * @param request
	 * @return
	 */
	public static String getRedirUrl(HttpServletRequest request){
		String requestPath = request.getRequestURI() + "?" + request.getQueryString();
		requestPath = requestPath.substring(request.getContextPath().length() + 1);// 去掉项目路径
		return requestPath;
	}

	/**
	 * 获取配置文件参数
	 * 
	 * @param name
	 * @return
	 */
	public static final String getConfigByName(String name) {
		return bundle.getString(name);
	}

	/**
	 * 获得系统路径
	 * @return
	 */
	public static String getSysPath() {
		String path = Thread.currentThread().getContextClassLoader().getResource("").toString();
		String temp = path.replaceFirst("file:/", "").replaceFirst("WEB-INF/classes/", "");
		String separator = System.getProperty("file.separator");
		String resultPath = temp.replaceAll("/", separator + separator).replaceAll("%20", " ");
		return resultPath;
	}

	/**
	 * 获取项目根目录
	 * 
	 * @return
	 */
	public static String getPorjectPath() {
		String nowpath; // 当前tomcat的bin目录的路径 如
						// D:\java\software\apache-tomcat-6.0.14\bin
		String tempdir;
		nowpath = System.getProperty("user.dir");
		tempdir = nowpath.replace("bin", "webapps"); // 把bin 文件夹变到 webapps文件里面
		tempdir += "\\"; // 拼成D:\java\software\apache-tomcat-6.0.14\webapps\sz_pro
		return tempdir;
	}

	public static String getClassPath() {
		String path = Thread.currentThread().getContextClassLoader().getResource("").toString();
		String temp = path.replaceFirst("file:/", "");
		String separator = System.getProperty("file.separator");
		String resultPath = temp.replaceAll("/", separator + separator);
		return resultPath;
	}

	/**
	 * 获得路径分隔符
	 * @return
	 */
	public static String getSeparator() {
		return System.getProperty("file.separator");
	}

	/**
	 * 获得request中参数
	 * @param field
	 * @return
	 */
	public static String getParameter(String field) {
		HttpServletRequest request = SpringUtil.getRequest();
		return request.getParameter(field);
	}

	/**
	 * 上传文件根目录
	 * @return
	 */
	public static String getUploadPath(){
		HttpServletRequest request = SpringUtil.getRequest();
		String targetDirectory  =request.getSession().getServletContext().getRealPath("/WEB-INF/"); // 指定上传文件的保存地址
		String[] rootDict = {};
		if(targetDirectory.indexOf("/")!=-1){
			rootDict = targetDirectory.split("/");
		}
		if(targetDirectory.indexOf("\\")!=-1){
			rootDict = targetDirectory.split("\\\\");
		}
		StringBuffer root = new StringBuffer("");
		String osname =  System.getProperties().getProperty("os.name");
		if(osname.indexOf("linux")!=-1){//部署系统是linux系统
			root.append("/");
		}
		if(rootDict!=null && rootDict.length>2){
			for(int i=0,len = rootDict.length-2;i<len;i++){
				root.append(rootDict[i]).append("/");
			}
		}
		root.append(bundle.getString("upload_path")+File.separator);
		return root.toString();
	}
	
	public static void main(String[] args) {
		System.out.println("------getSysPath----"+getSysPath());
		System.out.println("------getPorjectPath----"+getPorjectPath());
		System.out.println("------getSysPath----"+getSysPath());
		System.out.println("------getClassPath----"+getClassPath());

	}
}
