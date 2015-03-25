package com.xuh.platform.module.message.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuh.platform.base.constants.Constants;
import com.xuh.platform.base.controller.BaseController;
import com.xuh.platform.base.util.SpringUtil;
import com.xuh.platform.base.util.StringUtil;
import com.xuh.platform.base.util.UUIDGenerator;
import com.xuh.platform.module.account.entity.WxBaseAccount;
import com.xuh.platform.module.message.entity.WxBaseNewstemplate;
import com.xuh.platform.module.message.service.WxBaseNewstemplateService;

/**
 * 文本消息controller
 * @author xufeng
 * @date 2014.9.13
 */
@Controller
@RequestMapping("/message/newstemplate") 
public class WxBaseNewstemplateController extends BaseController{
	
	@Autowired
	private WxBaseNewstemplateService wxBaseNewstemplateService; 
	
	/**
	 * 首页跳转
	 * @return
	 */
	@RequestMapping
	public ModelAndView  intoPage()  {
		return forword("module/message/newstemplateList");
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
			@RequestParam String templatename,
			@RequestParam Integer page, 
			@RequestParam Integer rows) {
		Map<String,Object> params=new HashMap<String, Object>();
		Map<String, Object> jsonMap = new HashMap<String, Object>();//返回值
		WxBaseAccount wxBaseAccount = (WxBaseAccount)SpringUtil.getSession().getAttribute(Constants.SESSION_WEIXIN_ACCOUNT);
		if(wxBaseAccount==null){//未绑定微信账号
			jsonMap.put("total",0);
			jsonMap.put("rows",new ArrayList<Map<String,Object>>());
			return jsonMap;
		}
		
		params.put("accountid", wxBaseAccount.getAccountid());
		params.put("templatename", templatename);
		params.put("start",page==1?0:(page-1)*rows);
		params.put("end",rows);
		
		try {
			List<Map<String,Object>> list = wxBaseNewstemplateService.loadPageByParams(params);
			int count = wxBaseNewstemplateService.loadCountByParams(params);
			jsonMap.put("total",count);
			jsonMap.put("rows",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonMap;
	}
	
	/**
	 * 新增界面
	 * @return
	 */
	@RequestMapping("/add")
	public	ModelAndView add() {
		return forword("module/message/newstemplateAdd");
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
			WxBaseNewstemplate wxBaseNewstemplate = wxBaseNewstemplateService.loadById(id);
			model.addAttribute("newstemplate", wxBaseNewstemplate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/message/newstemplateAdd");
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
			WxBaseNewstemplate wxBaseNewstemplate = wxBaseNewstemplateService.loadById(id);
			model.addAttribute("newstemplate", wxBaseNewstemplate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/message/newstemplateDisplay");
	}
	

	/**
	 * 保存（新增或编辑）
	 * @param communication
	 * @param response
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public @ResponseBody
	void save(@ModelAttribute WxBaseNewstemplate wxBaseNewstemplate,HttpServletResponse response) {
		WxBaseAccount wxBaseAccount = (WxBaseAccount)SpringUtil.getSession().getAttribute(Constants.SESSION_WEIXIN_ACCOUNT);
			if (wxBaseNewstemplate==null||StringUtil.isEmpty(wxBaseNewstemplate.getTemplateid())) {
				try {
					if(wxBaseAccount==null){
						sendSuccessMessage(response, "未创建微信账号!");
						return;
					}
					wxBaseNewstemplate.setTemplateid(UUIDGenerator.generate());
					wxBaseNewstemplate.setAccountid(wxBaseAccount.getAccountid());
					wxBaseNewstemplate.setUpdatetime(new Date());
					wxBaseNewstemplateService.save(wxBaseNewstemplate);
					sendSuccessMessage(response, "保存成功");
				} catch (Exception e) {
					e.printStackTrace();
					sendSuccessMessage(response, "保存失败!");
				}
			} else {
				try {
					wxBaseNewstemplate.setAccountid(wxBaseAccount.getAccountid());
					wxBaseNewstemplate.setUpdatetime(new Date());
					wxBaseNewstemplateService.update(wxBaseNewstemplate);
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
				wxBaseNewstemplateService.delete(id);
				sendSuccessMessage(response, "删除成功");
			}else{
				sendFailureMessage(response, "删除失败!");
			}
		}catch (Exception e) {
			sendFailureMessage(response, "图文消息已被引用无法删除!");
			e.printStackTrace();
		}
	}
	
	/**
	 * 获得所有模板-用于下拉框
	 * @param ids
	 * @param response
	 */
	@RequestMapping(value="/loadTemplate",method=RequestMethod.GET)
	public @ResponseBody List<Map<String,Object>> loadTemplate() {
		try {
			WxBaseAccount wxBaseAccount = (WxBaseAccount)SpringUtil.getSession().getAttribute(Constants.SESSION_WEIXIN_ACCOUNT);
			return wxBaseNewstemplateService.loadTemplate(wxBaseAccount.getAccountid());
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
