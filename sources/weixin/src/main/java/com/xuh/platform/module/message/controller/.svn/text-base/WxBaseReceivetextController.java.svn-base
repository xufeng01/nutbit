package com.xuh.platform.module.message.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuh.platform.base.constants.Constants;
import com.xuh.platform.base.controller.BaseController;
import com.xuh.platform.base.util.SpringUtil;
import com.xuh.platform.module.account.entity.WxBaseAccount;
import com.xuh.platform.module.message.service.WxBaseReceivetextService;

/**
 * 接收文本controller
 * @author xufeng
 * @date 2014.9.25
 */
@Controller
@RequestMapping("/message/receivetext") 
public class WxBaseReceivetextController extends BaseController{
	
	@Autowired
	private WxBaseReceivetextService wxBaseReceivetextService; 
	
	/**
	 * 首页跳转
	 * @return
	 */
	@RequestMapping
	public ModelAndView  intoPage()  {
		return forword("module/message/receivetextList");
	}
	
	/**
	 * 分页显示
	 * @param req
	 * @param funcname
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> loadListByPage(
			@RequestParam String textcontent,
			@RequestParam Integer page, 
			@RequestParam Integer rows) {
		Map<String,Object> params=new HashMap<String, Object>();
		Map<String, Object> jsonMap = new HashMap<String, Object>();//返回值
		WxBaseAccount wxBaseAccount = (WxBaseAccount)SpringUtil.getSession().getAttribute(Constants.SESSION_WEIXIN_ACCOUNT);
		if(wxBaseAccount==null){
			jsonMap.put("total",0);
			jsonMap.put("rows",new ArrayList<Map<String,Object>>());
			return jsonMap;
		}
		
		params.put("accountid", wxBaseAccount.getAccountid());
		params.put("textcontent", textcontent);
		params.put("start",page==1?0:(page-1)*rows);
		params.put("end",rows);
		
		try {
			List<Map<String,Object>> list = wxBaseReceivetextService.loadPageByParams(params);
			int count = wxBaseReceivetextService.loadCountByParams(params);
			jsonMap.put("total",count);
			jsonMap.put("rows",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonMap;
	}
	
}
