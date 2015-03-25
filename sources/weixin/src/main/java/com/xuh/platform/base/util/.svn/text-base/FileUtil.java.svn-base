package com.xuh.platform.base.util;

import java.io.File;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

/**
 * 文件上传工具类
 * @author xufeng
 * @date 2014.9.16
 */
public class FileUtil {
	/**
	 * 
	 * @param rootPath 服务器根路径
	 * @param childPath 文件上传子目录
	 * @param file 文件
	 * @return 文件路径
	 * @throws Exception
	 */
	public static String  saveFileHandler(String childPath,MultipartFile file) throws Exception {
		String filePath = ResourceUtil.getUploadPath() + childPath;
		File dirPath = new File(filePath);
		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}
		String filename = file.getOriginalFilename();

		String dateStr = DateUtil.formatDate(new Date(), "yyyyMMddHHmmss");
		String[] names = filename.split("\\.");
		if (names.length > 1) {
			filename = names[0] + "_" + dateStr + "."+ names[names.length - 1];// 添加时间后缀
			file.transferTo(new File(dirPath + File.separator+ filename));
		}		
		return childPath+File.separator+filename;

	}
	
	/**
	 * 删除文件
	 * @param rootPath
	 * @param childPath
	 * @throws Exception
	 */
	public static void deleteFileHandler(String path) throws Exception{
		File delFile = new File(ResourceUtil.getUploadPath() + path);
		if (delFile.isFile() && delFile.exists()) {
			delFile.delete();
		}
	}
}
