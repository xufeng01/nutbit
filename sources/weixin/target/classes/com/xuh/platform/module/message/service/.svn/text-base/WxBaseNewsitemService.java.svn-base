package com.xuh.platform.module.message.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.xuh.platform.base.dao.BaseDao;
import com.xuh.platform.base.service.BaseService;
import com.xuh.platform.base.util.FileUtil;
import com.xuh.platform.module.message.dao.WxBaseNewsitemDao;
import com.xuh.platform.module.message.entity.WxBaseNewsitem;

/**
 * 图文项Service
 * @author xufeng
 * @date 2014.8.30
 */
@Service
public class WxBaseNewsitemService extends BaseService<WxBaseNewsitem, String>{

	@Autowired
	private WxBaseNewsitemDao wxBaseNewsitemDao;
	
	public BaseDao<WxBaseNewsitem, String> getDao() {
		return wxBaseNewsitemDao;
	}
	
	/**
	 * 保存并处理附件
	 * 
	 * @param t
	 */
	public void save(WxBaseNewsitem newsItem,String childpath, MultipartFile file) throws Exception{
		if (file != null && !file.isEmpty()) {
			String filepath = FileUtil.saveFileHandler(childpath, file);
			newsItem.setImagepath(filepath);
		}
		wxBaseNewsitemDao.save(newsItem);
	}
	
	
	/**
	 * 更新图文项
	 * @param newsItem
	 * @param rootPath
	 * @param childpath
	 * @param file
	 * @param deleteflag
	 * @throws Exception
	 */
	public void update(WxBaseNewsitem newsItem,String childpath, MultipartFile file, boolean deleteflag)
			throws Exception {
		if (deleteflag) {
			deleteFile(newsItem);// 删除附件
		}
		if (file != null && !file.isEmpty()) {// 重新上传附件
			String filepath = FileUtil.saveFileHandler(childpath, file);
			newsItem.setImagepath(filepath);
			wxBaseNewsitemDao.saveFile(newsItem);
		}
		wxBaseNewsitemDao.update(newsItem);
	}

	/**
	 * 删除已有附件
	 * 
	 * @param planeditor
	 * @param rootPath
	 */
	private void deleteFile(WxBaseNewsitem newsItem) throws Exception{
		// 删除本地文件
		FileUtil.deleteFileHandler(newsItem.getImagepath());
		wxBaseNewsitemDao.deleteFile(newsItem.getItemid());
	}
	
	/**
	 * 删除
	 * @param id
	 * @throws Exception
	 */
	public void deleteNewsItem(String id)throws Exception{
		WxBaseNewsitem newsItem=wxBaseNewsitemDao.loadById(id);
		FileUtil.deleteFileHandler(newsItem.getImagepath());
		wxBaseNewsitemDao.deleteFile(id);
		wxBaseNewsitemDao.delete(id);
	}
	
}