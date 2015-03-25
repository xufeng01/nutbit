package com.xuh.platform.module.account.controller;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuh.platform.base.constants.Constants;
import com.xuh.platform.base.controller.BaseController;
import com.xuh.platform.base.util.SpringUtil;
import com.xuh.platform.base.util.StringUtil;
import com.xuh.platform.base.util.UUIDGenerator;
import com.xuh.platform.module.account.entity.WxBaseAccount;
import com.xuh.platform.module.account.service.WxBaseAccountService;

/**
 * 微信账号controller
 * @author xufeng
 * @date 2014.9.13
 */
@Controller
@RequestMapping("/account") 
public class WxBaseAccountController extends BaseController{
	
	@Autowired
	private WxBaseAccountService wxBaseAccountService; 
	
	/**
	 * 首页跳转
	 * @return
	 */
	@RequestMapping
	public ModelAndView  intoPage(Model model)  {
		try {
			//从session中获得微信账号信息
			WxBaseAccount wxBaseAccount = (WxBaseAccount)SpringUtil.getSession().getAttribute(Constants.SESSION_WEIXIN_ACCOUNT);
			model.addAttribute("wxBaseAccount", wxBaseAccount);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/account/accountAdd");
	}
	
	

	/**
	 * 保存（新增或编辑）
	 * @param communication
	 * @param response
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public @ResponseBody
	void save(@ModelAttribute WxBaseAccount wxBaseAccount,HttpServletResponse response) {
			if (wxBaseAccount==null||StringUtil.isEmpty(wxBaseAccount.getAccountid())) {
				try {
					wxBaseAccount.setAccountid(UUIDGenerator.generate());
					wxBaseAccount.setUpdatetime(new Date());
					wxBaseAccountService.save(wxBaseAccount);
					sendSuccessMessage(response, "保存成功");
				} catch (Exception e) {
					e.printStackTrace();
					sendSuccessMessage(response, "保存失败!");
				}
			} else {
				try {
					wxBaseAccount.setUpdatetime(new Date());
					wxBaseAccountService.update(wxBaseAccount);
					sendSuccessMessage(response, "编辑成功");
				} catch (Exception e) {
					e.printStackTrace();
					sendFailureMessage(response, "编辑失败!");
				}
			}
			//向session中设置微信账号
			SpringUtil.getSession().setAttribute(Constants.SESSION_WEIXIN_ACCOUNT,wxBaseAccount);
	}
	
	/**
	 * 验证微信账户是否绑定
	 * @return
	 */
	@RequestMapping(value="validate",method=RequestMethod.POST)
	public void  validate(HttpServletResponse response)  {
		try {
			//从session中获得微信账号信息
			WxBaseAccount wxBaseAccount = (WxBaseAccount)SpringUtil.getSession().getAttribute(Constants.SESSION_WEIXIN_ACCOUNT);
			if(wxBaseAccount!=null){
				sendSuccessMessage(response, "");
			}else{
				sendFailureMessage(response, "未绑定微信账号，请先绑定微信账号！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
