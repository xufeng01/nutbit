package com.xuh.platform.module.account.dao;

import org.springframework.stereotype.Repository;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.module.account.entity.WxBaseAccount;

/**
 * 账号Dao
 * @author xufeng
 * @date 2014.8.28
 */
@Repository
public interface WxBaseAccountDao extends BaseDao<WxBaseAccount, String> {

	/**
	 * 根据原始ID获得微信账号信息
	 * @param wxAccountid
	 * @return
	 * @throws Exception
	 */
	public WxBaseAccount loadByWxAccountid(String wxAccountid) throws Exception;
	
}