package org.xllapp.portal.weixin.api;

import me.chanjar.weixin.mp.bean.WxMpXmlMessage;

/**
 *
 *
 * @Copyright: Copyright (c) 2014 FFCS All Rights Reserved 
 * @Company: 北京福富软件有限公司 
 * @author 陈作朋 Dec 18, 2014
 * @version 1.00.00
 * @history:
 * 
 */
public class WxMpXmlMessageWrapper extends WxMpXmlMessage {
	
    private WxMpXmlMessage inMessage;
    
    private String rawRequestBody;
    
	public WxMpXmlMessageWrapper(WxMpXmlMessage inMessage, String rawRequestBody) {
		super();
		this.inMessage = inMessage;
		this.rawRequestBody = rawRequestBody;
	}

	@Override
	public String getToUserName() {
		return this.inMessage.getToUserName();
	}

	@Override
	public Long getCreateTime() {
		return this.inMessage.getCreateTime();
	}

	@Override
	public String getMsgType() {
		return this.inMessage.getMsgType();
	}

	@Override
	public String getContent() {
		return this.inMessage.getContent();
	}

	@Override
	public Long getMsgId() {
		return this.inMessage.getMsgId();
	}

	@Override
	public String getPicUrl() {
		return this.inMessage.getPicUrl();
	}

	@Override
	public String getMediaId() {
		return this.inMessage.getMediaId();
	}

	@Override
	public String getFormat() {
		return this.inMessage.getFormat();
	}

	@Override
	public String getThumbMediaId() {
		return this.inMessage.getThumbMediaId();
	}

	@Override
	public Double getLocationX() {
		return this.inMessage.getLocationX();
	}

	@Override
	public Double getLocationY() {
		return this.inMessage.getLocationY();
	}

	@Override
	public Double getScale() {
		return this.inMessage.getScale();
	}

	@Override
	public String getLabel() {
		return this.inMessage.getLabel();
	}

	@Override
	public String getTitle() {
		return this.inMessage.getTitle();
	}

	@Override
	public String getDescription() {
		return this.inMessage.getDescription();
	}

	@Override
	public String getUrl() {
		return this.inMessage.getUrl();
	}

	@Override
	public String getEvent() {
		return this.inMessage.getEvent();
	}

	@Override
	public String getEventKey() {
		return this.inMessage.getEventKey();
	}

	@Override
	public String getTicket() {
		return this.inMessage.getTicket();
	}

	@Override
	public Double getLatitude() {
		return this.inMessage.getLatitude();
	}

	@Override
	public Double getLongitude() {
		return this.inMessage.getLongitude();
	}

	@Override
	public Double getPrecision() {
		return this.inMessage.getPrecision();
	}

	@Override
	public String getRecognition() {
		return this.inMessage.getRecognition();
	}

	@Override
	public String getFromUserName() {
		return this.inMessage.getFromUserName();
	}

	@Override
	public String getStatus() {
		return this.inMessage.getStatus();
	}

	@Override
	public Integer getTotalCount() {
		return this.inMessage.getTotalCount();
	}

	@Override
	public Integer getFilterCount() {
		return this.inMessage.getFilterCount();
	}

	@Override
	public Integer getSentCount() {
		return this.inMessage.getSentCount();
	}

	@Override
	public Integer getErrorCount() {
		return this.inMessage.getErrorCount();
	}

	@Override
	public ScanCodeInfo getScanCodeInfo() {
		return this.inMessage.getScanCodeInfo();
	}

	@Override
	public SendPicsInfo getSendPicsInfo() {
		return this.inMessage.getSendPicsInfo();
	}

	@Override
	public SendLocationInfo getSendLocationInfo() {
		return this.inMessage.getSendLocationInfo();
	}

	public WxMpXmlMessage getInMessage() {
		return inMessage;
	}

	public void setInMessage(WxMpXmlMessage inMessage) {
		this.inMessage = inMessage;
	}

	public String getRawRequestBody() {
		return rawRequestBody;
	}

	public void setRawRequestBody(String rawRequestBody) {
		this.rawRequestBody = rawRequestBody;
	}
    
}
