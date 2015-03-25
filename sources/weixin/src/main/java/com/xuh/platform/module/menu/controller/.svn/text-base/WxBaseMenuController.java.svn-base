package com.xuh.platform.module.menu.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

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
import com.xuh.platform.module.menu.entity.WxBaseMenu;
import com.xuh.platform.module.menu.service.WxBaseMenuService;
import com.xuh.platform.weixin.entity.WxBaseToken;
import com.xuh.platform.weixin.util.WeixinUtil;
import com.xuh.platform.weixin.vo.menu.BaseButton;
import com.xuh.platform.weixin.vo.menu.ClickButton;
import com.xuh.platform.weixin.vo.menu.ComplexButton;
import com.xuh.platform.weixin.vo.menu.Menu;
import com.xuh.platform.weixin.vo.menu.ViewButton;

/**
 * 菜单controller
 * @author xufeng
 * @date 2014.9.22
 */
@Controller
@RequestMapping("/menu") 
public class WxBaseMenuController extends BaseController{
	
	@Autowired
	private WxBaseMenuService wxBaseMenuService; 
	
	/**
	 * 首页跳转
	 * @return
	 */
	@RequestMapping
	public ModelAndView  intoPage()  {
		return forword("module/menu/menuList");
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
			@RequestParam String name,
			@RequestParam String menuid,
			@RequestParam Integer page, 
			@RequestParam Integer rows) {
		Map<String,Object> params=new HashMap<String, Object>();
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		WxBaseAccount wxBaseAccount = (WxBaseAccount)SpringUtil.getSession().getAttribute(Constants.SESSION_WEIXIN_ACCOUNT);
		if(wxBaseAccount==null){
			jsonMap.put("total",0);
			jsonMap.put("rows",new ArrayList<Map<String,Object>>());
			return jsonMap;
		}
		
		params.put("name", name);
		params.put("menuid", menuid);
		params.put("accountid", wxBaseAccount.getAccountid());
		params.put("start",page==1?0:(page-1)*rows);
		params.put("end",rows);
		
		try {
			List<Map<String,Object>> list = wxBaseMenuService.loadPageByParams(params);
			int count = wxBaseMenuService.loadCountByParams(params);
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
	@RequestMapping("/add/{parentid}")
	public	ModelAndView add(@PathVariable String parentid,Model model) {
		model.addAttribute("parentid", parentid);
		return forword("module/menu/menuAdd");
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
			WxBaseMenu menu = wxBaseMenuService.loadById(id);
			model.addAttribute("menu", menu);
			model.addAttribute("parentid", menu.getParentid());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/menu/menuAdd");
	}
	

	/**
	 * 保存（新增或编辑）
	 * @param communication
	 * @param response
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public @ResponseBody
	void save(@ModelAttribute WxBaseMenu menu,HttpServletResponse response) {
		WxBaseAccount wxBaseAccount = (WxBaseAccount)SpringUtil.getSession().getAttribute(Constants.SESSION_WEIXIN_ACCOUNT);
		if (menu==null||StringUtil.isEmpty(menu.getMenuid())) {
				try {
					if(wxBaseAccount==null){
						sendSuccessMessage(response, "未创建微信账号!");
						return;
					}
					menu.setMenuid(UUIDGenerator.generate());
					menu.setAccountid(wxBaseAccount.getAccountid());
					menu.setUpdatetime(new Date());
					wxBaseMenuService.save(menu);
					sendSuccessMessage(response, "保存成功");
				} catch (Exception e) {
					e.printStackTrace();
					sendSuccessMessage(response, "保存失败!");
				}
			} else {
				try {
					menu.setAccountid(wxBaseAccount.getAccountid());
					menu.setUpdatetime(new Date());
					wxBaseMenuService.update(menu);
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
				Map<String, Object> params=new HashMap<String, Object>();
				params.put("parentid", id);
				List<WxBaseMenu> list=wxBaseMenuService.loadListByParams(params);
				
				if(list.size()!=0){
					sendFailureMessage(response, "菜单已被引用无法删除！");
					return;
				}
				wxBaseMenuService.delete(id);
				sendSuccessMessage(response, "删除成功");
			}else{
				sendFailureMessage(response, "删除失败!");
			}
		}catch (Exception e) {
			sendFailureMessage(response, "菜单已被引用无法删除!");
			e.printStackTrace();
		}
	}
	
	/**
	 * 获得一级菜单树
	 * @param ids
	 * @param response
	 */
	@RequestMapping(value="/loadMenuTree",method=RequestMethod.GET)
	public  @ResponseBody List<Map<String,Object>> loadFuncTree(){
		try {
			WxBaseAccount wxBaseAccount = (WxBaseAccount)SpringUtil.getSession().getAttribute(Constants.SESSION_WEIXIN_ACCOUNT);
			if(wxBaseAccount!=null){
				return wxBaseMenuService.loadMenuTree(wxBaseAccount.getAccountid());
			}else{
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value = "synchronous",method=RequestMethod.POST)
	@ResponseBody
	public void synchronous(HttpServletResponse response) {
		Map<String,Object> params=new HashMap<String, Object>();
		WxBaseAccount wxBaseAccount = (WxBaseAccount)SpringUtil.getSession().getAttribute(Constants.SESSION_WEIXIN_ACCOUNT);
		params.put("accountid", wxBaseAccount.getAccountid());
		params.put("parentid", "0");
		try {
			//获得一级菜单
			List<WxBaseMenu> parentMenus= wxBaseMenuService.loadListByParams(params);
			
			//微信菜单
			Menu menu=new Menu();
			//菜单父按钮
			List<BaseButton> parantButtons=new ArrayList<BaseButton>();
			for(WxBaseMenu parentMenu:parentMenus){
				params.put("parentid", parentMenu.getMenuid());
				//获得二级菜单
				List<WxBaseMenu> subMenus= wxBaseMenuService.loadListByParams(params);
				if(subMenus.size()==0){//不存在子菜单
					if("view".equals(parentMenu.getType())){//超链接按钮
						ViewButton vb = new ViewButton();
						vb.setName(parentMenu.getName());
						vb.setType(parentMenu.getType());
						vb.setUrl(parentMenu.getUrl());
						parantButtons.add(vb);
					}else if("click".equals(parentMenu.getType())){//点击按钮
						ClickButton cb = new ClickButton();
						cb.setKey(parentMenu.getMenukey());
						cb.setName(parentMenu.getName());
						cb.setType(parentMenu.getType());
						parantButtons.add(cb);
					}
				}else{//存在子菜单
					ComplexButton complexButton = new ComplexButton();
					complexButton.setName(parentMenu.getName());
	
					List<BaseButton> subButtons  = new ArrayList<BaseButton>();//二级按钮
					for(WxBaseMenu subMenu:subMenus){
						String type = subMenu.getType();
						if ("view".equals(type)) {
							ViewButton vb = new ViewButton();
							vb.setName(subMenu.getName());
							vb.setType(subMenu.getType());
							vb.setUrl(subMenu.getUrl());
							subButtons.add(vb);
						} else if ("click".equals(type)) {
							ClickButton cb = new ClickButton();
							cb.setName(subMenu.getName());
							cb.setType(subMenu.getType());
							cb.setKey(subMenu.getMenukey());
							subButtons.add(cb);
						}
					}
					complexButton.setSub_button(subButtons);
					parantButtons.add(complexButton);
				}
			}
			
			
			menu.setButton(parantButtons);
			JSONObject jsonMenu = JSONObject.fromObject(menu);
			WxBaseToken token = WeixinUtil.getAccessToken();
			String url = WeixinUtil.menu_create_url.replace("ACCESS_TOKEN",token.getAccessToken());
			JSONObject jsonObject= new JSONObject();
			jsonObject = WeixinUtil.httpRequest(url, "POST", jsonMenu.toString());
			if(jsonObject!=null){
				if (0 == jsonObject.getInt("errcode")) {
						sendSuccessMessage(response, "同步菜单信息数据成功！");
				}else{
					sendFailureMessage(response,"同步菜单信息数据失败！错误码为："+jsonObject.getInt("errcode")+"错误信息为："+jsonObject.getString("errmsg"));
				}
			}else{
				sendFailureMessage(response,"同步菜单信息数据失败！同步自定义菜单URL地址不正确。");
			}	
		} catch (Exception e) {
			e.printStackTrace();
			sendFailureMessage(response,"同步菜单信息数据失败！");
		}
	}
	
}
