package com.xuh.platform.module.message.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.xuh.platform.base.constants.Constants;
import com.xuh.platform.base.controller.BaseController;
import com.xuh.platform.base.util.ResourceUtil;
import com.xuh.platform.base.util.SpringUtil;
import com.xuh.platform.base.util.StringUtil;
import com.xuh.platform.base.util.UUIDGenerator;
import com.xuh.platform.module.account.entity.WxBaseAccount;
import com.xuh.platform.module.message.entity.WxBaseNewsitem;
import com.xuh.platform.module.message.service.WxBaseNewsitemService;

/**
 * 图文项controller
 * @author xufeng
 * @date 2014.9.13
 */
@Controller
@RequestMapping("/message/newsitem") 
public class WxBaseNewsitemController extends BaseController{
	
	@Autowired
	private WxBaseNewsitemService wxBaseNewsitemService; 
	
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
	public List<WxBaseNewsitem> loadList(@RequestParam String templateid) {
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("templateid", templateid);
		List<WxBaseNewsitem> list=null;
		try {
			list = wxBaseNewsitemService.loadListByParams(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 新增界面
	 * @return
	 */
	@RequestMapping("/add/{templateid}")
	public	ModelAndView add(@PathVariable String templateid,Model model) {
		model.addAttribute("templateid", templateid);
		return forword("module/message/newsitemAdd");
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
			WxBaseNewsitem wxBaseNewsitem = wxBaseNewsitemService.loadById(id);
			model.addAttribute("newsitem", wxBaseNewsitem);
			model.addAttribute("templateid", wxBaseNewsitem.getTemplateid());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/message/newsitemAdd");
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
			WxBaseNewsitem wxBaseNewsitem = wxBaseNewsitemService.loadById(id);
			model.addAttribute("newsitem", wxBaseNewsitem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/message/newsitemDisplay");
	}
	
	/**
	 * 保存（新增或编辑）
	 * @param planeditor
	 * @param response
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public void save(HttpServletRequest request,@ModelAttribute WxBaseNewsitem wxBaseNewsitem,@RequestParam(value="filedelete",required = false) boolean filedelete,@RequestParam(value="file",required = false) MultipartFile file,HttpServletResponse response) {
		WxBaseAccount wxBaseAccount = (WxBaseAccount)SpringUtil.getSession().getAttribute(Constants.SESSION_WEIXIN_ACCOUNT);
		if (wxBaseNewsitem==null||StringUtil.isEmpty(wxBaseNewsitem.getItemid())) {
				try {
					wxBaseNewsitem.setItemid(UUIDGenerator.generate());
					wxBaseNewsitem.setAccountid(wxBaseAccount.getAccountid());
					wxBaseNewsitem.setUpdatetime(new Date());
					wxBaseNewsitemService.save(wxBaseNewsitem,Constants.UPLOAD_PATH_FOR_NEWSITEM,file);
					sendMessage(response, "1");
				} catch (Exception e) {
					e.printStackTrace();
					sendMessage(response, "0");//失败;
				}
			} else {
				try {
					wxBaseNewsitem.setAccountid(wxBaseAccount.getAccountid());
					wxBaseNewsitem.setUpdatetime(new Date());
					wxBaseNewsitemService.update(wxBaseNewsitem,Constants.UPLOAD_PATH_FOR_NEWSITEM,file,filedelete);//deleteflag是否删除附件
					sendMessage(response, "1");
				} catch (Exception e) {
					e.printStackTrace();
					sendMessage(response, "0");//失败;
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
				wxBaseNewsitemService.deleteNewsItem(id);
				sendSuccessMessage(response, "删除成功");
			}else{
				sendFailureMessage(response, "删除失败!");
			}
		}catch (Exception e) {
			sendFailureMessage(response, "图文项已被引用无法删除!");
			e.printStackTrace();
		}
	}
	
	/**
	 * 下载
	 * @param request
	 * @param response
	 * @param pageid
	 */
	@RequestMapping(value = "/download/{id}", method = RequestMethod.GET)
	public  void download(HttpServletResponse response,@PathVariable String id){
		 response.setContentType("multipart/form-data");  
		  InputStream in =null;
	      OutputStream os =null;
			 if(!StringUtil.isEmpty(id)){
				 try {
					 WxBaseNewsitem wxBaseNewsitem = wxBaseNewsitemService.loadById(id);
						if(wxBaseNewsitem!=null){
							response.setHeader("Content-Disposition", "attachment;fileName=" +new String("图片".getBytes("gb2312"), "iso8859-1"));
					        in = new FileInputStream(ResourceUtil.getUploadPath() +File.separator+wxBaseNewsitem.getImagepath());  
					        os = response.getOutputStream();  
					        byte[] b = new byte[1024 * 1024];  
					        int length;  
					        while ((length = in.read(b)) > 0) {  
					            os.write(b, 0, length);  
					        }  
						}
						
				 	} catch (Exception e) {
						e.printStackTrace();
					}finally{
				        try {
								in.close();
								os.close();
							} catch (IOException e) {
								e.printStackTrace();
							} 
				   }
		}
	}
	
}
