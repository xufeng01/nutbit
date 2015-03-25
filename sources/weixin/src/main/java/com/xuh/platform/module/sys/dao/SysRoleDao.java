package com.xuh.platform.module.sys.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.module.sys.entity.SysRole;

/**
 * 角色Dao
 * @author xufeng
 * @date 2014.8.29
 */
@Repository
public interface SysRoleDao extends BaseDao<SysRole, String>{

	/**
	 * 根据角色查询权限
	 * @param roleid
	 * @return
	 * @throws Exception
	 */
	public List<String> loadFuncidsByRoleid(String roleid)throws Exception;
	
	/**
	 * 根据roleid删除分配权限
	 * @param loginname
	 * @param password
	 * @throws Exception
	 */
	public void deleteRoleFuncByRoleid(String roleid);

	/**
	 * 保存分配权限
	 * @param roleid
	 * @param funcids
	 * @throws Exception
	 */
	public void saveFunc(Map<String,Object> params)throws Exception;
    
}