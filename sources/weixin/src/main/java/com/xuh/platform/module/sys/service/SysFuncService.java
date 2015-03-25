package com.xuh.platform.module.sys.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.base.service.BaseService;
import com.xuh.platform.module.sys.dao.SysFuncDao;
import com.xuh.platform.module.sys.entity.SysFunc;

/**
 * 系统菜单Service
 * @author xufeng
 * @date 2014.8.29
 */
@Service
public class SysFuncService extends BaseService<SysFunc, String> {
    
	@Autowired
	private SysFuncDao sysFuncDao;
	
	public BaseDao<SysFunc, String> getDao() {
		return sysFuncDao;
	}
	
	/**
	 * 根据用户ID查询所有菜单
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	public List<SysFunc> loadFuncByUserid(String userid) throws Exception{
		return sysFuncDao.loadFuncByUserid(userid);
	}
	
	/**
	 * 查询一级菜单
	 * @return
	 */
	public List<Map<String,Object>> loadFuncTree() throws Exception{
		List<Map<String,Object>> resultList=new ArrayList<Map<String,Object>>();
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id", "0");
		map.put("name", "权限树");
		map.put("pId", "-1");
		resultList.add(map);
		resultList.addAll(sysFuncDao.loadFuncTree());
		return resultList;
	}
	
	/**
	 * 获得权限树
	 * @param roleid
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> loadListByTree() throws Exception{
		return sysFuncDao.loadListByTree();
	}
}