package com.xuh.platform.weixin.util;


import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.URL;
import java.util.Date;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.xuh.platform.base.constants.Constants;
import com.xuh.platform.base.util.SpringUtil;
import com.xuh.platform.base.util.UUIDGenerator;
import com.xuh.platform.module.account.entity.WxBaseAccount;
import com.xuh.platform.weixin.entity.WxAdvOauth2Token;
import com.xuh.platform.weixin.entity.WxAdvUser;
import com.xuh.platform.weixin.entity.WxBaseToken;
import com.xuh.platform.weixin.service.WxBaseTokenService;


/**
 * 公众平台通用接口工具类
* 
 * @author xufeng
 * @date 2014-09-23
 */
public class WeixinUtil {
	
	private static Logger logger = Logger.getLogger(WeixinUtil.class);
	
	/**
	 * 获取access_token的接口地址（GET） 限200（次/天）
	 */
	public final static String access_token_url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	
	/**
	 *  菜单创建（POST） 限100（次/天）
	 */
    public static String menu_create_url = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
    
    /**
     * 客服接口地址
     */
    public static String send_message_url = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN";

    /**
     * 生成二维码ticket
     */
    public static String qrcode_ticket_url="https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
    
    /**
     * 获得二维码图片
     */
    public static String qrcode_image_url="https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=TICKET";

    /**
     * 网页获取access_token
     */
    public static String oauth2_access_token_url="https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=APPSECRET&code=CODE&grant_type=authorization_code";
    
    /**
     * 网页刷新access_token
     */
    public static String oauth2_refresh_token_url="https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=APPID&grant_type=refresh_token&refresh_token=REFRESH_TOKEN";
    
    /**
     * 网页用户信息
     */
    public static String oauth2_userinfo_url="https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
    
    
    public static String oauth2_validate_access_token_url="https://api.weixin.qq.com/sns/auth?access_token=ACCESS_TOKEN&openid=OPENID";
    /**
     * 发起https请求并获取结果
     * 
     * @param requestUrl 请求地址
     * @param requestMethod 请求方式（GET、POST）
     * @param outputStr 提交的数据
     * @return JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值)
     */
    public static JSONObject httpRequest(String requestUrl, String requestMethod, String outputStr) {
        JSONObject jsonObject = null;
        StringBuffer buffer = new StringBuffer();
        try {
                // 创建SSLContext对象，并使用我们指定的信任管理器初始化
                TrustManager[] tm = { new MyX509TrustManager() };
                SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
                sslContext.init(null, tm, new java.security.SecureRandom());
                // 从上述SSLContext对象中得到SSLSocketFactory对象
                SSLSocketFactory ssf = sslContext.getSocketFactory();

                URL url = new URL(requestUrl);
                HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();
                httpUrlConn.setSSLSocketFactory(ssf);

                httpUrlConn.setDoOutput(true);
                httpUrlConn.setDoInput(true);
                httpUrlConn.setUseCaches(false);
                // 设置请求方式（GET/POST）
                httpUrlConn.setRequestMethod(requestMethod);

                if ("GET".equalsIgnoreCase(requestMethod))
                        httpUrlConn.connect();

                // 当有数据需要提交时
                if (null != outputStr) {
                        OutputStream outputStream = httpUrlConn.getOutputStream();
                        // 注意编码格式，防止中文乱码
                        outputStream.write(outputStr.getBytes("UTF-8"));
                        outputStream.close();
                }

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
                jsonObject = JSONObject.fromObject(buffer.toString());
        } catch (ConnectException ce) {
        	logger.info("Weixin server connection timed out.");
        } catch (Exception e) {
        	logger.info("https request error:{}"+e.getMessage());
        }
        return jsonObject;
    }
    
