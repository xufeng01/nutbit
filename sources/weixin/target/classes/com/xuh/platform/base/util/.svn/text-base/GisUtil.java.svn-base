package com.xuh.platform.base.util;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * GIS工具
 * @author xufeng
 * @date 2014.8.22
 */
public class GisUtil {

	public static final double EARTH_RADIUS = 6378.137;//地球半径
	
	/**
	 * 获得经纬度最大坐标和最小坐标，可以构成一个正方形
	 * @param radius
	 * @param x
	 * @param y
	 * @return
	 */
	public static Map<String, String> getGisParam(String radius, String x,
			String y) {
		Map<String, String> resultMap = new HashMap<String, String>();
		BigDecimal d_radius = new BigDecimal(radius);//半径
		BigDecimal d=new BigDecimal(getDistance(10.0,0.0,11.0,0.0));//1度=多少km
		BigDecimal r=d_radius.divide(d, 4, BigDecimal.ROUND_DOWN);//米转为度
		BigDecimal d_x = new BigDecimal(x);
		BigDecimal d_y = new BigDecimal(y);
		String minx = d_x.subtract(r).toString();
		String maxx = d_x.add(r).toString();
		String miny = d_y.subtract(r).toString();
		String maxy = d_y.add(r).toString();
		resultMap.put("minx", minx);
		resultMap.put("maxx", maxx);
		resultMap.put("miny", miny);
		resultMap.put("maxy", maxy);
		return resultMap;
	}

	/**
	 * 计算两坐标距离
	 * @param lat1
	 * @param lng1
	 * @param lat2
	 * @param lng2
	 * @return
	 */
	public static double getDistance(double lng1,double lat1,double lng2,double lat2){
		double radLat1 = rad(lat1);
		double radLat2 = rad(lat2);
		double a = radLat1 - radLat2;
		double b = rad(lng1) - rad(lng2);
		double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2)
				+ Math.cos(radLat1) * Math.cos(radLat2)
				* Math.pow(Math.sin(b / 2), 2)));
		s = s * EARTH_RADIUS;
		s = Math.round(s * 10000) / 10000.0;
		return s;
	}

	private static double rad(double d) {
		return d * Math.PI / 180.0;
	}
	
	/**
	 * 判断坐标是否在区域内
	 * @param radius
	 * @param lng1
	 * @param lat1
	 * @param lng2
	 * @param lat2
	 * @return
	 */
	public static boolean isInArea(double radius,double lng1,double lat1,double lng2,double lat2){
		double d1=getDistance(lng1, lat1, lng2, lat2);
		if(d1-radius<=0){
			return true;
		}else{
			return false;
		}
	}
	
}
