package com.xuh.platform.weixin.controller;

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

import com.xuh.platform.base.controller.BaseController;
import com.xuh.platform.base.util.DateUtil;
import com.xuh.platform.base.util.StringUtil;
import com.xuh.platform.weixin.entity.WxSNUser;
import com.xuh.platform.weixin.service.WxSNUserService;

/**
 * 会员 controller
 * @author xufeng
 * @date 2015.3.15
 */
@Controller
@RequestMapping("/snuser") 
public class WxSNUserController extends BaseController{
	
	@Autowired
	private WxSNUserService wxSNUserService; 
	
	/**
	 * 首页跳转
	 * @return
	 */
	@RequestMapping
	public ModelAndView  intoPage()  {
		return forword("module/snuser/snuserList");
	}
	
	/**
	 * 分页显示
	 * @param req
	 * @param username
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> loadListByPage(
			@RequestParam String nickname,
			@RequestParam String mcode,
			@RequestParam String isend,
			@RequestParam Integer page, 
			@RequestParam Integer rows) {
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("nickname", nickname);
		params.put("mcode", mcode);
		params.put("isend", isend);
		params.put("start",page==1?0:(page-1)*rows);
		params.put("end",rows);
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			List<Map<String,Object>> list = wxSNUserService.loadPageByParams(params);
			int count = wxSNUserService.loadCountByParams(params);
			jsonMap.put("total",count);
			jsonMap.put("rows",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonMap;
	}
	
	/**
	 * 编辑界面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/edit/{uid}")
	public	ModelAndView edit(@PathVariable Integer uid,Model model) {
		try {
			WxSNUser wxSNUser = wxSNUserService.loadById(uid);
			model.addAttribute("wxSNUser", wxSNUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/snuser/snuserAdd");
	}
	

	/**
	 * 查看界面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/display/{uid}")
	public	ModelAndView display(@PathVariable Integer uid,Model model) {
		try {
			WxSNUser wxSNUser = wxSNUserService.loadById(uid);
			model.addAttribute("wxSNUser", wxSNUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/snuser/snuserDisplay");
	}
	

	/**
	 * 保存
	 * @param communication
	 * @param response
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public @ResponseBody
	void save(@ModelAttribute WxSNUser wxSNUser,HttpServletResponse response) {
				try {
					if(DateUtil.parseDate(wxSNUser.getEndDateStr(), "yyyy-MM-dd")==null){
						sendFailureMessage(response, "编辑失败!");
					}else{
						wxSNUser.setEndDate(DateUtil.parseDate(wxSNUser.getEndDateStr(), "yyyy-MM-dd"));
						wxSNUserService.update(wxSNUser);
						sendSuccessMessage(response, "编辑成功");
					}
				} catch (Exception e) {
					e.printStackTrace();
					sendFailureMessage(response, "编辑失败!");
				}
	}
	

	/**
	 * 删除
	 * @param ids
	 * @param response
	 */
	@RequestMapping(value="/delete/{id}",method=RequestMethod.POST)
	public @ResponseBody
	void delete(@PathVariable Integer id,HttpServletResponse response) {
		try {
			if(StringUtil.isNotEmpty(id)){
				wxSNUserService.delete(id);
				sendSuccessMessage(response, "删除成功!");
			}else{
				sendFailureMessage(response, "删除失败!");
			}
		} catch (Exception e) {
			sendFailureMessage(response, "删除失败!");
			e.printStackTrace();
		}
	}
}
