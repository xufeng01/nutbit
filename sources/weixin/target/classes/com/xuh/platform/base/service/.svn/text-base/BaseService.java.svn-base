package com.xuh.platform.base.service;

import java.util.List;
import java.util.Map;

import com.xuh.platform.base.dao.BaseDao;

public abstract class BaseService<T, PK>{
	
	/**
	 * 传入dao
	 * @return
	 */
	public abstract BaseDao<T,PK> getDao();
	
	/**
	 * 查询所有结果
	 * 
	 * @param params
	 * @return
	 */
	public List<T> loadListByParams(Map<String, Object> params) throws Exception{
		return getDao().loadListByParams(params);
	}

	/**
	 * 分页查询
	 * 
	 * @param params
	 * @return
	 */
	public List<Map<String, Object>> loadPageByParams(Map<String, Object> params) throws Exception{
		return getDao().loadPageByParams(params);
	}

	/**
	 * 分页查询计算总数
	 * 
	 * @param params
	 * @return
	 */
	public int loadCountByParams(Map<String, Object> params) throws Exception{
		return getDao().loadCountByParams(params);
	}

	/**
	 * 保存
	 * 
	 * @param t
	 */
	public void save(T t) throws Exception{
		getDao().save(t);
	}

	/**
	 * 更新
	 * 
	 * @param t
	 */
	public void update(T t) throws Exception{
		getDao().update(t);
	}

	/**
	 * 删除
	 * 
	 * @param id
	 */
	public void delete(PK id) throws Exception{
		getDao().delete(id);
	}

	/**
	 * 根据ID查询
	 * 
	 * @param id
	 * @return
	 */
	public T loadById(PK id) throws Exception{
		return getDao().loadById(id);
	}

}
