package org.xllapp.portal.weixin.dao;

import java.util.List;

import org.xllapp.portal.weixin.entity.WxMessage;

import com.ffcs.icity.mvc.dao.CRUDDao;
import com.ffcs.icity.mybatis.MyBatisRepository;

@MyBatisRepository
public interface WxMessageDao extends CRUDDao<WxMessage> {

	List<WxMessage> getMessageNames();

}