package org.xllapp.portal.weixin.dao;

import java.util.List;

import org.xllapp.portal.weixin.entity.WxKeyword;
import org.xllapp.portal.weixin.entity.WxMessage;
import org.xllapp.portal.weixin.entity.WxMessageArticle;

import com.ffcs.icity.mybatis.MyBatisRepository;

/**
 *
 *
 * @Copyright: Copyright (c) 2014 FFCS All Rights Reserved 
 * @Company: 北京福富软件有限公司 
 * @author 陈作朋 Dec 15, 2014
 * @version 1.00.00
 * @history:
 * 
 */
@MyBatisRepository
public interface WxMessageHandlerDao {
	
	public WxMessage getMessageOfSubscribeEvent();
	
	public WxMessage getMessageOfDefault();
	
	public WxMessage getMessageOfMenuEvent(String key);
	
	public WxMessage getMessageById(long id);
	
	public List<WxKeyword> getKeywords();

	public List<WxMessageArticle> getMessageArticles(long messageId);
	
}
