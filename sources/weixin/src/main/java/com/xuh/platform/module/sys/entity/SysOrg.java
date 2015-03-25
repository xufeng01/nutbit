package com.xuh.platform.module.sys.entity;

import java.io.Serializable;

/**
 * 机构
 * @author xufeng
 * @date 2014.8.29
 */
public class SysOrg implements Serializable{
	private static final long serialVersionUID = 1L;

	/**
	 * 机构ID
	 */
	private String orgid;

	/**
	 * 机构名
	 */
    private String orgname;

    /**
     * 机构描述
     */
    private String orgdesc;

    /**
     * 父机构ID
     */
    private String parentid;

	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getOrgdesc() {
		return orgdesc;
	}

	public void setOrgdesc(String orgdesc) {
		this.orgdesc = orgdesc;
	}

	public String getParentid() {
		return parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}

    
}