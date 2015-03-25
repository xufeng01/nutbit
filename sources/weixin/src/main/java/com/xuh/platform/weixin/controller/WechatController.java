package com.xuh.platform.weixin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.xuh.platform.base.constants.Constants;
import com.xuh.platform.base.controller.BaseController;
import com.xuh.platform.module.account.entity.WxBaseAccount;
import com.xuh.platform.module.account.service.WxBaseAccountService;
import com.xuh.platform.weixin.service.WechatService;
import com.xuh.platform.weixin.util.SignUtil;

/**
 * 授权后的回调请求处理
 * @author xufeng
 * @date 2015.3.11
 */
@Controller
@RequestMapping("/wechat")
public class WechatController extends BaseController {

	private Logger logger = Logger.getLogger(WechatController.class);

	@Autowired
	private WxBaseAccountService wxBaseAccountService;// 账号service
	
	@Autowired
	private WechatService wechatService;// 消息处理service

	/**
	 * 微信微信公众平台验证
	 * 
	 * @param request
	 * @param response
	 * @param signature
	 * @param timestamp
	 * @param nonce
	 * @param echostr
	 */
	@RequestMapping(method=RequestMethod.GET)
	public void wechatGet(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "signature") String signature,
			@RequestParam(value = "timestamp") String timestamp,
			@RequestParam(value = "nonce") String nonce,
			@RequestParam(value = "echostr") String echostr) {
		logger.info("--------开始微信公众平台接入验证-------signature:" + signature
				+ ";timestamp:" + timestamp + ";nonce:" + nonce + ";echostr:"
				+ echostr);
		
		try {
			WxBaseAccount wxBaseAccount = wxBaseAccountService.loadById(Constants.ACCOUNT_NO);
			if (SignUtil.checkSignature(wxBaseAccount.getAccounttoken(), signature,timestamp, nonce)) {
				logger.info("--------通过微信公众平台接入验证-------");
				sendMessage(response,echostr);
			}else{
				logger.info("--------未通过微信公众平台接入验证-------");
			}	
		} catch (Exception e) {
			logger.info("--------数据库查询失败-------");
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 微信消息处理入口
	 * @param response
	 * @param request
	 * @throws IOException
	 */
	@RequestMapping(method = RequestMethod.POST)
	public void wechatPost(HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		String respMessage = wechatService.coreService(request);
		sendMessage(response,respMessage);
	}
}
