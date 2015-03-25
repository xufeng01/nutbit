package com.xuh.platform.module.sys.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.module.sys.entity.SysUser;

/**
 * 系统用户Dao
 * @author xufeng
 * @date 2014.8.29
 */
@Repository
public interface SysUserDao extends BaseDao<SysUser, String>{

	/**
	 * 根据登陆账户和密码查询
	 * @param loginname
	 * @param password
	 * @throws Exception
	 */
	public SysUser loadByLogin(@Param("loginname")String loginname, @Param("password")String password);
	
	/**
	 * 根据userid查询角色
	 * @param loginname
	 * @param password
	 * @throws Exception
	 */
	public String loadRoleidByUserid(String userid);
	
	/**
	 * 根据userid删除分配角色
	 * @param loginname
	 * @param password
	 * @throws Exception
	 */
	public void deleteUserRoleByUserid(String userid);
	
	/**
	 * 保存用户分配角色
	 * @param loginname
	 * @param password
	 * @throws Exception
	 */
	public void saveUserRole(Map<String,Object> params);
    
}