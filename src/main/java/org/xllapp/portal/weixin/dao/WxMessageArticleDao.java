package org.xllapp.portal.weixin.dao;

import com.ffcs.icity.mvc.dao.CRUDDao;
import com.ffcs.icity.mybatis.MyBatisRepository;

import org.xllapp.portal.weixin.entity.WxMessageArticle;

@MyBatisRepository
public interface WxMessageArticleDao extends CRUDDao<WxMessageArticle> {
	
}