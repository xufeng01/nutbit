package com.xuh.platform.weixin.vo.req;

/**
 * 文本消息
 * 
 * @author xufeng
 * @date 2014-08-29
 */
public class TextMessageReq extends BaseMessageReq {
	/**
	 *  消息内容
	 */
	private String Content;

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
}