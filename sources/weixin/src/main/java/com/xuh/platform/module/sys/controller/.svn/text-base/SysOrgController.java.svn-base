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
import com.xuh.platform.module.sys.entity.SysOrg;
import com.xuh.platform.module.sys.service.SysOrgService;

/**
 * 机构controller
 * @author xufeng
 * @date 2014.9.10
 */
@Controller
@RequestMapping("/sys/org") 
public class SysOrgController extends BaseController{
	
	@Autowired
	private SysOrgService sysOrgService; 
	
	/**
	 * 首页跳转
	 * @return
	 */
	@RequestMapping
	public ModelAndView  intoPage()  {
		return forword("module/sys/orgList");
	}
	
	/**
	 * 分页显示
	 * @param req
	 * @param orgname
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> loadListByPage(
			@RequestParam String orgname,
			@RequestParam Integer page, 
			@RequestParam Integer rows) {
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("orgname", orgname);
		params.put("start",page==1?0:(page-1)*rows);
		params.put("end",rows);
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			List<Map<String,Object>> list = sysOrgService.loadPageByParams(params);
			int count = sysOrgService.loadCountByParams(params);
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
		return forword("module/sys/orgAdd");
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
			SysOrg sysOrg = sysOrgService.loadById(id);
			model.addAttribute("sysOrg", sysOrg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/sys/orgAdd");
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
			SysOrg sysOrg = sysOrgService.loadById(id);
			model.addAttribute("sysOrg", sysOrg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/sys/orgDisplay");
	}
	

	/**
	 * 保存（新增或编辑）
	 * @param communication
	 * @param response
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public @ResponseBody
	void save(@ModelAttribute SysOrg sysOrg,HttpServletResponse response) {
			if (sysOrg==null||StringUtil.isEmpty(sysOrg.getOrgid())) {
				try {
					sysOrg.setOrgid(UUIDGenerator.generate());
					sysOrgService.save(sysOrg);
					sendSuccessMessage(response, "保存成功");
				} catch (Exception e) {
					e.printStackTrace();
					sendSuccessMessage(response, "保存失败!");
				}
			} else {
				try {
					sysOrgService.update(sysOrg);
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
				List<SysOrg> list=sysOrgService.loadListByParams(params);
				
				if(list.size()!=0){
					sendFailureMessage(response, "机构已被引用无法删除！");
					return;
				}
				sysOrgService.delete(id);
				sendSuccessMessage(response, "删除成功");
			}else{
				sendFailureMessage(response, "删除失败!");
			}
		}catch (Exception e) {
			sendFailureMessage(response, "机构已被引用无法删除!");
			e.printStackTrace();
		}
	}
	
	/**
	 * 获得机构树
	 * @param ids
	 * @param response
	 */
	@RequestMapping(value="/loadOrgTree",method=RequestMethod.GET)
	public  @ResponseBody List<Map<String,Object>> loadOrgTree(){
		try {
			return sysOrgService.loadOrgTree();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
