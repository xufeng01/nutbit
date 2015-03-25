package com.xuh.platform.module.sys.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.base.service.BaseService;
import com.xuh.platform.base.util.StringUtil;
import com.xuh.platform.base.util.UUIDGenerator;
import com.xuh.platform.module.sys.dao.SysRoleDao;
import com.xuh.platform.module.sys.entity.SysRole;

/**
 * 角色Service
 * @author xufeng
 * @date 2014.8.29
 */
@Service
public class SysRoleService extends BaseService<SysRole, String>{

	@Autowired
	private SysRoleDao sysRoleDao;
	
	public BaseDao<SysRole, String> getDao() {
		return sysRoleDao;
	}
	
	/**
	 * 根据角色查询权限
	 * @param roleid
	 * @return
	 * @throws Exception
	 */
	public List<String> loadFuncidsByRoleid(String roleid)throws Exception{
		return  sysRoleDao.loadFuncidsByRoleid(roleid);
	}

	/**
	 * 保存分配权限
	 * @param roleid
	 * @param funcids
	 * @throws Exception
	 */
	public void saveFuncs(String roleid, String funcids)throws Exception{
		sysRoleDao.deleteRoleFuncByRoleid(roleid);
		if(StringUtil.isNotEmpty(funcids)){
			String[] funcidArr=funcids.split(",");
			for(String funcid:funcidArr){
				Map<String,Object> params=new HashMap<String, Object>();
				params.put("conid", UUIDGenerator.generate());
				params.put("roleid", roleid);
				params.put("funcid", funcid);
				sysRoleDao.saveFunc(params);
			}
		}
	}
    
}