package org.xllapp.portal.weixin.entity;

import com.ffcs.icity.mvc.entity.IdEntity;
import java.util.Date;

public class WxChatLog extends IdEntity {

	private static final long serialVersionUID = 6822681749268788009L;
	
	public final static int SENDER_USER = 0;

	public final static int SENDER_PLATFORM = 1;
	
	public final static String MESSAGE_TYPE_PRESET = "0";
	
	public final static String MESSAGE_TYPE_TEMP = "1";

	private String appId;
    
    private Integer sender;
    
    private String openId;
    
    private String messageType;
    
    private String content;
    
    private String messageId;
    
    private Date sendTime;
    
    private WxSubscribeAccount account;
    

    public String getAppId() {
        return this.appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }
    public Integer getSender() {
        return this.sender;
    }

    public void setSender(Integer sender) {
        this.sender = sender;
    }
    public String getOpenId() {
        return this.openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }
    
    public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    public String getMessageId() {
        return this.messageId;
    }

    public void setMessageId(String messageId) {
        this.messageId = messageId;
    }
    public Date getSendTime() {
        return this.sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

	public WxSubscribeAccount getAccount() {
		return account;
	}

	public void setAccount(WxSubscribeAccount account) {
		this.account = account;
	}

}