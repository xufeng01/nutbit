package com.xuh.platform.module.message.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 文本消息模板
 * @author xufeng
 * @date 2014.8.30
 */
public class WxBaseTexttemplate implements Serializable{
	private static final long serialVersionUID = 1L;

	/**
	 * 消息模板ID
	 */
    private String templateid;
    
    /**
     * 账号ID
     */
    private String accountid;

    /**
     * 模板名称
     */
    private String templatename;
    
    /**
     * 模板内容
     */
    private String templatecontent;

    /**
     * 更新时间
     */
    private Date updatetime;

	public String getTemplateid() {
		return templateid;
	}

	public void setTemplateid(String templateid) {
		this.templateid = templateid;
	}

	public String getAccountid() {
		return accountid;
	}

	public void setAccountid(String accountid) {
		this.accountid = accountid;
	}

	public String getTemplatename() {
		return templatename;
	}

	public void setTemplatename(String templatename) {
		this.templatename = templatename;
	}

	public String getTemplatecontent() {
		return templatecontent;
	}

	public void setTemplatecontent(String templatecontent) {
		this.templatecontent = templatecontent;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
   
}