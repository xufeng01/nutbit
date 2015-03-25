package com.xuh.platform.module.account.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.base.service.BaseService;
import com.xuh.platform.module.account.dao.WxBaseAccountDao;
import com.xuh.platform.module.account.entity.WxBaseAccount;

/**
 * 账号service
 * @author xufeng
 * 2014.8.30
 */
@Service("wxBaseAccountService")
public class WxBaseAccountService extends BaseService<WxBaseAccount, String>{

	@Autowired
	private WxBaseAccountDao wxBaseAccountDao;
	
	public BaseDao<WxBaseAccount, String> getDao() {
		return wxBaseAccountDao;
	}
	
	/**
	 * 根据原始ID获得微信账号信息
	 * @param wxAccountid
	 * @return
	 * @throws Exception
	 */
	public WxBaseAccount loadByWxAccountid(String wxAccountid) throws Exception{
		return wxBaseAccountDao.loadByWxAccountid(wxAccountid);
	}
	
}
