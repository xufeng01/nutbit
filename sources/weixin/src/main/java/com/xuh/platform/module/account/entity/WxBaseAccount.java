package com.xuh.platform.module.account.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 微信账号PO
 * @author xufeng
 * @date 2014.8.28
 */
public class WxBaseAccount implements Serializable{
	
	private static final long serialVersionUID = 1L;

	/**
	 * 账号ID
	 */
	private String accountid;

	/**
	 * 账号名
	 */
    private String accountname;

    /**
     * 账号token
     */
    private String accounttoken;

    /**
     * 微信账号
     */
    private String accountnumber;

    /**
     * 微信原始ID
     */
    private String wxAccountid;

    /**
     * 公众号类型(0订阅号 1服务号)
     */
    private String accounttype;

    /**
     * 邮箱
     */
    private String accountemail;

    /**
     * 账号描述
     */
    private String accountdesc;

    /**
     * 账号appid
     */
    private String accountappid;

    /**
     * 账号appsecret
     */
    private String accountappsecret;

    /**
     * 更新时间
     */
    private Date updatetime;

	public String getAccountid() {
		return accountid;
	}

	public void setAccountid(String accountid) {
		this.accountid = accountid;
	}

	public String getAccountname() {
		return accountname;
	}

	public void setAccountname(String accountname) {
		this.accountname = accountname;
	}

	public String getAccounttoken() {
		return accounttoken;
	}

	public void setAccounttoken(String accounttoken) {
		this.accounttoken = accounttoken;
	}

	public String getAccountnumber() {
		return accountnumber;
	}

	public void setAccountnumber(String accountnumber) {
		this.accountnumber = accountnumber;
	}

	public String getWxAccountid() {
		return wxAccountid;
	}

	public void setWxAccountid(String wxAccountid) {
		this.wxAccountid = wxAccountid;
	}

	public String getAccounttype() {
		return accounttype;
	}

	public void setAccounttype(String accounttype) {
		this.accounttype = accounttype;
	}

	public String getAccountemail() {
		return accountemail;
	}

	public void setAccountemail(String accountemail) {
		this.accountemail = accountemail;
	}

	public String getAccountdesc() {
		return accountdesc;
	}

	public void setAccountdesc(String accountdesc) {
		this.accountdesc = accountdesc;
	}

	public String getAccountappid() {
		return accountappid;
	}

	public void setAccountappid(String accountappid) {
		this.accountappid = accountappid;
	}

	public String getAccountappsecret() {
		return accountappsecret;
	}

	public void setAccountappsecret(String accountappsecret) {
		this.accountappsecret = accountappsecret;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

   
}