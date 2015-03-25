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
import com.xuh.platform.base.util.StringUtil;
import com.xuh.platform.base.util.UUIDGenerator;
import com.xuh.platform.module.sys.entity.SysRole;
import com.xuh.platform.module.sys.service.SysRoleService;

/**
 * 角色controller
 * @author xufeng
 * @date 2014.9.11
 */
@Controller
@RequestMapping("/sys/role") 
public class SysRoleController extends BaseController{
	
	@Autowired
	private SysRoleService sysRoleService; 
	
	/**
	 * 首页跳转
	 * @return
	 */
	@RequestMapping
	public ModelAndView  intoPage()  {
		return forword("module/sys/roleList");
	}
	
	/**
	 * 分页显示
	 * @param req
	 * @param rolename
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> loadListByPage(
			@RequestParam String rolename,
			@RequestParam Integer page, 
			@RequestParam Integer rows) {
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("rolename", rolename);
		params.put("start",page==1?0:(page-1)*rows);
		params.put("end",rows);
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			List<Map<String,Object>> list = sysRoleService.loadPageByParams(params);
			int count = sysRoleService.loadCountByParams(params);
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
		return forword("module/sys/roleAdd");
	}
	
	/**
	 * 分配权限
	 * @return
	 */
	@RequestMapping("/rolefunc/{roleid}")
	public	ModelAndView rolefunc(@PathVariable String roleid,Model model) {
		//根据roleid查询菜单
		try {
			List<String> funcids=sysRoleService.loadFuncidsByRoleid(roleid);
			model.addAttribute("funcids", StringUtil.listToString(funcids, ","));
			model.addAttribute("roleid", roleid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/sys/rolefunc");
	}
	
	/**
	 * 保存权限
	 * @param communication
	 * @param response
	 */
	@RequestMapping(value="/rolefunc/save",method=RequestMethod.POST)
	public @ResponseBody
	void saveRolefunc(@RequestParam String roleid,@RequestParam String funcids,HttpServletResponse response) {
		try {
			sysRoleService.saveFuncs(roleid,funcids);
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
			SysRole sysRole = sysRoleService.loadById(id);
			model.addAttribute("sysRole", sysRole);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/sys/roleAdd");
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
			SysRole sysRole = sysRoleService.loadById(id);
			model.addAttribute("sysRole", sysRole);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/sys/roleDisplay");
	}
	

	/**
	 * 保存（新增或编辑）
	 * @param communication
	 * @param response
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public @ResponseBody
	void save(@ModelAttribute SysRole sysRole,HttpServletResponse response) {
			if (sysRole==null||StringUtil.isEmpty(sysRole.getRoleid())) {
				try {
					sysRole.setRoleid(UUIDGenerator.generate());
					sysRoleService.save(sysRole);
					sendSuccessMessage(response, "保存成功");
				} catch (Exception e) {
					e.printStackTrace();
					sendSuccessMessage(response, "保存失败!");
				}
			} else {
				try {
					sysRoleService.update(sysRole);
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
				sysRoleService.delete(id);
				sendSuccessMessage(response, "删除成功");
			}else{
				sendFailureMessage(response, "删除失败!");
			}
		}catch (Exception e) {
			sendFailureMessage(response, "角色已被引用无法删除!");
			e.printStackTrace();
		}
	}
	
}
