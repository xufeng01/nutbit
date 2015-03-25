package com.xuh.platform.weixin.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * URL工具类
 * @author xufeng
 * @date 2015.3.11
 *
 */
public class OAuthCodeUtil {
    
    /**
     * 网页获取code
     */
    public static String oauth2_code_url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
    
    public static String getCodeRequest(){
		try {
			String url="http://www.nutbit.net/detail";
			String appid="wx6bf7e8013f0f64d8";
			oauth2_code_url  = oauth2_code_url.replace("APPID", urlEncodeUTF8(appid));
			oauth2_code_url  = oauth2_code_url.replace("REDIRECT_URI",urlEncodeUTF8(url));
		} catch (Exception e) {
			e.printStackTrace();
		}
        return oauth2_code_url;

    }
    /**
     * URL编码(utf-8)
     * @param str
     * @return
     */
    public static String urlEncodeUTF8(String str){
    	String result=null;
    	try {
			result=URLEncoder.encode(str, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
    	return result;
    }
    
    public static void main(String[] args) {
    	System.out.println(getCodeRequest());

	}
}
