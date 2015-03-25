package com.xuh.platform.module.sys.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.base.service.BaseService;
import com.xuh.platform.module.sys.dao.SysOrgDao;
import com.xuh.platform.module.sys.entity.SysOrg;

/**
 * 机构Service
 * @author xufeng
 * @date 2014.8.29
 */
@Service
public class SysOrgService extends BaseService<SysOrg, String>{
	@Autowired
	private SysOrgDao sysOrgDao;
	
	public BaseDao<SysOrg, String> getDao() {
		return sysOrgDao;
	}
	/**
	 * 获得机构树
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> loadOrgTree() throws Exception{
		return sysOrgDao.loadOrgTree();
	}
   
}