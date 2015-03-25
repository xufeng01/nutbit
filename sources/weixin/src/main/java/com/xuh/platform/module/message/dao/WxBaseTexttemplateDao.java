package com.xuh.platform.module.message.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.module.message.entity.WxBaseTexttemplate;

/**
 * 文本消息模板Dao
 * @author xufeng
 * @date 2014.8.30
 */
@Repository
public interface WxBaseTexttemplateDao extends BaseDao<WxBaseTexttemplate, String> {
	/**
	 * 获得所有图文模板-用于下拉框
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> loadTemplate(String accountid) throws Exception;
}