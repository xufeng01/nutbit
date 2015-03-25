package com.xuh.platform.weixin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuh.platform.base.util.StringUtil;
import com.xuh.platform.module.account.entity.WxBaseAccount;
import com.xuh.platform.module.account.service.WxBaseAccountService;
import com.xuh.platform.module.message.constant.NewsitemConstant;
import com.xuh.platform.module.message.entity.WxBaseNewsitem;
import com.xuh.platform.module.message.entity.WxBaseTexttemplate;
import com.xuh.platform.module.message.service.WxBaseNewsitemService;
import com.xuh.platform.module.message.service.WxBaseTexttemplateService;
import com.xuh.platform.module.subscribe.entity.WxBaseSubscribe;
import com.xuh.platform.module.subscribe.service.WxBaseSubscribeService;
import com.xuh.platform.weixin.util.MessageUtil;
import com.xuh.platform.weixin.vo.resp.ArticleResp;
import com.xuh.platform.weixin.vo.resp.NewsMessageResp;
import com.xuh.platform.weixin.vo.resp.TextMessageResp;

/**
 * 微信消息处理Service
 * @author xufeng
 * @date 2014.8.30
 */
@Service("wechatService")
public class WechatService {
private Logger logger=Logger.getLogger(WechatService.class);
	
	@Autowired
	private WxBaseAccountService wxBaseAccountService;//账号service
	
	@Autowired
	private WxBaseTexttemplateService wxBaseTexttemplateService;//消息模板
	
	@Autowired
	private WxBaseNewsitemService wxBaseNewsitemService;//图文项
	
	@Autowired
	private WxBaseSubscribeService wxBaseSubscribeService;//订阅
	
	/**
	 * 微信消息处理
	 */
	public String coreService(HttpServletRequest request) {
		String respMessage = null;
		try {
			Map<String, String> requestMap = MessageUtil.parseXml(request);// xml请求解析
			String fromUserName = requestMap.get("FromUserName");// 发送方帐号（open_id）
			String toUserName = requestMap.get("ToUserName");// 公众帐号
			String msgType = requestMap.get("MsgType");// 消息类型
			String msgId = requestMap.get("MsgId");//消息ID
			String content = requestMap.get("Content");//消息内容
			logger.info("------------微信客户端发送请求---------------------   |   fromUserName:"+fromUserName+"   |   ToUserName:"+toUserName+"   |   msgType:"+msgType+"   |   msgId:"+msgId+"   |   content:"+content);
			
			WxBaseAccount wxBaseAccount=wxBaseAccountService.loadByWxAccountid(toUserName);
			if(wxBaseAccount==null){
				return null;
			}
			String sys_accountId = wxBaseAccount.getAccountid();//根据微信原始ID,获取账号ID
			logger.info("---------系统微信账号ID--------"+sys_accountId);
			
			
			TextMessageResp textMessage = new TextMessageResp();// 默认回复此文本消息
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);//文本类型
			
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {//【微信触发类型】事件推送
				logger.info("------------微信客户端发送请求------------------【微信触发类型】事件推送---");
				String eventType = requestMap.get("Event");// 事件类型
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {// 订阅
					respMessage = doSubscribeEventResponse(sys_accountId,fromUserName,toUserName,textMessage);
				}else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {// 取消订阅
					
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("------------向微信客户端,返回内容--------"+respMessage);
		return respMessage;
	}

	

	
	/**
	 * 订阅
	 * @param sys_accountId
	 * @param textMessage
	 * @return
	 * @throws Exception
	 */
	 private String doSubscribeEventResponse(String sys_accountId,String fromUserName,String toUserName,TextMessageResp textMessage) throws Exception{
		WxBaseSubscribe subscribe = wxBaseSubscribeService.loadByAccountid(sys_accountId);//获得订阅信息
		if(subscribe!=null&&StringUtil.isNotEmpty(subscribe.getTemplateid())){
			String type = subscribe.getMsgtype();
			if (MessageUtil.REQ_MESSAGE_TYPE_TEXT.equals(type)) {//文本类型
				return createTextMessage(subscribe.getTemplateid(),textMessage);//生成文本消息
			} else if (MessageUtil.RESP_MESSAGE_TYPE_NEWS.equals(type)) {//图文消息
				return createNewsMessage(subscribe.getTemplateid(),fromUserName,toUserName);//生成图片消息
			}
		}
		return null;
	}
	
	
	/**
	 * 生成文本消息响应内容
	 * @return
	 */
	private String createTextMessage(String templateid,TextMessageResp textMessage) throws Exception{
		WxBaseTexttemplate textTemplate = wxBaseTexttemplateService.loadById(templateid);//获得模板内容
		String content = textTemplate.getTemplatecontent();
		textMessage.setContent(content);
		return MessageUtil.textMessageToXml(textMessage);
	}
	
	/**
	 * 生成图文消息响应内容
	 * @return
	 */
	private String createNewsMessage(String templateid,String fromUserName,String toUserName) throws Exception{
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("templateid", templateid);
		List<WxBaseNewsitem> newsLists = wxBaseNewsitemService.loadListByParams(params);//获得所有的图文项
		List<ArticleResp> articleList = new ArrayList<ArticleResp>();
		ResourceBundle bundler = ResourceBundle.getBundle("sysConfig");//加载系统配置文件
		for (WxBaseNewsitem news : newsLists) {
			ArticleResp article = new ArticleResp();
			article.setTitle(news.getTitle());
			article.setPicUrl(bundler.getString("domain") + "rest/nofilter/newsitem/pic/"+ news.getItemid());
			String url = "";
			if (NewsitemConstant.NEWSITEM_TYPE_IN.equals(news.getItemtype())) {
				//详细界面内容暂时未开发
				url = bundler.getString("domain")+ "rest/nofilter/newsitem/content/"+ news.getItemid();//详细内容界面
			} else {
				url = news.getUrl();//调用外部链接
			}
			article.setUrl(url);
			article.setDescription(news.getDescription());
			articleList.add(article);
		}
		NewsMessageResp newsResp = new NewsMessageResp();
		newsResp.setCreateTime(new Date().getTime());
		newsResp.setFromUserName(toUserName);
		newsResp.setToUserName(fromUserName);
		newsResp.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
		newsResp.setArticleCount(newsLists.size());
		newsResp.setArticles(articleList);
		return MessageUtil.newsMessageToXml(newsResp);
	}
	
}
