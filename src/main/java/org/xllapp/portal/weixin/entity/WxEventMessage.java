package org.xllapp.portal.weixin.entity;

import com.ffcs.icity.mvc.entity.IdEntity;
import java.util.Date;

public class WxEventMessage extends IdEntity {

	private static final long serialVersionUID = -936465865390830674L;

	private String event;
    
    private String description;
    
    private Integer messageId;
    
    private Date createTime;
    

    public String getEvent() {
        return this.event;
    }

    public void setEvent(String event) {
        this.event = event;
    }
    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    public Integer getMessageId() {
        return this.messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }
    public Date getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}