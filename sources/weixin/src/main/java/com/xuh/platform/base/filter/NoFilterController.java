package com.xuh.platform.base.filter;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xuh.platform.base.controller.BaseController;
import com.xuh.platform.base.util.DateUtil;
import com.xuh.platform.base.util.ResourceUtil;
import com.xuh.platform.base.util.StringUtil;
import com.xuh.platform.module.account.service.WxBaseAccountService;
import com.xuh.platform.module.message.entity.WxBaseNewsitem;
import com.xuh.platform.module.message.service.WxBaseNewsitemService;
import com.xuh.platform.weixin.entity.WxSNUser;
import com.xuh.platform.weixin.service.WxSNUserService;
import com.xuh.platform.weixin.util.BaiduUtil;

/**
 * 微信消息入口
 * @author xufeng
 * @date 2014.8.30
 */
@Controller
@RequestMapping("/nofilter")
public class NoFilterController extends BaseController {
	
	@Autowired
	private WxBaseAccountService wxBaseAccountService;// 账号service
	
	@Autowired
	private WxBaseNewsitemService wxBaseNewsitemService; 

	@Autowired
	private WxSNUserService wxSNUserService;// 微信用户service
	/**
	 * 获得图片内容
	 * @param request
	 * @param response
	 * @param pageid
	 */
	@RequestMapping(value ="/newsitem/pic/{id}", method = RequestMethod.GET)
	public  void newitem_image(HttpServletResponse response,@PathVariable String id){
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
	
	/**
	 * 获得文本内容
	 * @param request
	 * @param response
	 * @param pageid
	 */
	@RequestMapping(value ="/newsitem/content/{id}", method = RequestMethod.GET)
	public	ModelAndView edit(@PathVariable String id,Model model) {
		try {
			WxBaseNewsitem wxBaseNewsitem = wxBaseNewsitemService.loadById(id);
			model.addAttribute("newsitem", wxBaseNewsitem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forword("module/message/newsitemContent");
	}
	
	
	@RequestMapping(value="/oauth/showcode",method=RequestMethod.POST)
	public ModelAndView showcode(@ModelAttribute WxSNUser wxSNUser,Model model,HttpServletResponse response,HttpServletRequest request) throws IOException {
		String snUrl=ResourceUtil.getConfigByName("sn_url");
		snUrl = snUrl+"?mcode="+wxSNUser.getMcode();
		String result=BaiduUtil.httpRequest(snUrl);
		if(StringUtil.isEmpty(result)){
			model.addAttribute("wxSNUser", wxSNUser);
			model.addAttribute("error", 1);
			return forword("module/oauth/welcome");
		}
		JSONObject json=JSONObject.fromObject(result);
		if(json.get("sncode")!=null){//获取机器码成功
			wxSNUser.setSncode(json.get("sncode").toString());
			Date d=DateUtil.parseDate(json.get("enddate").toString(), "yyyy-MM-dd");
			wxSNUser.setEndDate(d);
			//生成会员
			try {
				if(wxSNUser!=null &&wxSNUser.getUid()!=null){
					wxSNUserService.update(wxSNUser);
				}else{
					wxSNUser.setUpdatetime(new Date());
					wxSNUserService.save(wxSNUser);
				}
				model.addAttribute("sncode",wxSNUser.getSncode());
				Calendar c=Calendar.getInstance();
				c.setTime(d);
				model.addAttribute("year",c.get(Calendar.YEAR));
				model.addAttribute("month",c.get(Calendar.MONTH)+1);
				model.addAttribute("day",c.get(Calendar.DAY_OF_MONTH));
				
				Calendar t=Calendar.getInstance();
				t.set(t.get(Calendar.YEAR), t.get(Calendar.MONTH), t.get(Calendar.DAY_OF_MONTH));
				long between_days=(c.getTimeInMillis()-t.getTimeInMillis())/(1000*3600*24); 
				if(between_days>=0){
					model.addAttribute("days",between_days+"天");
				}else{
					model.addAttribute("days","-");
				}
				
				return forword("module/oauth/showcode");
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("wxSNUser", wxSNUser);
				model.addAttribute("error", 1);
				return forword("module/oauth/welcome");
			}
			
		}else{//获取序列号失败
			model.addAttribute("wxSNUser", wxSNUser);
			model.addAttribute("error", 1);
			return forword("module/oauth/welcome");
		}
		
	}
	
	@RequestMapping(value="/oauth/toWelcome",method=RequestMethod.POST)
	public ModelAndView toWelcome(@ModelAttribute WxSNUser wxSNUser,Model model,HttpServletResponse response,HttpServletRequest request) throws IOException {
			model.addAttribute("wxSNUser", wxSNUser);
			return forword("module/oauth/welcome");
	}
	
	
	@RequestMapping(value="/oauth/detail",method=RequestMethod.GET)
	public ModelAndView detail(Model model,HttpServletResponse response,HttpServletRequest request) throws IOException {
		return forword("module/oauth/detail");
	}
}
