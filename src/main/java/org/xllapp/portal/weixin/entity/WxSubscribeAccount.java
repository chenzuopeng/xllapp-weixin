package org.xllapp.portal.weixin.entity;

import com.ffcs.icity.mvc.entity.IdEntity;
import java.util.Date;

public class WxSubscribeAccount extends IdEntity {

	private static final long serialVersionUID = -6354171853357920099L;
	
	public static final int STATUS_SUBSCRIBE = 1;
	
	public static final int STATUS_UNSUBSCRIBE = 0;

	private String openId;
    
    private String nickname;
    
    private String sex;
    
    private String city;
    
    private String province;
    
    private String country;
    
    private String language;
    
    private String headImgUrl;
    
    private String unionId;
    
    private Integer subscribe;
    
    private Date subscribeTime;
    
    private Date unsubscribeTime;
    
    private Date createTime;
    

    public String getOpenId() {
        return this.openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }
    public String getNickname() {
        return this.nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    public String getSex() {
        return this.sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    public String getProvince() {
        return this.province;
    }

    public void setProvince(String province) {
        this.province = province;
    }
    public String getCountry() {
        return this.country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
    
    public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getHeadImgUrl() {
        return this.headImgUrl;
    }

    public void setHeadImgUrl(String headImgUrl) {
        this.headImgUrl = headImgUrl;
    }
    public Date getSubscribeTime() {
        return this.subscribeTime;
    }

    public void setSubscribeTime(Date subscribeTime) {
        this.subscribeTime = subscribeTime;
    }
    public String getUnionId() {
        return this.unionId;
    }

    public void setUnionId(String unionId) {
        this.unionId = unionId;
    }
    public Integer getSubscribe() {
        return this.subscribe;
    }

    public void setSubscribe(Integer subscribe) {
        this.subscribe = subscribe;
    }
    
    public Date getUnsubscribeTime() {
		return unsubscribeTime;
	}

	public void setUnsubscribeTime(Date unsubscribeTime) {
		this.unsubscribeTime = unsubscribeTime;
	}

	public Date getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}