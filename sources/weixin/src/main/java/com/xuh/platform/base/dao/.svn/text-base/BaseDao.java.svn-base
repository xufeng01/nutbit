package com.xuh.platform.base.dao;

import java.util.List;
import java.util.Map;

/**
 * Dao基类
 * @author xufeng
 * @date 2014.8.22
 */
public interface BaseDao<T,PK>{
	
	/**
	 * 查询所有结果
	 * @param params
	 * @return
	 */
	public List<T> loadListByParams(Map<String,Object> params) throws Exception;
	
	/**
	 * 分页查询
	 * @param params
	 * @return
	 */
	public List<Map<String,Object>> loadPageByParams(Map<String,Object> params) throws Exception;

	/**
	 * 分页查询计算总数
	 * @param params
	 * @return
	 */
	public int loadCountByParams(Map<String,Object> params) throws Exception;
	
	
	/**
	 * 保存
	 * @param t
	 */
	public void save(T t) throws Exception;
	
	/**
	 * 更新
	 * @param t
	 */
	public void update(T t) throws Exception;
	
	/**
	 * 删除
	 * @param id
	 */
	public void delete(PK id) throws Exception;
	
	/**
	 * 根据ID查询
	 * @param id
	 * @return
	 */
	public T loadById(PK id) throws Exception;
}
