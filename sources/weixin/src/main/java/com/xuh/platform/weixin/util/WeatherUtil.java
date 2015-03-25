package com.xuh.platform.weixin.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

/**
 * 描述:天气工具类
 * 
 * @date 2013-12-26
 * */
public class WeatherUtil {
	
	private static final Logger logger = Logger.getLogger(WeatherUtil.class);

	/**
	 * 描述:根据名称来获取天气信息
	 * @param city
	 * @return 天气信息
	 */
	public static Map<String,String> getWeatherByCity(String city) {
		Map<String,String> resultMap=new HashMap<String, String>();
		String url="http://api.map.baidu.com/telematics/v3/weather?location="+city+"&output=json&ak=874E2e0902803ae29f1cdf762629432b";
		String content=getURLContent(url);
		JSONObject data = JSONObject.fromObject(content);
		JSONArray array = data.getJSONArray("results").getJSONObject(0).getJSONArray("weather_data");
		resultMap.put("currentCity", data.getJSONArray("results").getJSONObject(0).getString("currentCity"));
		for (int i = 0; i <array.size(); i++) {
			
			String date=array.getJSONObject(i).getString("date");
			resultMap.put("date"+i, date);
			
			String dayPictureUrl=array.getJSONObject(i).getString("dayPictureUrl");
			resultMap.put("dayPictureUrl"+i, dayPictureUrl);
			
			String nightPictureUrl=array.getJSONObject(i).getString("nightPictureUrl");
			resultMap.put("nightPictureUrl"+i, nightPictureUrl);
			
			String wind=array.getJSONObject(i).getString("wind");
			resultMap.put("wind"+i, wind);
			
			String weather=array.getJSONObject(i).getString("weather");
			resultMap.put("weather"+i, weather);
			
			String temperature=array.getJSONObject(i).getString("temperature");
			resultMap.put("temperature"+i, temperature);
		}
		return resultMap;
	}
	
	public static void main(String[] args) {
		getWeatherByCity("上海");
	}
	
	/**
	 * 描述:获取天气内容
	 * 
	 * @param path
	 *            输入网址
	 * @return 网页内容
	 */
	public static String getURLContent(String path) {
		URLConnection connectionData;
		StringBuffer sb  = new StringBuffer();;
		BufferedReader br;
		URL url = null;
		try {
			url = new URL(path);
			connectionData = url.openConnection();
			connectionData.setConnectTimeout(1000);
			br = new BufferedReader(new InputStreamReader(connectionData
					.getInputStream(), "UTF-8"));
			String line = null;
			while ((line = br.readLine()) != null)
				sb.append(line);
		} catch (SocketTimeoutException e) {
			logger.info("连接超时");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
}