package com.xuh.platform.weixin.vo.common;

/**
 * 百度位置
 * @author xufeng
 * @date 2014.8.31
 */
public class BaiduPlace implements Comparable<BaiduPlace>{
	
	/**
	 * 名称
	 */
	private String name;
	
	/**
	 * 详细地址
	 */
	private String address;
	
	/**
	 * 经度
	 */
	private String lng;
	
	/**
	 * 纬度
	 */
	private String lat;
	
	/**
	 * 距离
	 */
	private int distance;
	
	/**
	 * 电话
	 */
	private String telephone;
	
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getLng() {
		return lng;
	}


	public void setLng(String lng) {
		this.lng = lng;
	}


	public String getLat() {
		return lat;
	}


	public void setLat(String lat) {
		this.lat = lat;
	}


	public int getDistance() {
		return distance;
	}


	public void setDistance(int distance) {
		this.distance = distance;
	}


	public String getTelephone() {
		return telephone;
	}


	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}


	public int compareTo(BaiduPlace baiduPlace) {
		return this.distance-baiduPlace.getDistance();
	}

}
