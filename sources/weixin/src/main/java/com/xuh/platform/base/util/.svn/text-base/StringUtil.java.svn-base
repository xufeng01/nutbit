package com.xuh.platform.base.util;

import java.beans.XMLDecoder;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 字符串处理及转换工具类
 * @author  xufeng
 * @date 2014.8.21
 */
public class StringUtil {
	private static Pattern numericPattern = Pattern.compile("^[0-9\\-]+$");
	private static Pattern floatNumericPattern = Pattern.compile("^[0-9\\-\\.]+$");
	private static Pattern abcPattern = Pattern.compile("^[a-z|A-Z]+$");
	public static final String splitStrPattern = ",|，|;|；|、|\\.|。|-|_|\\(|\\)|\\[|\\]|\\{|\\}|\\\\|/| |　|\"";
	private static Log logger = LogFactory.getLog(StringUtil.class);

	/**
	 * 判断是否数字表示(int 或则 long)
	 * @param src源字符串
	 * @return 是否数字的标志
	 */
	public static boolean isNumeric(String src) {
		boolean return_value = false;
		if (src != null && src.length() > 0) {
			Matcher m = numericPattern.matcher(src);
			if (m.find()) {
				return_value = true;
			}
		}
		return return_value;
	}
	

	/**
	 * 判断是否纯字母组合
	 * 
	 * @param src
	 *            源字符串
	 * @return 是否纯字母组合的标志
	 */
	public static boolean isABC(String src) {
		boolean return_value = false;
		if (src != null && src.length() > 0) {
			Matcher m = abcPattern.matcher(src);
			if (m.find()) {
				return_value = true;
			}
		}
		return return_value;
	}

	/**
	 * 判断是否浮点数字表示
	 * 
	 * @param src
	 *            源字符串
	 * @return 是否数字的标志
	 */
	public static boolean isFloat(String src) {
		boolean return_value = false;
		if (src != null && src.length() > 0) {
			Matcher m = floatNumericPattern.matcher(src);
			if (m.find()) {
				return_value = true;
			}
		}
		return return_value;
	}


	/**
	 * 判断是否是空字符串 null和"" 都返回 true
	 * 
	 * @author Robin Chang
	 * @param s
	 * @return
	 */
	public static boolean isEmpty(String s) {
		if (s != null && !s.equals("")) {
			return false;
		}
		return true;
	}


	/**
	 * 货币转字符串
	 * 
	 * @param money
	 * @param style
	 *            样式 [default]要格式化成的格式 such as #.00, #.#
	 * @return
	 */

	public static String moneyToString(Object money, String style) {
		if (money != null && style != null && (money instanceof Double || money instanceof Float)) {
			Double num = (Double) money;

			if (style.equalsIgnoreCase("default")) {
				// 缺省样式 0 不输出 ,如果没有输出小数位则不输出.0
				if (num == 0) {
					// 不输出0
					return "";
				} else if ((num * 10 % 10) == 0) {
					// 没有小数
					return Integer.toString((int) num.intValue());
				} else {
					// 有小数
					return num.toString();
				}

			} else {
				DecimalFormat df = new DecimalFormat(style);
				return df.format(num);
			}
		}
		return null;
	}

	/**
	 * 判断两个字符串是否相等 如果都为null则判断为相等,一个为null另一个not null则判断不相等 否则如果s1=s2则相等
	 * 
	 * @param s1
	 * @param s2
	 * @return
	 */
	public static boolean equals(String s1, String s2) {
		if (StringUtil.isEmpty(s1) && StringUtil.isEmpty(s2)) {
			return true;
		} else if (!StringUtil.isEmpty(s1) && !StringUtil.isEmpty(s2)) {
			return s1.equals(s2);
		}
		return false;
	}

	public static int toInt(String s) {
		if (s != null && !"".equals(s.trim())) {
			try {
				return Integer.parseInt(s);
			} catch (Exception e) {
				return 0;
			}
		}
		return 0;
	}

	public static double toDouble(String s) {
		if (s != null && !"".equals(s.trim())) {
			return Double.parseDouble(s);
		}
		return 0;
	}

