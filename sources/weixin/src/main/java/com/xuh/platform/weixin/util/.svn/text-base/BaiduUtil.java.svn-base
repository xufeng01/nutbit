package com.xuh.platform.weixin.util;


import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import net.sf.json.JSONObject;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.google.gson.Gson;
import com.xuh.platform.weixin.vo.common.BaiduPlace;
import com.xuh.platform.weixin.vo.common.TranslateResult;
import com.xuh.platform.weixin.vo.common.UserLocation;

/**
 * 百度工具
 * @author xufeng
 * @date 2014.8.30
 */
public class BaiduUtil {
	/**
	 * 发起http请求获取返回结果
	 * 
	 * @param requestUrl 请求地址
	 * @return
	 */
	public static String httpRequest(String requestUrl) {
		StringBuffer buffer = new StringBuffer();
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection httpUrlConn = (HttpURLConnection) url.openConnection();

			httpUrlConn.setDoOutput(false);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);

			httpUrlConn.setRequestMethod("GET");
			httpUrlConn.connect();

			// 将返回的输入流转换成字符串
			InputStream inputStream = httpUrlConn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			bufferedReader.close();
			inputStreamReader.close();
			// 释放资源
			inputStream.close();
			inputStream = null;
			httpUrlConn.disconnect();

		} catch (Exception e) {
		}
		return buffer.toString();
	}

	/**
	 * utf编码
	 * 
	 * @param source
	 * @return
	 */
	public static String urlEncodeUTF8(String source) {
		String result = source;
		try {
			result = java.net.URLEncoder.encode(source, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 翻译（中->英 英->中 日->中 ）
	 * 
	 * @param source
	 * @return
	 */
	public static String translate(String source) {
		String dst = null;

		// 组装查询地址
		String requestUrl = "http://openapi.baidu.com/public/2.0/bmt/translate?client_id=bm2FiTzH2WFHWlZdcLWHeO9R&q={keyWord}&from=auto&to=auto";
		// 对参数q的值进行urlEncode utf-8编码
		requestUrl = requestUrl.replace("{keyWord}", urlEncodeUTF8(source));

		// 查询并解析结果
		try {
			// 查询并获取返回结果
			String json = httpRequest(requestUrl);
			// 通过Gson工具将json转换成TranslateResult对象
			TranslateResult translateResult = new Gson().fromJson(json, TranslateResult.class);
			// 取出translateResult中的译文
			dst = translateResult.getTrans_result().get(0).getDst();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (null == dst)
			dst = "翻译系统异常，请稍候尝试！";
		return dst;
	}
	
	/**
	 * Q译通使用指南
	 * 
	 * @return
	 */
	public static String getTranslateUsage() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("微译使用指南").append("\n\n");
		buffer.append("微译为用户提供专业的多语言翻译服务，目前支持以下翻译方向：").append("\n");
		buffer.append("    中 -> 英").append("\n");
		buffer.append("    英 -> 中").append("\n");
		buffer.append("    日 -> 中").append("\n\n");
		buffer.append("使用示例：").append("\n");
		buffer.append("    翻译我是中国人").append("\n");
		buffer.append("    翻译dream").append("\n");
		buffer.append("    翻译さようなら").append("\n\n");
		buffer.append("回复“?”显示主菜单");
		return buffer.toString();
	}
	
	/**
	 * 百度地图查询
	 * @param query
	 * @param lng
	 * @param lat
	 * @return
	 * @throws Exception
	 */
	public static List<BaiduPlace> searchPlace(String query,String lng,String lat) throws Exception{
		String requestUrl="http://api.map.baidu.com/place/v2/search?&q=QUERY&location=LAT,LNG&output=xml&scope=2&page_size10&ak=874E2e0902803ae29f1cdf762629432b";
		requestUrl=requestUrl.replace("QUERY", urlEncodeUTF8(query));
		requestUrl=requestUrl.replace("LAT", lat);
		requestUrl=requestUrl.replace("LNG", lng);
		String respXml=httpRequest(requestUrl);
		List<BaiduPlace> placeList=parsePlaceXml(respXml);
		return placeList;
	}
	
	/**
	 * 解析百度地图返回的xml
	 * @param xml
	 * @return
	 */
	private static List<BaiduPlace> parsePlaceXml(String xml){
		List<BaiduPlace> placeList=null;
		try {
			Document document=DocumentHelper.parseText(xml);
			Element root=document.getRootElement();
			Element resultsElement=root.element("results");
			@SuppressWarnings("unchecked")
			List<Element> resultElementList=resultsElement.elements("result");
			if(resultElementList!=null&&resultElementList.size()>0){
				placeList=new ArrayList<BaiduPlace>();
				Element nameElement=null;//POI名称
				Element addressElement=null;//POI地址
				Element locationElement=null;//POI经纬度
				Element telephoneElement=null;//POI电话
				Element detailInfoElement=null;//POI扩展信息
				Element distanceElement=null;//POI距离
				
				for(Element resultElement:resultElementList){
					nameElement=resultElement.element("name");
					addressElement=resultElement.element("address");
					locationElement=resultElement.element("location");
					telephoneElement=resultElement.element("telephone");
					detailInfoElement=resultElement.element("detail_info");
					
					BaiduPlace place=new BaiduPlace();
					place.setName(nameElement.getText());
					place.setAddress(addressElement.getText());
					place.setLng(locationElement.element("lng").getText());
					place.setLat(locationElement.element("lat").getText());
					if(telephoneElement!=null){
						place.setTelephone(telephoneElement.getText());
					}
					if(detailInfoElement!=null){
						distanceElement=detailInfoElement.element("distance");
						if(distanceElement!=null){
							place.setDistance(Integer.parseInt(distanceElement.getText()));
						}
					}
					placeList.add(place);
				}
				Collections.sort(placeList);//按距离有近及远排序
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return placeList;
	}
	
	/**
	 * 将微信定位的坐标转换成百度坐标(GCJ-02->Baidu)
	 * @param lng
	 * @param lat
	 * @return
	 */
	public static UserLocation convertCoord(String lng,String lat){
		String convertUrl="http://api.map.baidu.com/geoconv/v1/?coords={x},{y}&from=3&to=5&ak=874E2e0902803ae29f1cdf762629432b";
		convertUrl=convertUrl.replace("{x}", lng);
		convertUrl=convertUrl.replace("{y}", lat);
		UserLocation location=null;
		try {
			location=new UserLocation();
			String jsonCoord=httpRequest(convertUrl);
			JSONObject jsonObject=JSONObject.fromObject(jsonCoord).getJSONArray("result").getJSONObject(0);
			location.setBd09Lng(jsonObject.getString("x"));
			location.setBd09Lat(jsonObject.getString("y"));
		} catch (Exception e) {
			location=null;
			e.printStackTrace();
		}
		return location;
	}
	
}
