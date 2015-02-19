package org.xllapp.portal.weixin.entity;

import com.ffcs.icity.mvc.entity.IdEntity;
import java.util.Date;

public class WxLog extends IdEntity {

	private static final long serialVersionUID = -7339142859323919724L;
	
	public static final int RESULT_SUCCESS=0;
	
	public static final int RESULT_FAILURE=1;
	
	private String msgId;

	private String toUserName;
    
    private String fromUserName;
    
    private String msgType;
    
    private String inMessage;
    
    private String outMessage;
    
    private Integer result;
    
    private String error;
    
    private Date createTime;
    
    public String getMsgId() {
		return msgId;
	}

	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}

	public String getToUserName() {
        return this.toUserName;
    }

    public void setToUserName(String toUserName) {
        this.toUserName = toUserName;
    }
    public String getFromUserName() {
        return this.fromUserName;
    }

    public void setFromUserName(String fromUserName) {
        this.fromUserName = fromUserName;
    }
    public String getMsgType() {
        return this.msgType;
    }

    public void setMsgType(String msgType) {
        this.msgType = msgType;
    }
    public String getInMessage() {
        return this.inMessage;
    }

    public void setInMessage(String inMessage) {
        this.inMessage = inMessage;
    }
    public String getOutMessage() {
        return this.outMessage;
    }

    public void setOutMessage(String outMessage) {
        this.outMessage = outMessage;
    }
    public Integer getResult() {
        return this.result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }
    public String getError() {
        return this.error;
    }

    public void setError(String error) {
        this.error = error;
    }
    public Date getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}