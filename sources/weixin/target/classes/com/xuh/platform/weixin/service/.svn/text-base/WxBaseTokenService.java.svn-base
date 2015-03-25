package com.xuh.platform.weixin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.base.service.BaseService;
import com.xuh.platform.weixin.dao.WxBaseTokenDao;
import com.xuh.platform.weixin.entity.WxBaseToken;

/**
 * 微信凭证Service
 * @author xufeng
 * @date 2014.8.29
 */
@Service("wxBaseTokenService")
public class WxBaseTokenService extends BaseService<WxBaseToken, String>{

	@Autowired
	private WxBaseTokenDao wxBaseTokenDao;
	
	public BaseDao<WxBaseToken, String> getDao() {
		return wxBaseTokenDao;
	}
  
	/**
	 * 根据accountid获得微信凭证
	 * @param accountid
	 * @return
	 * @throws Exception
	 */
	public WxBaseToken loadByAccountid(String accountid)throws Exception{
		return wxBaseTokenDao.loadByAccountid(accountid);
	}
}
