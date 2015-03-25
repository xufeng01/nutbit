package com.xuh.platform.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * frame
 * @author 许峰
 * @date 2014.9.4
 */

@Controller
@RequestMapping("/frame")
public class FrameController extends BaseController{
	
	/**
	 * main
	 */
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public ModelAndView main() {
		return forword("frame/main");
	}
	
	/**
	 * top
	 */
	@RequestMapping(value="/top",method=RequestMethod.GET)
	public ModelAndView topPage() {
		return forword("frame/top");
	}
	
	/**
	 * left
	 */
	@RequestMapping(value="/left",method=RequestMethod.GET)
	public ModelAndView leftPage() {
		return forword("frame/left");
	}
	
	/**
	 * content
	 */
	@RequestMapping(value="/content",method=RequestMethod.GET)
	public ModelAndView contentPage() {
		return forword("frame/content");
	}
	
	
	/**
	 * error
	 */
	@RequestMapping(value="/error",method=RequestMethod.GET)
	public ModelAndView error() {
		return forword("frame/error");
	}
}
