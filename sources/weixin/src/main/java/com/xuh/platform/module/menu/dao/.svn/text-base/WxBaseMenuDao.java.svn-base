package com.xuh.platform.module.menu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.module.menu.entity.WxBaseMenu;

/**
 * 微信菜单DAO
 * @author xufeng
 * @date 2014.8.30
 */
@Repository
public interface WxBaseMenuDao extends BaseDao<WxBaseMenu, String>{
    
	/**
	 * 根据系统账号ID和菜单key获得菜单
	 * @param accountid
	 * @return
	 * @throws Exception
	 */
	public WxBaseMenu loadByAccountid(@Param("accountid")String accountid,@Param("menukey")String menukey) throws Exception;
	
	/**
	 * 查找一级菜单
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> loadMenuTree(String accountid) throws Exception;
}