	/**
	 * 把xml 转为object
	 * 
	 * @param xml
	 * @return
	 */
	public static Object xmlToObject(String xml) {
		try {
			ByteArrayInputStream in = new ByteArrayInputStream(xml.getBytes("UTF8"));
			XMLDecoder decoder = new XMLDecoder(new BufferedInputStream(in));
			return decoder.readObject();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static long toLong(String s) {
		try {
			if (s != null && !"".equals(s.trim()))
				return Long.parseLong(s);
		} catch (Exception exception) {
		}
		return 0L;
	}

	/**
	 * 随即生成指定位数的含数字验证码字符串
	 * 
	 */
	public static String numRandom(int bit) {
		if (bit == 0)
			bit = 6; // 默认6位
		String str = "";
		str = "0123456789";// 初始化种子
		return RandomStringUtils.random(bit, str);// 返回6位的字符串
	}

	/**
	 * 随即生成指定位数的含验证码字符串
	 * 
	 */
	public static String random(int bit) {
		if (bit == 0)
			bit = 6; // 默认6位
		// 因为o和0,l和1很难区分,所以,去掉大小写的o和l
		String str = "";
		str = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz";// 初始化种子
		return RandomStringUtils.random(bit, str);// 返回6位的字符串
	}

	/**
	 * 字符串转float 如果异常返回0.00
	 * 
	 * @param s
	 *            输入的字符串
	 * @return 转换后的float
	 */
	public static Float toFloat(String s) {
		try {
			return Float.parseFloat(s);
		} catch (NumberFormatException e) {
			return new Float(0);
		}
	}

	/**
	 * 页面中去除字符串中的空格、回车、换行符、制表符
	 * @return
	 */
	public static String replaceBlank(String str) {
		if (str != null) {
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
			Matcher m = p.matcher(str);
			str = m.replaceAll("");
		}
		return str;
	}

	/**
	 * 全角生成半角
	 * @param str
	 * @return
	 */
	public static String Q2B(String QJstr) {
		String outStr = "";
		String Tstr = "";
		byte[] b = null;
		for (int i = 0; i < QJstr.length(); i++) {
			try {
				Tstr = QJstr.substring(i, i + 1);
				b = Tstr.getBytes("unicode");
			} catch (java.io.UnsupportedEncodingException e) {
				if (logger.isErrorEnabled()) {
					logger.error(e);
				}
			}
			if (b[3] == -1) {
				b[2] = (byte) (b[2] + 32);
				b[3] = 0;
				try {
					outStr = outStr + new String(b, "unicode");
				} catch (java.io.UnsupportedEncodingException ex) {
					if (logger.isErrorEnabled()) {
						logger.error(ex);
					}
				}
			} else {
				outStr = outStr + Tstr;
			}
		}
		return outStr;
	}

	/**
	 * 
	 * 转换编码
	 * 
	 * @param s
	 *            源字符串
	 * @param fencode
	 *            源编码格式
	 * @param bencode
	 *            目标编码格式
	 * @return 目标编码
	 */
	public static String changCoding(String s, String fencode, String bencode) {
		String str;
		try {
			if (StringUtil.isNotEmpty(s)) {
				str = new String(s.getBytes(fencode), bencode);
			} else {
				str = "";
			}
			return str;
		} catch (UnsupportedEncodingException e) {
			return s;
		}
	}

	/**
	 * 判断对象是否为空
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(Object str) {
		boolean flag = true;
		if (str != null && !str.equals("")) {
			if (str.toString().length() > 0) {
				flag = true;
			}
		} else {
			flag = false;
		}
		return flag;
	}

	/**
	 * 将list 用传入的分隔符组装为String
	 * 
	 * @param list
	 * @param slipStr
	 * @return String
	 */
	public static String listToString(List<String> list, String slipStr) {
		StringBuffer returnStr = new StringBuffer();
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				returnStr.append(list.get(i)).append(slipStr);
			}
		}
		if (returnStr.toString().length() > 0)
			return returnStr.toString().substring(0, returnStr.toString().lastIndexOf(slipStr));
		else
			return "";
	}

	
	/**
	 * 根据传入的分割符号,把传入的字符串分割为List字符串
	 * 
	 * @param slipStr
	 *            分隔的字符串
	 * @param src
	 *            字符串
	 * @return 列表
	 */
	public static List<String> stringToList(String slipStr, String src) {

		if (src == null)
			return null;
		List<String> list = new ArrayList<String>();
		String[] result = src.split(slipStr);
		for (int i = 0; i < result.length; i++) {
			list.add(result[i]);
		}
		return list;
	}

	/**
	 * 首字母大写
	 * @param realName
	 * @return
	 */
	public static String firstUpperCase(String realName) {
		return StringUtils.replaceChars(realName, realName.substring(0, 1),realName.substring(0, 1).toUpperCase());
	}

	/**
	 * 首字母小写
	 * @param realName
	 * @return
	 */
	public static String firstLowerCase(String realName) {
		return StringUtils.replaceChars(realName, realName.substring(0, 1),realName.substring(0, 1).toLowerCase());
	}
}
