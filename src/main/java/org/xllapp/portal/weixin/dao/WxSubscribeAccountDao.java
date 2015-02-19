package org.xllapp.portal.weixin.dao;

import com.ffcs.icity.mvc.dao.CRUDDao;
import com.ffcs.icity.mybatis.MyBatisRepository;

import org.xllapp.portal.weixin.entity.WxSubscribeAccount;

@MyBatisRepository
public interface WxSubscribeAccountDao extends CRUDDao<WxSubscribeAccount> {
	
	public WxSubscribeAccount findByOpenId(String openId);
	
}