package com.xuh.platform.module.message.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.base.service.BaseService;
import com.xuh.platform.module.message.dao.WxBaseNewstemplateDao;
import com.xuh.platform.module.message.entity.WxBaseNewstemplate;

/**
 * 图文模板service
 * @author xufeng
 * @date 2014.8.30
 */
@Service
public class WxBaseNewstemplateService extends BaseService<WxBaseNewstemplate, String> {

	@Autowired
	private WxBaseNewstemplateDao wxBaseNewstemplateDao;
	
	public BaseDao<WxBaseNewstemplate, String> getDao() {
		return wxBaseNewstemplateDao;
	}
	
	/**
	 * 获得所有图文模板-用于下拉框
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> loadTemplate(String accountid) throws Exception{
		return wxBaseNewstemplateDao.loadTemplate(accountid);
	}
}