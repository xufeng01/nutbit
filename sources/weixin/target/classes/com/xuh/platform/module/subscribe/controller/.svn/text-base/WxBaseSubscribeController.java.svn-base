package com.xuh.platform.module.subscribe.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
import com.xuh.platform.module.subscribe.entity.WxBaseSubscribe;
import com.xuh.platform.module.subscribe.service.WxBaseSubscribeService;

/**
 * 关注controller
 * @author xufeng
 * @date 2014.9.21
 */
@Controller
@RequestMapping("/subscribe") 
public class WxBaseSubscribeController extends BaseController{
	
	@Autowired
	private WxBaseSubscribeService wxBaseSubscribeService; 
	
	/**
	 * 首页跳转
	 * @return
	 */
	@RequestMapping
	public ModelAndView  intoPage()  {
		return forword("module/subscribe/subscribeList");
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
	public List<Map<String,Object>> loadList() {
		List<Map<String,Object>> list=null;
		WxBaseAccount wxBaseAccount = (WxBaseAccount)SpringUtil.getSession().getAttribute(Constants.SESSION_WEIXIN_ACCOUNT);
		if(wxBaseAccount==null){//未绑定微信账号
			return new ArrayList<Map<String,Object>>();
		}
		try {
			list = wxBaseSubscribeService.loadListMap(wxBaseAccount.getAccountid());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 新增界面
	 * @return
	 */
	@RequestMapping("/add")
	public	ModelAndView add() {
		return forword("module/subscribe/subscribeAdd");
	}
	
	/**
	 * 编辑界面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/edit/{id}")
	public	ModelAndView edit(@PathVariable String id,Model model) {
		try {
			WxBaseSubscribe wxBaseSubscribe = wxBaseSubscribeService.loadById(id);
			model.addAttribute("subscribe", wxBaseSubscribe);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/subscribe/subscribeAdd");
	}
	

	/**
	 * 查看界面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/display/{id}")
	public	ModelAndView display(@PathVariable String id,Model model) {
		try {
			WxBaseSubscribe wxBaseSubscribe = wxBaseSubscribeService.loadById(id);
			model.addAttribute("subscribe", wxBaseSubscribe);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/subscribe/subscribeDisplay");
	}
	

	/**
	 * 保存（新增或编辑）
	 * @param communication
	 * @param response
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public @ResponseBody
	void save(@ModelAttribute WxBaseSubscribe wxBaseSubscribe,HttpServletResponse response) {
		WxBaseAccount wxBaseAccount = (WxBaseAccount)SpringUtil.getSession().getAttribute(Constants.SESSION_WEIXIN_ACCOUNT);
			if (wxBaseSubscribe==null||StringUtil.isEmpty(wxBaseSubscribe.getSubscribeid())) {
				try {
					if(wxBaseAccount==null){
						sendSuccessMessage(response, "未创建微信账号!");
						return;
					}
					wxBaseSubscribe.setSubscribeid(UUIDGenerator.generate());
					wxBaseSubscribe.setAccountid(wxBaseAccount.getAccountid());
					wxBaseSubscribe.setUpdatetime(new Date());
					wxBaseSubscribeService.save(wxBaseSubscribe);
					sendSuccessMessage(response, "保存成功");
				} catch (Exception e) {
					e.printStackTrace();
					sendSuccessMessage(response, "保存失败!");
				}
			} else {
				try {
					wxBaseSubscribe.setAccountid(wxBaseAccount.getAccountid());
					wxBaseSubscribe.setUpdatetime(new Date());
					wxBaseSubscribeService.update(wxBaseSubscribe);
					sendSuccessMessage(response, "编辑成功");
				} catch (Exception e) {
					e.printStackTrace();
					sendSuccessMessage(response, "编辑失败!");
				}
			}
	}
	

	/**
	 * 删除
	 * @param ids
	 * @param response
	 */
	@RequestMapping(value="/delete/{id}",method=RequestMethod.POST)
	public @ResponseBody
	void delete(@PathVariable String id,HttpServletResponse response) {
		try {
			if(StringUtil.isNotEmpty(id)){
				wxBaseSubscribeService.delete(id);
				sendSuccessMessage(response, "删除成功");
			}else{
				sendFailureMessage(response, "删除失败!");
			}
		}catch (Exception e) {
			sendFailureMessage(response, "文本消息已被引用无法删除!");
			e.printStackTrace();
		}
	}
	
}
