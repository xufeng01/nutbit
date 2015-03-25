package com.xuh.platform.base.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 生成sql
 * 
 * @author xufeng
 * @date 2014.8.18
 */
public class SQLUtil {

	/**
	 * 获得mysql分页语句
	 * 
	 * @param sql
	 * @param startRowNum
	 * @param endRowNum
	 * @return
	 */
	public static String getMysqlPagerSQL(String sql, int startRowNum,
			int endRowNum) {
		return sql + " limit " + startRowNum + "," + endRowNum;
	}

	/**
	 * 获得mysql排序
	 * 
	 * @param sql
	 * @param sidx
	 * @param sord
	 * @return
	 */
	public static String getOrderBySQL(String sql, String sidx, String sord) {
		if ((sidx != null) && (!sidx.isEmpty())) {
			sord = sord == null ? "" : sord;
			Pattern ptn = Pattern.compile("order\\s+by", 2);
			Matcher m = ptn.matcher(sql);
			if (m.find())
				sql = sql.substring(0, m.end()) + " " + sidx + " " + sord + ","
						+ sql.substring(m.end());
			else {
				sql = sql + " ORDER BY " + sidx + " " + sord;
			}
		}
		return sql;
	}

	/**
	 * 获得总数
	 * 
	 * @param sql
	 * @return
	 */
	public static String getSelectCountSQL(String sql) {
		return "select count(*) count from (" + sql + ")";
	}
}