package com.xuh.platform.base.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xuh.platform.base.constants.Constants;
import com.xuh.platform.base.util.Encrypter;
import com.xuh.platform.base.util.SpringUtil;
import com.xuh.platform.module.account.entity.WxBaseAccount;
import com.xuh.platform.module.account.service.WxBaseAccountService;
import com.xuh.platform.module.sys.entity.SysFunc;
import com.xuh.platform.module.sys.entity.SysUser;
import com.xuh.platform.module.sys.service.SysFuncService;
import com.xuh.platform.module.sys.service.SysUserService;

/**
 * 登陆
 * @author 许峰
 * @date 2014.9.4
 */

@Controller
@RequestMapping("/index")
public class LoginController extends BaseController{
	
	private Logger logger = Logger.getLogger(LoginController.class);
	
	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private SysFuncService sysFuncService;
	
	@Autowired
	private WxBaseAccountService wxBaseAccountService;
	
	/**
	 * 进入登陆界面
	 */
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView index() {
		logger.info("-------------进入登陆界面-----------");
		return forword("index");
	}
	
	/**
	 * 验证用户登陆
	 * @param request
	 * @param response
	 * @param loginame
	 * @param password
	 */
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView login(@RequestParam String loginname,@RequestParam String password,Model model) {
		SysUser sysUser=null;
		try {
			sysUser=sysUserService.loadByLogin(loginname,Encrypter.encrypt(password, Encrypter.MD5));//密码需要md5加密
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(sysUser!=null){//登陆成功
			logger.info("-------------登陆成功-----------");
			//获得菜单,并添加到session中
			SpringUtil.getSession().setAttribute(Constants.SESSION_USER_KEY, sysUser);
			List<SysFunc> sysFuncs=null;
			try {
				sysFuncs=sysFuncService.loadFuncByUserid(sysUser.getUserid());
				SpringUtil.getSession().setAttribute(Constants.SESSION_SYSFUNC, sysFuncs);
				
				//获得微信账号
				WxBaseAccount wxBaseAccount=wxBaseAccountService.loadById(Constants.ACCOUNT_NO);
				SpringUtil.getSession().setAttribute(Constants.SESSION_WEIXIN_ACCOUNT, wxBaseAccount);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return redirect("rest/frame/main");
		}else{
			logger.info("-------------用户名或密码错误-----------");
			model.addAttribute("loginflag", "1");
			return forword("index");
		}
	}
	
	/**
	 * 进入登陆界面
	 */
	@RequestMapping(value="loginout",method=RequestMethod.GET)
	public ModelAndView loginout() {
		logger.info("-------------退出-----------");
		SpringUtil.getSession().removeAttribute(Constants.SESSION_USER_KEY);
		SpringUtil.getSession().removeAttribute(Constants.SESSION_SYSFUNC);
		return forword("index");
	}
	
}
