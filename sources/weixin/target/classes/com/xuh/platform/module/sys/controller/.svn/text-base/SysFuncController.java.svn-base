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
import com.xuh.platform.module.sys.entity.SysFunc;
import com.xuh.platform.module.sys.service.SysFuncService;

/**
 * 菜单controller
 * @author xufeng
 * @date 2014.9.11
 */
@Controller
@RequestMapping("/sys/func") 
public class SysFuncController extends BaseController{
	
	@Autowired
	private SysFuncService sysFuncService; 
	
	/**
	 * 首页跳转
	 * @return
	 */
	@RequestMapping
	public ModelAndView  intoPage()  {
		return forword("module/sys/funcList");
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
			@RequestParam String funcname,
			@RequestParam String funcid,
			@RequestParam Integer page, 
			@RequestParam Integer rows) {
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("funcname", funcname);
		params.put("funcid", funcid);
		params.put("start",page==1?0:(page-1)*rows);
		params.put("end",rows);
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			List<Map<String,Object>> list = sysFuncService.loadPageByParams(params);
			int count = sysFuncService.loadCountByParams(params);
			jsonMap.put("total",count);
			jsonMap.put("rows",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonMap;
	}
	
	/**
	 * 获得所有权限
	 * @param req
	 * @param funcname
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value = "/rolefunc/{roleid}", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> rolefunc(@PathVariable String roleid) {
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("roleid", roleid);
		try {
			return sysFuncService.loadListByTree();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 新增界面
	 * @return
	 */
	@RequestMapping("/add/{parentid}")
	public	ModelAndView add(@PathVariable String parentid,Model model) {
		model.addAttribute("parentid", parentid);
		return forword("module/sys/funcAdd");
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
			SysFunc sysFunc = sysFuncService.loadById(id);
			model.addAttribute("sysFunc", sysFunc);
			model.addAttribute("parentid", sysFunc.getParentid());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/sys/funcAdd");
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
			SysFunc sysFunc = sysFuncService.loadById(id);
			model.addAttribute("sysFunc", sysFunc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/sys/funcDisplay");
	}
	

	/**
	 * 保存（新增或编辑）
	 * @param communication
	 * @param response
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public @ResponseBody
	void save(@ModelAttribute SysFunc sysFunc,HttpServletResponse response) {
			if (sysFunc==null||StringUtil.isEmpty(sysFunc.getFuncid())) {
				try {
					sysFunc.setFuncid(UUIDGenerator.generate());
					if("0".equals(sysFunc.getParentid())){
						sysFunc.setFunclevel("0");
					}else{
						sysFunc.setFunclevel("1");
					}
					sysFuncService.save(sysFunc);
					sendSuccessMessage(response, "保存成功");
				} catch (Exception e) {
					e.printStackTrace();
					sendSuccessMessage(response, "保存失败!");
				}
			} else {
				try {
					sysFuncService.update(sysFunc);
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
				List<SysFunc> list=sysFuncService.loadListByParams(params);
				
				if(list.size()!=0){
					sendFailureMessage(response, "菜单已被引用无法删除！");
					return;
				}
				sysFuncService.delete(id);
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
	@RequestMapping(value="/loadFuncTree",method=RequestMethod.GET)
	public  @ResponseBody List<Map<String,Object>> loadFuncTree(){
		try {
			return sysFuncService.loadFuncTree();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
