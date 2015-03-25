package com.xuh.platform.module.sys.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.base.service.BaseService;
import com.xuh.platform.base.util.UUIDGenerator;
import com.xuh.platform.module.sys.dao.SysUserDao;
import com.xuh.platform.module.sys.entity.SysUser;

/**
 * 系统用户Service
 * @author xufeng
 * @date 2014.8.29
 */
@Service
public class SysUserService extends BaseService<SysUser, String>{
	
	@Autowired
	private SysUserDao sysUserDao;
	
	public BaseDao<SysUser, String> getDao() {
		return sysUserDao;
	}

	/**
	 * 根据登陆账户和密码查询
	 * @param loginname
	 * @param password
	 * @throws Exception
	 */
	public SysUser loadByLogin(String loginname, String password) throws Exception {
		return sysUserDao.loadByLogin(loginname,password);
	}
	
	/**
	 * 根据userid查询角色
	 * @param loginname
	 * @param password
	 * @throws Exception
	 */
	public String loadRoleidByUserid(String userid)throws Exception{
		return sysUserDao.loadRoleidByUserid(userid);
	}
	
	/**
	 * 用户分配权限
	 * @param userid
	 * @param roleid
	 * @throws Exception
	 */
	public void saveRole(String userid, String roleid)throws Exception{
		sysUserDao.deleteUserRoleByUserid(userid);
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("conid", UUIDGenerator.generate());
		params.put("userid", userid);
		params.put("roleid", roleid);
		sysUserDao.saveUserRole(params);
	}
}