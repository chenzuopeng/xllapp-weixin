package org.xllapp.portal.weixin.entity;

import com.ffcs.icity.mvc.entity.IdEntity;
import java.util.Date;

public class WxKeyword extends IdEntity {

	private static final long serialVersionUID = -4831115790518173051L;

	private String keyword;
    
    private Integer messageId;
    
    private String description;
    
    private Date createTime;
    

    public String getKeyword() {
        return this.keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
    public Integer getMessageId() {
        return this.messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }
    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    public Date getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}