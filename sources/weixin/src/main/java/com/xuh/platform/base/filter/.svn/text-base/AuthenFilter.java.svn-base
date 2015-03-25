package com.xuh.platform.base.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import com.xuh.platform.base.constants.Constants;

/**
 * 验证session用户是否登陆
 * @author xufeng
 * @2014.8.21
 */
public class AuthenFilter extends OncePerRequestFilter  {

	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		
        String uri = request.getRequestURI(); 
  
        // uri中包含rest时才进行过滤  
        if (uri.indexOf("rest") != -1&&uri.indexOf("nofilter") == -1) {  
        	 Object user = request.getSession().getAttribute(Constants.SESSION_USER_KEY);  // 从session中获取登录者实体
             if (user==null) { //过滤进入index界面
             	response.sendRedirect(request.getContextPath() + "/index");
             } else {  
                 filterChain.doFilter(request, response);  // 如果session中存在登录者实体，则继续
             }      
        } else {  
            filterChain.doFilter(request, response);  // 如果uri中不包含rest，则继续  
        }  
	}


	
}