package com.xuh.platform.module.sys.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.module.sys.entity.SysFunc;

/**
 * 系统菜单Dao
 * @author xufeng
 * @date 2014.8.29
 */
@Repository
public interface SysFuncDao extends BaseDao<SysFunc, String> {
    
	/**
	 * 根据用户ID查询所有菜单
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	public List<SysFunc> loadFuncByUserid(String userid) throws Exception;

	/**
	 * 查找一级菜单
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> loadFuncTree() throws Exception;
	
	/**
	 * 获得权限树
	 * @param roleid
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> loadListByTree() throws Exception;
}