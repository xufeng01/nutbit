package com.xuh.platform.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * ueditor
 * @author 许峰
 * @date 2014.9.18
 */

@Controller
@RequestMapping("/ueditor")
public class UeditorController extends BaseController{
	
	/**
	 * 进入登陆界面
	 */
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView index() {
		return forword("ueditor/controller");
	}
}
