package com.xuh.platform.module.subscribe.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.module.subscribe.entity.WxBaseSubscribe;

/**
 * 订阅Dao
 * @author xufeng
 * @date 2014.8.30
 */
@Repository
public interface WxBaseSubscribeDao extends BaseDao<WxBaseSubscribe, String>{
    
	/**
	 * 根据系统账号ID获得订阅信息
	 * @param accountid
	 * @return
	 * @throws Exception
	 */
	public WxBaseSubscribe loadByAccountid(String accountid) throws Exception;
	
	/**
	 * 查询所有关注
	 */
	public List<Map<String,Object>> loadListMap(String accountid) throws Exception;
}