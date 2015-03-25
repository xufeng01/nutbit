package com.xuh.platform.weixin.dao;

import org.springframework.stereotype.Repository;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.weixin.entity.WxBaseToken;

/**
 * 微信凭证Dao
 * @author xufeng
 * @date 2014.8.29
 */
@Repository
public interface WxBaseTokenDao extends BaseDao<WxBaseToken, String> {
    
	/**
	 * 根据accountid获得微信凭证
	 * @param accountid
	 * @return
	 * @throws Exception
	 */
	public WxBaseToken loadByAccountid(String accountid)throws Exception;
}