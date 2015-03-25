package com.xuh.platform.module.sys.controller;

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
import com.xuh.platform.base.util.Encrypter;
import com.xuh.platform.base.util.StringUtil;
import com.xuh.platform.base.util.UUIDGenerator;
import com.xuh.platform.module.sys.entity.SysUser;
import com.xuh.platform.module.sys.service.SysUserService;

/**
 * 用户controller
 * @author xufeng
 * @date 2014.9.5
 */
@Controller
@RequestMapping("/sys/user") 
public class SysUserController extends BaseController{
	
	@Autowired
	private SysUserService sysUserService; 
	
	/**
	 * 首页跳转
	 * @return
	 */
	@RequestMapping
	public ModelAndView  intoPage()  {
		return forword("module/sys/userList");
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
			@RequestParam String username,
			@RequestParam Integer page, 
			@RequestParam Integer rows) {
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("username", username);
		params.put("start",page==1?0:(page-1)*rows);
		params.put("end",rows);
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			List<Map<String,Object>> list = sysUserService.loadPageByParams(params);
			int count = sysUserService.loadCountByParams(params);
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
		return forword("module/sys/userAdd");
	}
	
	/**
	 * 分配角色
	 * @return
	 */
	@RequestMapping("/userrole/{userid}")
	public	ModelAndView userrole(@PathVariable String userid,Model model) {
		//根据userid查询角色
		try {
			String roleid=sysUserService.loadRoleidByUserid(userid);
			model.addAttribute("roleid", roleid);
			model.addAttribute("userid", userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/sys/userrole");
	}
	
	/**
	 * 保存角色
	 * @param communication
	 * @param response
	 */
	@RequestMapping(value="/userrole/save",method=RequestMethod.POST)
	public @ResponseBody
	void saveUserRole(@RequestParam String userid,@RequestParam String roleid,HttpServletResponse response) {
		try {
			sysUserService.saveRole(userid,roleid);
			sendSuccessMessage(response, "保存成功");
		} catch (Exception e) {
			e.printStackTrace();
			sendSuccessMessage(response, "保存失败!");
		}	
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
			SysUser sysUser = sysUserService.loadById(id);
			model.addAttribute("sysUser", sysUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/sys/userAdd");
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
			SysUser sysUser = sysUserService.loadById(id);
			model.addAttribute("sysUser", sysUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/sys/userDisplay");
	}
	

	/**
	 * 保存（新增或编辑）
	 * @param communication
	 * @param response
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public @ResponseBody
	void save(@ModelAttribute SysUser sysUser,HttpServletResponse response) {
			if (sysUser==null||StringUtil.isEmpty(sysUser.getUserid())) {
				try {
					sysUser.setUserid(UUIDGenerator.generate());
					sysUser.setPassword(Encrypter.encrypt(sysUser.getPassword(), Encrypter.MD5));
					sysUserService.save(sysUser);
					sendSuccessMessage(response, "保存成功");
				} catch (Exception e) {
					e.printStackTrace();
					sendSuccessMessage(response, "保存失败!");
				}
			} else {
				try {
					if(StringUtil.isEmpty(sysUser.getPassword())){
						SysUser older=sysUserService.loadById(sysUser.getUserid());
						sysUser.setPassword(older.getPassword());
					}else{
						sysUser.setPassword(Encrypter.encrypt(sysUser.getPassword(), Encrypter.MD5));
					}
					sysUserService.update(sysUser);
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
				sysUserService.delete(id);
				sendSuccessMessage(response, "删除成功");
			}else{
				sendFailureMessage(response, "删除失败!");
			}
		} catch (Exception e) {
			sendFailureMessage(response, "用户已被引用无法删除!");
			e.printStackTrace();
		}
	}
}
