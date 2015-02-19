package org.xllapp.portal.weixin.entity;

import com.ffcs.icity.mvc.entity.IdEntity;
import java.util.Date;

public class WxMessage extends IdEntity {

	private static final long serialVersionUID = -2437787664582687828L;
	
	public static final String MESSAGE_TYPE_TEXT="text";
	
	public static final String MESSAGE_TYPE_NEWS="news";
	
	public static final String MESSAGE_TYPE_IMAGE="image";
	
	public static final String MESSAGE_TYPE_VOICE="voice";
	
	public static final String MESSAGE_TYPE_VIDEO="video";
	
	public static final String MESSAGE_TYPE_MUSIC="music";
	
	private String messageType;
    
    private String messageName;
    
    private String messageContent;
    
    private String messageMedia;
    
    private String messageTitle;
    
    private String messageDescription;
    
    private String messageHqMedia;
    
    private String messageThumb;
    
    private Date createTime;
    
    public String getMessageType() {
        return this.messageType;
    }

    public void setMessageType(String messageType) {
        this.messageType = messageType;
    }
    public String getMessageName() {
        return this.messageName;
    }

    public void setMessageName(String messageName) {
        this.messageName = messageName;
    }
    public String getMessageContent() {
        return this.messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }
    public String getMessageMedia() {
        return this.messageMedia;
    }

    public void setMessageMedia(String messageMedia) {
        this.messageMedia = messageMedia;
    }
    public String getMessageTitle() {
        return this.messageTitle;
    }

    public void setMessageTitle(String messageTitle) {
        this.messageTitle = messageTitle;
    }
    public String getMessageDescription() {
        return this.messageDescription;
    }

    public void setMessageDescription(String messageDescription) {
        this.messageDescription = messageDescription;
    }
    public String getMessageHqMedia() {
        return this.messageHqMedia;
    }

    public void setMessageHqMedia(String messageHqMedia) {
        this.messageHqMedia = messageHqMedia;
    }
    public String getMessageThumb() {
        return this.messageThumb;
    }

    public void setMessageThumb(String messageThumb) {
        this.messageThumb = messageThumb;
    }
    public Date getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}