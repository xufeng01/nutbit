package com.xuh.platform.weixin.entity;

import java.io.Serializable;

/**
 * 网页token
 * @author xufeng
 * @date 2014.9.29
 */
public class WxAdvOauth2Token implements Serializable{
	private static final long serialVersionUID = 1L;
	/**
	 * 网页授权接口调用凭证
	 */
	private String accessToken;
	
	/**
	 * 凭证有效时间
	 */
	private String expiresIn;
	
	/**
	 * 用于刷新凭证
	 */
	private String refreshToken;
	
	/**
	 * 用户标识
	 */
	private String openid;
	
	/**
	 * 用户授权作用域
	 */
	private String scope;

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public String getExpiresIn() {
		return expiresIn;
	}

	public void setExpiresIn(String expiresIn) {
		this.expiresIn = expiresIn;
	}

	public String getRefreshToken() {
		return refreshToken;
	}

	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}
	
	
}
