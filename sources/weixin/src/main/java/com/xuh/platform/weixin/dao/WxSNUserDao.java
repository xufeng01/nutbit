package com.xuh.platform.weixin.dao;

import org.springframework.stereotype.Repository;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.weixin.entity.WxSNUser;

/**
 * 会员用户Dao
 * @author xufeng
 * @date 2015.3.15
 */
@Repository
public interface WxSNUserDao extends BaseDao<WxSNUser, Integer> {
    
	/**
	 * 根据openid获得会员信息
	 * @param openid
	 * @return
	 * @throws Exception
	 */
	public WxSNUser loadByOpenId(String openid)throws Exception;
	
	/**
	 * 根据mcode获得会员信息
	 * @param openid
	 * @return
	 * @throws Exception
	 */
	public WxSNUser loadByMcode(String mcode)throws Exception;
}