    /**
     * 获取access_token
     * @param appid 凭证
    * @param appsecret 密钥
    * @return
     */
    public static WxBaseToken getAccessToken() {
		WxBaseAccount wxBaseAccount = (WxBaseAccount)SpringUtil.getSession().getAttribute(Constants.SESSION_WEIXIN_ACCOUNT);
		WxBaseTokenService wxBaseTokenService=(WxBaseTokenService)SpringUtil.getBean("wxBaseTokenService");
    	//数据库查询微信凭证
		WxBaseToken wxBaseToken;
		try {
			wxBaseToken = wxBaseTokenService.loadByAccountid(wxBaseAccount.getAccountid());
		} catch (Exception e1) {
			e1.printStackTrace();
			return null;
		}
    	
    	if(wxBaseToken!=null){
    		java.util.Date end = new java.util.Date();
    		java.util.Date start = wxBaseToken.getAddtime();
        	if(end.getTime()-start.getTime()>wxBaseToken.getExpiresIn()*1000){//凭证已过期
                 String requestUrl = access_token_url.replace("APPID", wxBaseAccount.getAccountappid()).replace("APPSECRET", wxBaseAccount.getAccountappsecret());
                 JSONObject jsonObject = httpRequest(requestUrl, "GET", null);
                 // 如果请求成功
                 if (null != jsonObject) {
                     try {
                    	 wxBaseToken.setExpiresIn(jsonObject.getInt("expires_in"));
                    	 wxBaseToken.setAccessToken(jsonObject.getString("access_token"));
                    	 wxBaseTokenService.update(wxBaseToken);
                     } catch (Exception e) {
                    	 wxBaseToken = null;
                         // 获取token失败
                    	 e.printStackTrace();
                     }
                 }
        	}
        	return wxBaseToken;
    	}else{//数据库不存在凭证，第一次获取
    		
    		 String requestUrl = access_token_url.replace("APPID", wxBaseAccount.getAccountappid()).replace("APPSECRET", wxBaseAccount.getAccountappsecret());
             JSONObject jsonObject = httpRequest(requestUrl, "GET", null);
             // 如果请求成功
             if (null != jsonObject) {
                 try {
                	 wxBaseToken = new WxBaseToken();
                	 wxBaseToken.setAccessTokenId(UUIDGenerator.generate());
                	 wxBaseToken.setExpiresIn(jsonObject.getInt("expires_in"));
                	 wxBaseToken.setAccessToken(jsonObject.getString("access_token"));
                	 wxBaseToken.setAccountid(wxBaseAccount.getAccountid());
                	 wxBaseToken.setAddtime(new Date());
                	 wxBaseTokenService.save(wxBaseToken);
                 } catch (Exception e) {
                	 wxBaseToken = null;
                     // 获取token失败
                	 e.printStackTrace();
                 }
             }
             return wxBaseToken;
    	}
    }
    
    /**
     * 获得网页授权凭证
     * @param appid
     * @param appsecret
     * @param code
     * @return
     */
    public static WxAdvOauth2Token getOauth2AccessToken(String appid,String appsecret,String code){
    	WxAdvOauth2Token token=null;
    	String url=oauth2_access_token_url.replace("APPID", appid).replace("APPSECRET", appsecret).replace("CODE", code);
    	JSONObject jsonObject=httpRequest(url, "GET", null);
    	if(jsonObject!=null){
    		token=new WxAdvOauth2Token();
    		token.setAccessToken(jsonObject.getString("access_token"));
    		token.setExpiresIn(jsonObject.getString("expires_in"));
    		token.setRefreshToken(jsonObject.getString("refresh_token"));
    		token.setOpenid(jsonObject.getString("openid"));
    		token.setScope(jsonObject.getString("scope"));
    		return token;
    	}else{
    		return null;
    	}
    }
    
    
    /**
     * 刷新网页授权凭证
     * @param appid
     * @param appsecret
     * @param code
     * @return
     */
    public static WxAdvOauth2Token refreshOauth2AccessToken(String appid,String refreshToken){
    	WxAdvOauth2Token token=null;
    	String url=oauth2_refresh_token_url.replace("APPID", appid).replace("REFRESH_TOKEN", refreshToken);
    	JSONObject jsonObject=httpRequest(url, "GET", null);
    	if(jsonObject!=null){
    		token=new WxAdvOauth2Token();
    		token.setAccessToken(jsonObject.getString("access_token"));
    		token.setExpiresIn(jsonObject.getString("expires_in"));
    		token.setRefreshToken(jsonObject.getString("refresh_token"));
    		token.setOpenid(jsonObject.getString("openid"));
    		token.setScope(jsonObject.getString("scope"));
    		return token;
    	}else{
    		return null;
    	}
    }
    
    @SuppressWarnings("unchecked")
	public static WxAdvUser getWxAdvUser(String accessToken,String openid){
    	WxAdvUser user=null;
    	//拼接请求地址
    	String requestUrl = oauth2_userinfo_url.replace("ACCESS_TOKEN", accessToken).replace("OPENID", openid);
    	JSONObject jsonObject=httpRequest(requestUrl, "GET", null);
    	if(jsonObject!=null){
    		user=new WxAdvUser();
    		user.setOpenid(jsonObject.getString("openid"));
    		user.setNickname(jsonObject.getString("nickname"));
    		user.setSex(jsonObject.getInt("sex"));
    		user.setCountry(jsonObject.getString("country"));
    		user.setProvince(jsonObject.getString("province"));
    		user.setCity(jsonObject.getString("city"));
    		user.setHeadImgUrl(jsonObject.getString("headimgurl"));
    		user.setPrivilegeList(JSONArray.toList(jsonObject.getJSONArray("privilege"),List.class));
    		return user;
    	}else{
    		return null;
    	}
    	
    }
    
}