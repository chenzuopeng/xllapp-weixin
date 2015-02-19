package org.xllapp.portal.weixin.dao;

import com.ffcs.icity.mvc.dao.CRUDDao;
import com.ffcs.icity.mybatis.MyBatisRepository;

import org.xllapp.portal.weixin.entity.WxChatLog;

@MyBatisRepository
public interface WxChatLogDao extends CRUDDao<WxChatLog> {
	
}