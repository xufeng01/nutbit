package com.xuh.platform.weixin.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xuh.platform.base.constants.Constants;
import com.xuh.platform.base.controller.BaseController;
import com.xuh.platform.module.account.entity.WxBaseAccount;
import com.xuh.platform.module.account.service.WxBaseAccountService;
import com.xuh.platform.weixin.entity.WxAdvOauth2Token;
import com.xuh.platform.weixin.entity.WxAdvUser;
import com.xuh.platform.weixin.entity.WxSNUser;
import com.xuh.platform.weixin.service.WxSNUserService;
import com.xuh.platform.weixin.util.WeixinUtil;

/**
 * 微信授权
 * @author xufeng
 * @date 2014.8.30
 */
@Controller
@RequestMapping("/detail")
public class DetailController extends BaseController {

	private Logger logger = Logger.getLogger(DetailController.class);
	
	@Autowired
	private WxBaseAccountService wxBaseAccountService;// 账号service
	
	@Autowired
	private WxSNUserService wxSNUserService;// 微信用户service
	
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView detail(Model model,HttpServletResponse response,HttpServletRequest request) throws IOException {
		
		//用户同意授权后，能获取到code
		String code=request.getParameter("code");
		logger.info("进入界面授权------code:"+code);
		
		//用户同意授权
		if(!"authdeny".equals(code)){
			try {
				WxBaseAccount account = wxBaseAccountService.loadById(Constants.ACCOUNT_NO);
				WxAdvOauth2Token token=WeixinUtil.getOauth2AccessToken(account.getAccountappid(), account.getAccountappsecret(), code);
				String accessToken = token.getAccessToken();
				String openId = token.getOpenid();
				WxSNUser wxSNUser= wxSNUserService.loadByOpenId(openId);
				if(wxSNUser!=null){
					Calendar c=Calendar.getInstance();
					c.setTime(wxSNUser.getEndDate());
					model.addAttribute("year",c.get(Calendar.YEAR));
					model.addAttribute("month",c.get(Calendar.MONTH)+1);
					model.addAttribute("day",c.get(Calendar.DAY_OF_MONTH));
					
					Calendar t=Calendar.getInstance();
					t.set(t.get(Calendar.YEAR), t.get(Calendar.MONTH), t.get(Calendar.DAY_OF_MONTH));
					long between_days=(c.getTimeInMillis()-t.getTimeInMillis())/(1000*3600*24); 
					if(between_days>=0){
						model.addAttribute("days",between_days+"天");
					}else{
						model.addAttribute("days","-");
					}
				}else{
					WxAdvUser user = WeixinUtil.getWxAdvUser(accessToken,
							openId);
					wxSNUser = new WxSNUser();
					wxSNUser.setOpenid(user.getOpenid());
					wxSNUser.setNickname(user.getNickname());
					wxSNUser.setSex("" + user.getSex());
					wxSNUser.setCountry(user.getCountry());
					wxSNUser.setProvince(user.getProvince());
					wxSNUser.setCity(user.getCity());
					wxSNUser.setHeadImgUrl(user.getHeadImgUrl());
					model.addAttribute("wxSNUser", wxSNUser);
				}
				
				
				model.addAttribute("wxSNUser", wxSNUser);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return forword("module/oauth/detail");
	}
}
