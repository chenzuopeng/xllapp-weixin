package org.xllapp.portal.weixin.entity;

import com.ffcs.icity.mvc.entity.IdEntity;
import java.util.Date;

public class WxMessageArticle extends IdEntity {

	private static final long serialVersionUID = -3386612893372783996L;

	private Integer messageId;
    
    private String articleTitle;
    
    private String articleDescription;
    
    private String articlePic;
    
    private String articleUrl;
    
    private Integer orderNo;
    
    private Date createTime;
    

    public Integer getMessageId() {
        return this.messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }
    public String getArticleTitle() {
        return this.articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }
    public String getArticleDescription() {
        return this.articleDescription;
    }

    public void setArticleDescription(String articleDescription) {
        this.articleDescription = articleDescription;
    }
    public String getArticlePic() {
        return this.articlePic;
    }

    public void setArticlePic(String articlePic) {
        this.articlePic = articlePic;
    }
    public String getArticleUrl() {
        return this.articleUrl;
    }

    public void setArticleUrl(String articleUrl) {
        this.articleUrl = articleUrl;
    }
    public Integer getOrderNo() {
        return this.orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }
    public Date getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}