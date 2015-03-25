package com.xuh.platform.module.message.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.base.service.BaseService;
import com.xuh.platform.module.message.dao.WxBaseTexttemplateDao;
import com.xuh.platform.module.message.entity.WxBaseTexttemplate;

/**
 * 文本消息模板service
 * @author xufeng
 * @date 2014.8.30
 */
@Service
public class WxBaseTexttemplateService extends BaseService<WxBaseTexttemplate, String> {
	@Autowired
	private WxBaseTexttemplateDao wxBaseTexttemplateDao;
	
	public BaseDao<WxBaseTexttemplate, String> getDao() {
		return wxBaseTexttemplateDao;
	}
	
	/**
	 * 获得所有图文模板-用于下拉框
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> loadTemplate(String accountid) throws Exception{
		return wxBaseTexttemplateDao.loadTemplate(accountid);
	}
	
}