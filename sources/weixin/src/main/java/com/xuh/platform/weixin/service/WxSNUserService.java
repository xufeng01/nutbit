package com.xuh.platform.weixin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.base.service.BaseService;
import com.xuh.platform.weixin.dao.WxSNUserDao;
import com.xuh.platform.weixin.entity.WxSNUser;

/**
 * 会员Service
 * @author xufeng
 * @date 2015.3.15
 */
@Service("wxSNUserService")
public class WxSNUserService extends BaseService<WxSNUser, Integer>{

	@Autowired
	private WxSNUserDao wxSNUserDao;
	
	public BaseDao<WxSNUser, Integer> getDao() {
		return wxSNUserDao;
	}
  
	/**
	 * 根据openid获得会员信息
	 * @param openid
	 * @return
	 * @throws Exception
	 */
	public WxSNUser loadByOpenId(String openid)throws Exception{
		return wxSNUserDao.loadByOpenId(openid);
	}
	
	/**
	 * 根据mcode获得会员信息
	 * @param openid
	 * @return
	 * @throws Exception
	 */
	public WxSNUser loadByMcode(String mcode)throws Exception{
		return wxSNUserDao.loadByMcode(mcode);
	}
}
