package com.xuh.platform.base.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

/**
 * 流工具类
 * 
 * @author xufeng
 * @date 2014.8.21
 */
public class StreamUtil {

	private final static int BUFFER_SIZE = 4096;

	/**
	 * 将InputStream转换成某种字符编码的String
	 * 
	 * @param in
	 * @param encoding
	 * @return
	 * @throws Exception
	 */
	public static String toString(InputStream inputstream, String encoding) {
		String string = null;
		ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		byte[] data = new byte[BUFFER_SIZE];
		int count = -1;
		try {
			while ((count = inputstream.read(data, 0, BUFFER_SIZE)) != -1)
				outStream.write(data, 0, count);
		} catch (IOException e) {
			e.printStackTrace();
		}

		data = null;
		try {
			string = new String(outStream.toByteArray(), encoding);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return string;
	}
	
	/**
	 * 将InputStream转换成String
	 * 
	 * @param in
	 * @throws Exception
	 * 
	 */
	public static String toString(InputStream inputstream) {
		return toString(inputstream, "UTF-8");
	}
	
	/**
	 * 将byte数组转换成String
	 * 
	 * @param in
	 * @return
	 * @throws Exception
	 */
	public static String toString(byte[] bytes) {

		InputStream is = null;
		try {
			is = toInputStream(bytes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return toString(is, "UTF-8");
	}
	
	/**
	 * 将String转换成InputStream
	 * 
	 * @param in
	 * @return
	 * @throws Exception
	 */
	public static InputStream toInputStream(String str) throws Exception {
		ByteArrayInputStream is = new ByteArrayInputStream(str.getBytes("UTF-8"));
		return is;
	}
	

	/**
	 * 将byte数组转换成InputStream
	 * 
	 * @param in
	 * @return
	 * @throws Exception
	 */
	public static InputStream toInputStream(byte[] bytes) throws Exception {
		ByteArrayInputStream is = new ByteArrayInputStream(bytes);
		return is;
	}
	
	
	/**
	 * 将InputStream转换成byte数组
	 * 
	 * @param in
	 *            InputStream
	 * @return byte[]
	 * @throws IOException
	 */
	public static byte[] toBytes(InputStream inputstream) throws IOException {
		ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		byte[] data = new byte[BUFFER_SIZE];
		int count = -1;
		while ((count = inputstream.read(data, 0, BUFFER_SIZE)) != -1)
			outStream.write(data, 0, count);
		data = null;
		return outStream.toByteArray();
	}


	/**
	 * 将String转换成byte[]流
	 * 
	 * @param in
	 * @return
	 * @throws Exception
	 */
	public static byte[] toBytes(String str) {
		byte[] bytes = null;
		try {
			bytes = toBytes(toInputStream(str));
		} catch (IOException e) {
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bytes;
	}
}