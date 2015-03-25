package com.xuh.platform.module.subscribe.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.base.service.BaseService;
import com.xuh.platform.module.subscribe.dao.WxBaseSubscribeDao;
import com.xuh.platform.module.subscribe.entity.WxBaseSubscribe;

/**
 * 订阅Service
 * @author xufeng
 * @date 2014.8.30
 */
@Service
public class WxBaseSubscribeService extends BaseService<WxBaseSubscribe, String>{
    
	@Autowired
	private WxBaseSubscribeDao wxBaseSubscribeDao;
	
	public BaseDao<WxBaseSubscribe, String> getDao() {
		return wxBaseSubscribeDao;
	}
	
	/**
	 * 根据系统账号ID获得订阅信息
	 * @param accountid
	 * @return
	 * @throws Exception
	 */
	public WxBaseSubscribe loadByAccountid(String accountid) throws Exception{
		return wxBaseSubscribeDao.loadByAccountid(accountid);
	}
	
	/**
	 * 查询所有关注
	 */
	public List<Map<String,Object>> loadListMap(String accountid) throws Exception{
		return wxBaseSubscribeDao.loadListMap(accountid);
	}
}