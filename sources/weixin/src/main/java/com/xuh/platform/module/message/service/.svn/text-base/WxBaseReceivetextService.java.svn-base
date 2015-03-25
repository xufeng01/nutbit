package com.xuh.platform.module.message.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.base.service.BaseService;
import com.xuh.platform.module.message.dao.WxBaseReceivetextDao;
import com.xuh.platform.module.message.entity.WxBaseReceivetext;

/**
 * 接收文本消息service
 * @author xufeng
 * @date 2014.8.30
 */
@Service
public class WxBaseReceivetextService extends BaseService<WxBaseReceivetext, String>{
	@Autowired
	private WxBaseReceivetextDao wxBaseReceivetextDao;
	
	public BaseDao<WxBaseReceivetext, String> getDao() {
		return wxBaseReceivetextDao;
	}
}