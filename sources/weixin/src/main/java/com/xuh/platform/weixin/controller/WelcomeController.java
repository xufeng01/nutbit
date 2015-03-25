package com.xuh.platform.weixin.controller;

import java.io.IOException;

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
 * 
 * @author xufeng
 * @date 2014.8.30
 */
@Controller
@RequestMapping("/welcome")
public class WelcomeController extends BaseController {

	private Logger logger = Logger.getLogger(WelcomeController.class);

	@Autowired
	private WxBaseAccountService wxBaseAccountService;// 账号service

	@Autowired
	private WxSNUserService wxSNUserService;// 微信用户service

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView welcome(Model model, HttpServletResponse response,
			HttpServletRequest request) throws IOException {

		// 用户同意授权后，能获取到code
		String code = request.getParameter("code");
		logger.info("进入界面授权------code:" + code);

		// 用户同意授权
		if (!"authdeny".equals(code)) {
			try {
				WxBaseAccount account = wxBaseAccountService
						.loadById(Constants.ACCOUNT_NO);
				WxAdvOauth2Token token = WeixinUtil.getOauth2AccessToken(
						account.getAccountappid(),
						account.getAccountappsecret(), code);
				String accessToken = token.getAccessToken();
				String openId = token.getOpenid();
				logger.info("进入界面授权------accessToken:" + accessToken
						+ "--------openId:" + openId);

				WxSNUser wxSNUser = wxSNUserService.loadByOpenId(openId);
				if (wxSNUser != null) {// 该微信用户是否存在
					model.addAttribute("wxSNUser", wxSNUser);
				} else {// 根据微信接口获得用户信息
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

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return forword("module/oauth/welcome");
	}
}
