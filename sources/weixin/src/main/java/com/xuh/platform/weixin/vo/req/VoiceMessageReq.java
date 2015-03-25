package com.xuh.platform.weixin.vo.req;

/**
 * 音频消息
 * 
 * @author xufeng
 * @date 2014-08-29
 */
public class VoiceMessageReq extends BaseMessageReq {
	/**
	 * 媒体ID
	 */
	private String MediaId;
	
	/**
	 *  语音格式
	 */
	private String Format;

	public String getMediaId() {
		return MediaId;
	}

	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}

	public String getFormat() {
		return Format;
	}

	public void setFormat(String format) {
		Format = format;
	}
}
