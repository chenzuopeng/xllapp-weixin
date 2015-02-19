package org.xllapp.portal.weixin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ffcs.icity.mvc.controller.SimpleController;
import com.ffcs.icity.mvc.dao.CRUDDao;

import org.xllapp.portal.weixin.dao.WxChatLogDao;
import org.xllapp.portal.weixin.entity.WxChatLog;


@RequestMapping("wxChatLog")
@Controller
public class WxChatLogController extends SimpleController<WxChatLog>{

	private WxChatLogDao wxChatLogDao;
	
	@Override
	protected CRUDDao<WxChatLog> getDao() {
		return this.wxChatLogDao;
	}

	@Autowired
	public void setWxChatLogDao(WxChatLogDao wxChatLogDao) {
		this.wxChatLogDao = wxChatLogDao;
	}
	
}
