package com.xuh.platform.module.sys.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.module.sys.entity.SysOrg;

/**
 * 机构Dao
 * @author xufeng
 * @date 2014.8.29
 */
@Repository
public interface SysOrgDao extends BaseDao<SysOrg, String>{
   
	/**
	 * 获得机构树
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> loadOrgTree() throws Exception;
}