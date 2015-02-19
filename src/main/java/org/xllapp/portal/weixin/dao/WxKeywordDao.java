package org.xllapp.portal.weixin.dao;

import com.ffcs.icity.mvc.dao.CRUDDao;
import com.ffcs.icity.mybatis.MyBatisRepository;

import org.xllapp.portal.weixin.entity.WxKeyword;

@MyBatisRepository
public interface WxKeywordDao extends CRUDDao<WxKeyword> {
	
}