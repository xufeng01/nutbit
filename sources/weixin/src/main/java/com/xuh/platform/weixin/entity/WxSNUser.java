package com.xuh.platform.weixin.entity;

import java.util.Date;

import com.xuh.platform.base.util.DateUtil;

/**
 * 会员PO
 * @author xufeng
 * @date 2015.3.15
 */
public class WxSNUser {
	
	/**
	 * ID
	 */
	private Integer uid;

	/**
	 * 用户标识
	 */
	private String openid;
	
	/**
	 * 用户昵称
	 */
	private String nickname;
	
	/**
	 * 性别（1男 2女 0未知）
	 */
	private String sex;
	
	/**
	 * 国家
	 */
	private String country;
	
	/**
	 * 省
	 */
	private String province;
	
	/**
	 * 城市
	 */
	private String city;
	
	/**
	 * 用户头像链接
	 */
	private String headImgUrl;
	
	/**
	 * 序列号
	 */
	private String sncode;
	
	/**
	 * 机器码
	 */
	private String mcode;
	
	/**
	 * 过期时间
	 */
	private Date endDate;
	
	/**
	 * 过期时间
	 */
	private String endDateStr;
	
	/**
	 * 更新时间
	 */
	private Date updatetime;

	

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getHeadImgUrl() {
		return headImgUrl;
	}

	public void setHeadImgUrl(String headImgUrl) {
		this.headImgUrl = headImgUrl;
	}

	public String getSncode() {
		return sncode;
	}

	public void setSncode(String sncode) {
		this.sncode = sncode;
	}

	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public String getEndDateStr() {
		return DateUtil.formatDate(endDate, "yyyy-MM-dd");
	}

	public void setEndDateStr(String endDateStr) {
		endDate=DateUtil.parseDate(endDateStr, "yyyy-MM-dd");
		this.endDateStr = endDateStr;
	}
	
	
}
