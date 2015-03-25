package com.xuh.platform.module.menu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.base.service.BaseService;
import com.xuh.platform.module.menu.dao.WxBaseMenuDao;
import com.xuh.platform.module.menu.entity.WxBaseMenu;

/**
 * 微信菜单Service
 * @author xufeng
 * @date 2014.8.30
 */
@Service
public class WxBaseMenuService extends BaseService<WxBaseMenu, String>{
    
	@Autowired
	private WxBaseMenuDao wxBaseSubscribeDao;
	
	public BaseDao<WxBaseMenu, String> getDao() {
		return wxBaseSubscribeDao;
	}
	
	/**
	 * 根据系统账号ID和菜单key获得微信菜单
	 * @param accountid
	 * @return
	 * @throws Exception
	 */
	public WxBaseMenu loadByAccountid(String accountid,String menukey) throws Exception{
		return wxBaseSubscribeDao.loadByAccountid(accountid,menukey);
	}
	
	/**
	 * 查询一级菜单
	 * @return
	 */
	public List<Map<String,Object>> loadMenuTree(String accountid) throws Exception{
		List<Map<String,Object>> resultList=new ArrayList<Map<String,Object>>();
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id", "0");
		map.put("name", "菜单树");
		map.put("pId", "-1");
		resultList.add(map);
		resultList.addAll(wxBaseSubscribeDao.loadMenuTree(accountid));
		return resultList;
	}
}